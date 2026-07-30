import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/models.dart';
import '../isar/isar_service.dart';
import '../database/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase.instance);
final isarServiceProvider = Provider<IsarService>(
  (ref) => IsarService.instance,
);

final hadithRepositoryProvider = Provider<HadithRepository>((ref) {
  return HadithRepository(
    ref.watch(databaseProvider),
    ref.watch(isarServiceProvider),
  );
});

final lastProgressProvider = FutureProvider<ReadingProgress?>((ref) async {
  final repo = ref.watch(hadithRepositoryProvider);
  return repo.getLastReadingProgress();
});

class HadithRepository {
  final AppDatabase _db;
  final IsarService _isar;
  HadithRepository(this._db, this._isar);

  // --- Chapters ---
  Future<List<Chapter>> getChapters() async {
    final db = await _db.database;
    final result = await db.query('chapters', orderBy: 'book_number ASC');
    return result.map((e) => Chapter.fromMap(e)).toList();
  }

  Future<int> getTotalChapterCount() async {
    final db = await _db.database;
    final result = await db.rawQuery('SELECT COUNT(*) as c FROM chapters');
    return result.first['c'] as int;
  }

  Future<Chapter?> getChapterById(int id) async {
    final db = await _db.database;
    final result = await db.query('chapters', where: 'id = ?', whereArgs: [id]);
    if (result.isEmpty) return null;
    return Chapter.fromMap(result.first);
  }

  // --- Hadiths (paginated) ---
  Future<List<Hadith>> getHadithsByChapter(
    int chapterId, {
    int? limit,
    int offset = 0,
    bool onlyPrimary = true,
  }) async {
    final db = await _db.database;
    final where = onlyPrimary
        ? 'chapter_id = ? AND is_primary = 1'
        : 'chapter_id = ?';
    final result = await db.query(
      'hadiths',
      where: where,
      whereArgs: [chapterId],
      orderBy: 'id ASC',
      limit: limit,
      offset: offset,
    );
    return result.map((e) => Hadith.fromMap(e)).toList();
  }

  Future<List<Hadith>> getSecondaryHadiths(int parentId) async {
    final db = await _db.database;
    final result = await db.query(
      'hadiths',
      where: 'parent_id = ?',
      whereArgs: [parentId],
      orderBy: 'id ASC',
    );
    return result.map((e) => Hadith.fromMap(e)).toList();
  }

  Future<int> getHadithCountByChapter(int chapterId) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as c FROM hadiths WHERE chapter_id = ?',
      [chapterId],
    );
    return result.first['c'] as int;
  }

  Future<Hadith?> getHadithById(int id) async {
    final db = await _db.database;
    final result = await db.query('hadiths', where: 'id = ?', whereArgs: [id]);
    if (result.isEmpty) return null;
    return Hadith.fromMap(result.first);
  }

  Future<Hadith?> getHadithByNumber(String hadithNumber) async {
    final db = await _db.database;
    final result = await db.query(
      'hadiths',
      where: 'hadith_number = ?',
      whereArgs: [hadithNumber],
      limit: 1,
    );
    if (result.isEmpty) return null;
    return Hadith.fromMap(result.first);
  }

  // FIX: Merged duplicate getHadithIndexWithinChapter and getHadithIndex into one
  // BUGFIX: The chapter detail screen (HadithDetailScreen) only ever displays
  // PRIMARY hadiths (getHadithsByChapter defaults to onlyPrimary: true), so the
  // index we compute here MUST count only primary hadiths too — otherwise any
  // secondary (isnaad-duplicate) hadiths sitting before the target hadith get
  // counted and inflate the index, causing the wrong hadith to open
  // (e.g. searching Hadith #800 would open #802 if 2 secondary hadiths precede it).
  Future<int> getHadithIndex(int chapterId, String hadithNumber) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as c FROM hadiths WHERE chapter_id = ? AND is_primary = 1 AND id < (SELECT id FROM hadiths WHERE chapter_id = ? AND hadith_number = ? LIMIT 1)',
      [chapterId, chapterId, hadithNumber],
    );
    return result.first['c'] as int;
  }

  Future<int> getTotalHadithCount() async {
    final db = await _db.database;
    final result = await db.rawQuery('SELECT COUNT(*) as c FROM hadiths');
    return result.first['c'] as int;
  }

  Future<Hadith?> getHadithByGlobalNumber(String number) async {
    final db = await _db.database;
    final result = await db.query(
      'hadiths',
      where: 'hadith_number = ?',
      whereArgs: [number],
      limit: 1,
    );
    if (result.isEmpty) return null;
    return Hadith.fromMap(result.first);
  }

  // --- Search (Optimized with Isar) ---
  // FIX: Fixed N+1 query problem — now fetches all hadiths in a single IN query
  Future<List<Hadith>> searchHadiths(
    String query, {
    bool exactMatch = false,
    String language = 'both',
    bool onlyPrimary = false,
    int limit = 30,
    int offset = 0,
  }) async {
    final isarResults = await _isar.search(
      query,
      limit: limit,
      offset: offset,
      language: language,
      onlyPrimary: onlyPrimary,
    );

    // FIX: Use a single IN query to avoid N+1 problem
    final ids = isarResults
        .where((ir) => ir.sqliteId != null)
        .map((ir) => ir.sqliteId!)
        .toList();
    if (ids.isEmpty) return [];

    final db = await _db.database;
    final placeholders = ids.map((_) => '?').join(',');
    final rows = await db.rawQuery(
      'SELECT * FROM hadiths WHERE id IN ($placeholders)',
      ids,
    );

    // Preserve the order returned by Isar
    final hadithMap = <int, Hadith>{
      for (final r in rows) r['id'] as int: Hadith.fromMap(r),
    };
    return ids.map((id) => hadithMap[id]).whereType<Hadith>().toList();
  }

  Future<int> searchCount(
    String query, {
    bool exactMatch = false,
    String language = 'both',
    bool onlyPrimary = false,
  }) async {
    return _isar.searchCount(
      query,
      language: language,
      onlyPrimary: onlyPrimary,
    );
  }

  // --- Bookmarks ---
  Future<List<Hadith>> getBookmarkedHadiths() async {
    final db = await _db.database;
    final result = await db.rawQuery('''
      SELECT h.* FROM hadiths h
      INNER JOIN bookmarks b ON h.id = b.hadith_id
      ORDER BY b.created_at DESC
    ''');
    return result.map((e) => Hadith.fromMap(e)).toList();
  }

  Future<void> toggleBookmark(int hadithId) async {
    final db = await _db.database;
    final exists = await db.query(
      'bookmarks',
      where: 'hadith_id = ?',
      whereArgs: [hadithId],
    );
    if (exists.isEmpty) {
      await db.insert('bookmarks', {
        'hadith_id': hadithId,
        'created_at': DateTime.now().toIso8601String(),
      });
    } else {
      await db.delete(
        'bookmarks',
        where: 'hadith_id = ?',
        whereArgs: [hadithId],
      );
    }
  }

  Future<bool> isBookmarked(int hadithId) async {
    final db = await _db.database;
    final r = await db.query(
      'bookmarks',
      where: 'hadith_id = ?',
      whereArgs: [hadithId],
    );
    return r.isNotEmpty;
  }

  // --- Collections ---
  Future<List<HadithCollection>> getCollections() async {
    final db = await _db.database;
    final result = await db.query('collections', orderBy: 'created_at DESC');
    return result.map((e) => HadithCollection.fromMap(e)).toList();
  }

  Future<int> createCollection(String name) async {
    final db = await _db.database;
    return await db.insert('collections', {
      'name': name,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  // --- Reading Progress ---
  Future<void> saveReadingProgress(int chapterId, int hadithIndex) async {
    final db = await _db.database;
    final now = DateTime.now().toIso8601String();
    final existing = await db.query(
      'reading_progress',
      where: 'chapter_id = ?',
      whereArgs: [chapterId],
    );
    if (existing.isEmpty) {
      await db.insert('reading_progress', {
        'chapter_id': chapterId,
        'hadith_index': hadithIndex,
        'last_read_at': now,
      });
    } else {
      await db.update(
        'reading_progress',
        {'hadith_index': hadithIndex, 'last_read_at': now},
        where: 'chapter_id = ?',
        whereArgs: [chapterId],
      );
    }
  }

  Future<ReadingProgress?> getLastReadingProgress() async {
    final db = await _db.database;
    final result = await db.query(
      'reading_progress',
      orderBy: 'last_read_at DESC',
      limit: 1,
    );
    if (result.isEmpty) return null;
    return ReadingProgress.fromMap(result.first);
  }

  // --- Stats ---
  Future<int> getBookmarkCount() async {
    final db = await _db.database;
    final r = await db.rawQuery('SELECT COUNT(*) as c FROM bookmarks');
    return r.first['c'] as int;
  }

  Future<int> getNotesCount() async {
    final db = await _db.database;
    final r = await db.rawQuery('SELECT COUNT(*) as c FROM notes');
    return r.first['c'] as int;
  }

  Future<int> getTotalReadChapters() async {
    final db = await _db.database;
    final r = await db.rawQuery(
      'SELECT COUNT(DISTINCT chapter_id) as c FROM reading_progress',
    );
    return r.first['c'] as int;
  }

  // --- Bookmarks with Chapter Info ---
  Future<List<Map<String, dynamic>>> getBookmarkedHadithsWithChapter() async {
    final db = await _db.database;
    final result = await db.rawQuery('''
      SELECT h.*, c.title_urdu as chapter_title_urdu, c.title_arabic as chapter_title_arabic, c.title_english as chapter_title_english, c.book_number
      FROM hadiths h
      INNER JOIN bookmarks b ON h.id = b.hadith_id
      LEFT JOIN chapters c ON h.chapter_id = c.id
      ORDER BY b.created_at DESC
    ''');
    return result;
  }

  // --- Notes ---
  Future<List<Map<String, dynamic>>> getNotesWithHadithInfo() async {
    final db = await _db.database;
    return await db.rawQuery('''
      SELECT n.*, h.hadith_number,
        SUBSTR(h.english_text, 1, 150) as hadith_preview
      FROM notes n
      LEFT JOIN hadiths h ON n.hadith_id = h.id
      ORDER BY n.updated_at DESC
    ''');
  }

  Future<void> addNote(int hadithId, String content) async {
    final db = await _db.database;
    final now = DateTime.now().toIso8601String();
    final existing = await db.query(
      'notes',
      where: 'hadith_id = ?',
      whereArgs: [hadithId],
    );
    if (existing.isEmpty) {
      await db.insert('notes', {
        'hadith_id': hadithId,
        'content': content,
        'created_at': now,
        'updated_at': now,
      });
    } else {
      await db.update(
        'notes',
        {'content': content, 'updated_at': now},
        where: 'hadith_id = ?',
        whereArgs: [hadithId],
      );
    }
  }

  Future<void> deleteNote(int noteId) async {
    final db = await _db.database;
    await db.delete('notes', where: 'id = ?', whereArgs: [noteId]);
  }

  // --- Collections ---
  Future<HadithCollection?> getCollectionById(int id) async {
    final db = await _db.database;
    final result = await db.query(
      'collections',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isEmpty) return null;
    return HadithCollection.fromMap(result.first);
  }

  Future<List<Hadith>> getCollectionHadiths(int collectionId) async {
    final db = await _db.database;
    final result = await db.rawQuery(
      '''
      SELECT h.* FROM hadiths h
      INNER JOIN collection_hadith ch ON h.id = ch.hadith_id
      WHERE ch.collection_id = ?
    ''',
      [collectionId],
    );
    return result.map((e) => Hadith.fromMap(e)).toList();
  }

  Future<int> getCollectionHadithCount(int collectionId) async {
    final db = await _db.database;
    final r = await db.rawQuery(
      'SELECT COUNT(*) as c FROM collection_hadith WHERE collection_id = ?',
      [collectionId],
    );
    return r.first['c'] as int;
  }

  Future<void> addHadithToCollection(int collectionId, int hadithId) async {
    final db = await _db.database;
    final existing = await db.query(
      'collection_hadith',
      where: 'collection_id = ? AND hadith_id = ?',
      whereArgs: [collectionId, hadithId],
    );
    if (existing.isEmpty) {
      await db.insert('collection_hadith', {
        'collection_id': collectionId,
        'hadith_id': hadithId,
      });
    }
  }

  Future<void> deleteCollection(int id) async {
    final db = await _db.database;
    await db.delete(
      'collection_hadith',
      where: 'collection_id = ?',
      whereArgs: [id],
    );
    await db.delete('collections', where: 'id = ?', whereArgs: [id]);
  }

  // --- Hadith of the Day ---
  // FIX: Now returns a consistent hadith per day (not ORDER BY RANDOM())
  Future<Hadith?> getHadithOfTheDay() async {
    final db = await _db.database;

    // Total primary hadiths ki count lo
    final countResult = await db.rawQuery(
      'SELECT COUNT(*) as c FROM hadiths WHERE is_primary = 1',
    );
    final count = countResult.first['c'] as int;
    if (count == 0) return null;

    // Use day-of-year as seed — different each day, but consistent within the same day
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
    final offset = dayOfYear % count;

    final result = await db.query(
      'hadiths',
      where: 'is_primary = 1',
      orderBy: 'id ASC',
      limit: 1,
      offset: offset,
    );
    if (result.isEmpty) return null;
    return Hadith.fromMap(result.first);
  }

  // FIX: getRandomHadith was a duplicate of getHadithOfTheDay — now truly random
  Future<Hadith?> getRandomHadith() async {
    final db = await _db.database;
    final countResult = await db.rawQuery('SELECT COUNT(*) as c FROM hadiths');
    final count = countResult.first['c'] as int;
    if (count == 0) return null;
    final offset = Random().nextInt(count);
    final result = await db.query(
      'hadiths',
      orderBy: 'id ASC',
      limit: 1,
      offset: offset,
    );
    if (result.isEmpty) return null;
    return Hadith.fromMap(result.first);
  }

  // --- Chapter Progress ---
  Future<List<Map<String, dynamic>>> getAllChapterProgress() async {
    final db = await _db.database;
    return await db.rawQuery('''
      SELECT c.id, c.book_number, c.title_urdu, c.hadith_count,
        rp.hadith_index, rp.last_read_at
      FROM chapters c
      LEFT JOIN reading_progress rp ON c.id = rp.chapter_id
      ORDER BY c.book_number ASC
    ''');
  }

  // --- Export / Import ---
  Future<Map<String, dynamic>> exportUserData() async {
    final db = await _db.database;
    final bookmarks = await db.query('bookmarks');
    final notes = await db.query('notes');
    final collections = await db.query('collections');
    final collectionHadiths = await db.query('collection_hadith');
    final progress = await db.query('reading_progress');
    return {
      'bookmarks': bookmarks,
      'notes': notes,
      'collections': collections,
      'collection_hadith': collectionHadiths,
      'reading_progress': progress,
    };
  }

  // FIX: Now uses INSERT OR IGNORE to prevent duplicate records
  Future<int> importUserData(Map<String, dynamic> data) async {
    final db = await _db.database;
    int count = 0;
    await db.transaction((txn) async {
      if (data['bookmarks'] != null) {
        for (final b in (data['bookmarks'] as List)) {
          final row = Map<String, dynamic>.from(b)..remove('id');
          final inserted = await txn.rawInsert(
            'INSERT OR IGNORE INTO bookmarks (hadith_id, created_at) VALUES (?, ?)',
            [row['hadith_id'], row['created_at']],
          );
          count += inserted;
        }
      }
      if (data['notes'] != null) {
        for (final n in (data['notes'] as List)) {
          final row = Map<String, dynamic>.from(n)..remove('id');
          final inserted = await txn.rawInsert(
            'INSERT OR IGNORE INTO notes (hadith_id, content, created_at, updated_at) VALUES (?, ?, ?, ?)',
            [
              row['hadith_id'],
              row['content'],
              row['created_at'],
              row['updated_at'],
            ],
          );
          count += inserted;
        }
      }
      if (data['collections'] != null) {
        for (final c in (data['collections'] as List)) {
          final row = Map<String, dynamic>.from(c)..remove('id');
          final inserted = await txn.rawInsert(
            'INSERT OR IGNORE INTO collections (name, created_at) VALUES (?, ?)',
            [row['name'], row['created_at']],
          );
          count += inserted;
        }
      }
      if (data['reading_progress'] != null) {
        for (final r in (data['reading_progress'] as List)) {
          final row = Map<String, dynamic>.from(r)..remove('id');
          final inserted = await txn.rawInsert(
            'INSERT OR IGNORE INTO reading_progress (chapter_id, hadith_index, last_read_at) VALUES (?, ?, ?)',
            [row['chapter_id'], row['hadith_index'], row['last_read_at']],
          );
          count += inserted;
        }
      }
    });
    return count;
  }
}
