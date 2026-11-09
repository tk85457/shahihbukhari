import 'dart:async';
import 'package:flutter/foundation.dart' show kDebugMode, debugPrint;
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' show Database, Sqflite;
import 'isar_models.dart';
import '../database/app_database.dart';

/// Search index (Isar). The source of truth for hadith data is SQLite; Isar only
/// holds a copy of chapters + hadiths so full-text style search is fast.
class IsarService {
  static final IsarService instance = IsarService._init();

  /// Rows copied per batch. Small batches keep every Dart event-loop slice
  /// short, so touch/draw events are never starved on low-end phones.
  static const int _batchSize = 250;

  Isar? _isar;
  Future<Isar>? _opening;

  IsarService._init();

  /// Opens Isar exactly once. Concurrent callers (splash warm-up, search, ...)
  /// all share the same in-flight future, so the import can never run twice.
  /// A failed attempt is forgotten so the next call can retry.
  Future<Isar> get db {
    final ready = _isar;
    if (ready != null) return Future<Isar>.value(ready);
    return _opening ??= _openOnce();
  }

  Future<Isar> _openOnce() async {
    try {
      final isar = await _initIsar();
      _isar = isar;
      return isar;
    } catch (e) {
      _opening = null; // allow a clean retry on the next call
      rethrow;
    }
  }

  /// Completes when the Isar warm-up (which includes the long first-launch
  /// import) has finished, failed, or [timeout] passed. Never throws.
  /// Returns immediately if no warm-up is running.
  Future<void> whenWarmupDone({
    Duration timeout = const Duration(seconds: 60),
  }) async {
    final opening = _opening;
    if (opening == null) return;
    try {
      await opening.timeout(timeout);
    } catch (_) {
      // Failure/timeout is handled by whoever awaits `db`; we only wait here.
    }
  }

  Future<Isar> _initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        IsarChapterSchema,
        IsarHadithSchema,
        IsarBookmarkSchema,
        IsarHadithCollectionSchema,
        IsarNoteSchema,
        IsarReadingProgressSchema,
      ],
      directory: dir.path,
      inspector: kDebugMode,
    );

    await _ensureCatalogImported(isar);
    return isar;
  }

  /// Makes sure Isar holds the COMPLETE catalog.
  ///
  /// Old logic ("import only if Isar is empty") left search permanently
  /// incomplete when the app was closed in the middle of the first import.
  /// Now we compare the Isar count with SQLite and redo a clean import when
  /// they differ (missing OR partial). Complete installs are untouched.
  Future<void> _ensureCatalogImported(Isar isar) async {
    final sqlite = await AppDatabase.instance.database;
    final expected =
        Sqflite.firstIntValue(
          await sqlite.rawQuery('SELECT COUNT(*) FROM hadiths'),
        ) ??
        0;
    if (expected == 0) return; // nothing to index

    final imported = await isar.isarHadiths.count();
    if (imported == expected) return; // already complete

    debugPrint(
      'Isar catalog incomplete ($imported/$expected). Re-importing cleanly.',
    );
    await _importCatalog(isar, sqlite);
  }

  Future<void> _importCatalog(Isar isar, Database sqlite) async {
    // Clean slate: leftovers of an interrupted import would otherwise violate
    // the unique sqliteId index.
    await isar.writeTxn(() async {
      await isar.isarHadiths.clear();
      await isar.isarChapters.clear();
    });

    final chaptersRaw = await sqlite.query('chapters');
    final chapters = chaptersRaw
        .map(
          (e) => IsarChapter()
            ..sqliteId = e['id'] as int
            ..bookNumber = e['book_number'] as int
            ..titleArabic = e['title_arabic'] as String
            ..titleUrdu = e['title_urdu'] as String
            ..titleEnglish = e['title_english'] as String
            ..hadithCount = e['hadith_count'] as int,
        )
        .toList();
    await isar.writeTxn(() => isar.isarChapters.putAll(chapters));

    // Keyset pagination (id > last) instead of OFFSET: every batch costs the
    // same instead of re-scanning all previous rows.
    var lastId = 0;
    while (true) {
      final rows = await sqlite.query(
        'hadiths',
        where: 'id > ?',
        whereArgs: [lastId],
        orderBy: 'id ASC',
        limit: _batchSize,
      );
      if (rows.isEmpty) break;

      final batch = rows
          .map(
            (e) => IsarHadith()
              ..sqliteId = e['id'] as int
              ..chapterId = e['chapter_id'] as int
              ..hadithNumber = e['hadith_number'].toString()
              ..arabicText = e['arabic_text'] as String
              ..urduText = e['urdu_text'] as String
              ..englishText = e['english_text'] as String
              ..isPrimary = (e['is_primary'] as int? ?? 1) == 1
              ..parentId = e['parent_id'] as int?,
          )
          .toList();
      await isar.writeTxn(() => isar.isarHadiths.putAll(batch));

      lastId = rows.last['id'] as int;

      // Give the UI isolate a breather between batches so input events and
      // frames are processed (this is what prevents the Dart-side ANR).
      await Future<void>.delayed(const Duration(milliseconds: 4));
    }
  }

  // --- Search ---
  Future<List<IsarHadith>> search(
    String query, {
    int limit = 50,
    int offset = 0,
    String language = 'both',
    bool onlyPrimary = false,
  }) async {
    final isar = await db;
    if (query.isEmpty) return [];

    if (language == 'Urdu Translation') {
      if (onlyPrimary) {
        return isar.isarHadiths
            .filter()
            .isPrimaryEqualTo(true)
            .and()
            .group(
              (q) => q
                  .urduTextContains(query, caseSensitive: false)
                  .or()
                  .hadithNumberEqualTo(query),
            )
            .sortByHadithNumber()
            .offset(offset)
            .limit(limit)
            .findAll();
      }
      return isar.isarHadiths
          .filter()
          .urduTextContains(query, caseSensitive: false)
          .or()
          .hadithNumberEqualTo(query)
          .sortByHadithNumber()
          .offset(offset)
          .limit(limit)
          .findAll();
    }

    if (language == 'English') {
      if (onlyPrimary) {
        return isar.isarHadiths
            .filter()
            .isPrimaryEqualTo(true)
            .and()
            .group(
              (q) => q
                  .englishTextContains(query, caseSensitive: false)
                  .or()
                  .hadithNumberEqualTo(query),
            )
            .sortByHadithNumber()
            .offset(offset)
            .limit(limit)
            .findAll();
      }
      return isar.isarHadiths
          .filter()
          .englishTextContains(query, caseSensitive: false)
          .or()
          .hadithNumberEqualTo(query)
          .sortByHadithNumber()
          .offset(offset)
          .limit(limit)
          .findAll();
    }

    // Topic / Both / Arabic
    if (onlyPrimary) {
      return isar.isarHadiths
          .filter()
          .isPrimaryEqualTo(true)
          .and()
          .group(
            (q) => q
                .urduTextContains(query, caseSensitive: false)
                .or()
                .englishTextContains(query, caseSensitive: false)
                .or()
                .arabicTextContains(query, caseSensitive: false)
                .or()
                .hadithNumberEqualTo(query),
          )
          .sortByHadithNumber()
          .offset(offset)
          .limit(limit)
          .findAll();
    }
    return isar.isarHadiths
        .filter()
        .urduTextContains(query, caseSensitive: false)
        .or()
        .englishTextContains(query, caseSensitive: false)
        .or()
        .arabicTextContains(query, caseSensitive: false)
        .or()
        .hadithNumberEqualTo(query)
        .sortByHadithNumber()
        .offset(offset)
        .limit(limit)
        .findAll();
  }

  // FIX Bug 2: searchCount now correctly applies the onlyPrimary filter
  // Previously this filter was only in search(), missing from count()
  // Result: selecting "Primary Hadiths Only" showed incorrect count
  Future<int> searchCount(
    String query, {
    String language = 'both',
    bool onlyPrimary = false,
  }) async {
    final isar = await db;
    if (query.isEmpty) return 0;

    if (language == 'Urdu Translation') {
      if (onlyPrimary) {
        return isar.isarHadiths
            .filter()
            .isPrimaryEqualTo(true)
            .and()
            .group(
              (q) => q
                  .urduTextContains(query, caseSensitive: false)
                  .or()
                  .hadithNumberEqualTo(query),
            )
            .count();
      }
      return isar.isarHadiths
          .filter()
          .urduTextContains(query, caseSensitive: false)
          .or()
          .hadithNumberEqualTo(query)
          .count();
    }

    if (language == 'English') {
      if (onlyPrimary) {
        return isar.isarHadiths
            .filter()
            .isPrimaryEqualTo(true)
            .and()
            .group(
              (q) => q
                  .englishTextContains(query, caseSensitive: false)
                  .or()
                  .hadithNumberEqualTo(query),
            )
            .count();
      }
      return isar.isarHadiths
          .filter()
          .englishTextContains(query, caseSensitive: false)
          .or()
          .hadithNumberEqualTo(query)
          .count();
    }

    // Topic / Both / Arabic
    if (onlyPrimary) {
      return isar.isarHadiths
          .filter()
          .isPrimaryEqualTo(true)
          .and()
          .group(
            (q) => q
                .urduTextContains(query, caseSensitive: false)
                .or()
                .englishTextContains(query, caseSensitive: false)
                .or()
                .arabicTextContains(query, caseSensitive: false)
                .or()
                .hadithNumberEqualTo(query),
          )
          .count();
    }
    return isar.isarHadiths
        .filter()
        .urduTextContains(query, caseSensitive: false)
        .or()
        .englishTextContains(query, caseSensitive: false)
        .or()
        .arabicTextContains(query, caseSensitive: false)
        .or()
        .hadithNumberEqualTo(query)
        .count();
  }
}
