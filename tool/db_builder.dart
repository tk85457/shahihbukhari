// ignore_for_file: dangling_library_doc_comments, avoid_print
/// Standalone CLI script to build the pre-built Sahih Bukhari SQLite database.
/// Run: dart run tool/db_builder.dart
///
/// Output: assets/db/sahih_bukhari.db
import 'dart:convert';
import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'chapter_data.dart';

Future<void> main() async {
  sqfliteFfiInit();
  final factory = databaseFactoryFfi;

  final outPath = '${Directory.current.path}/assets/db/sahih_bukhari.db';
  // Delete existing
  final outFile = File(outPath);
  if (await outFile.exists()) await outFile.delete();

  print('Building database at: $outPath');

  final db = await factory.openDatabase(outPath,
    options: OpenDatabaseOptions(
      version: 1,
      onCreate: (db, version) async {
        // Create tables
        await db.execute('''
CREATE TABLE chapters (
  id INTEGER PRIMARY KEY,
  book_number INTEGER NOT NULL,
  title_arabic TEXT NOT NULL,
  title_urdu TEXT NOT NULL,
  title_english TEXT NOT NULL,
  hadith_count INTEGER NOT NULL DEFAULT 0
)''');
        await db.execute('''
CREATE TABLE hadiths (
  id INTEGER PRIMARY KEY,
  chapter_id INTEGER NOT NULL,
  hadith_number INTEGER NOT NULL,
  arabic_text TEXT NOT NULL,
  urdu_text TEXT NOT NULL,
  english_text TEXT NOT NULL,
  FOREIGN KEY (chapter_id) REFERENCES chapters (id)
)''');
        // Indexes for search performance
        await db.execute('CREATE INDEX idx_hadiths_chapter ON hadiths(chapter_id)');
        await db.execute('CREATE INDEX idx_hadiths_number ON hadiths(hadith_number)');
      },
    ),
  );

  // Insert chapters from chapter_data.dart
  // Note: we use id = book_number for simplicity so referential integrity works directly with the hadith's Chapter_Number
  print('Inserting ${chapters.length} chapters...');
  final batch = db.batch();
  for (int i = 0; i < chapters.length; i++) {
    final c = chapters[i];
    final bookNum = c[0] as int;
    batch.insert('chapters', {
      'id': bookNum,
      'book_number': bookNum,
      'title_arabic': c[1] as String,
      'title_urdu': c[2] as String,
      'title_english': c[3] as String,
      'hadith_count': c[4] as int, // This is original counts, might be slightly off depending on the dataset, but we will leave it or we can recount later. Let's just use original count
    });
  }
  await batch.commit(noResult: true);

  // Parse Urdu Text Data
  print('Parsing urdubukhari.txt...');
  final txtFile = File(r'C:\Users\tk854\Music\Downloads\urdubukhari.txt');
  final urduLines = await txtFile.readAsLines();
  final Map<int, String> urduMap = {};
  for (String line in urduLines) {
    if (line.trim().isEmpty) continue;
    final parts = line.split(' | ');
    if (parts.length >= 2) {
      final idStr = parts[0].trim();
      final id = int.tryParse(idStr);
      if (id != null) {
        // Join remaining parts in case text contains ' | '
        urduMap[id] = parts.sublist(1).join(' | ').trim();
      }
    }
  }
  print('Parsed ${urduMap.length} Urdu hadiths.');

  // Parse JSON Hadith Data
  print('Parsing Sahih al-Bukhari.json...');
  final jsonFile = File(r'C:\Users\tk854\Music\Downloads\Sahih%20al-Bukhari.json');
  final content = await jsonFile.readAsString();
  final List<dynamic> jsonList = jsonDecode(content);
  print('Found ${jsonList.length} JSON hadiths.');

  print('Inserting hadiths into DB (in batches)...');
  var hBatch = db.batch();
  int insertedCount = 0;
  for (var item in jsonList) {
    final map = item as Map<String, dynamic>;

    // Parse global ID from Reference: https://sunnah.com/bukhari:1
    final reference = map['Reference']?.toString() ?? '';
    final refParts = reference.split(':');
    int globalId = 0;
    if (refParts.isNotEmpty) {
      globalId = int.tryParse(refParts.last) ?? 0;
    }

    final chapterId = map['Chapter_Number'] as int? ?? 1;
    final arabicText = map['Arabic_Text']?.toString() ?? '';
    final englishText = map['English_Text']?.toString() ?? '';
    final urduText = urduMap[globalId] ?? 'ترجمہ دستیاب نہیں'; // Fallback if no translation

    hBatch.insert('hadiths', {
      'chapter_id': chapterId,
      'hadith_number': globalId,
      'arabic_text': arabicText,
      'urdu_text': urduText,
      'english_text': englishText,
    });
    insertedCount++;

    if (insertedCount % 1000 == 0) {
      await hBatch.commit(noResult: true);
      hBatch = db.batch();
    }
  }
  if (insertedCount % 1000 != 0) {
    await hBatch.commit(noResult: true);
  }

  // Update Chapter Counts
  print('Updating chapter counts...');
  await db.execute('''
    UPDATE chapters
    SET hadith_count = (
      SELECT COUNT(*) FROM hadiths WHERE hadiths.chapter_id = chapters.id
    )
  ''');

  // Verify
  final chRes = await db.rawQuery('SELECT COUNT(*) as c FROM chapters');
  final chCount = chRes.first['c'] as int;
  final hRes = await db.rawQuery('SELECT COUNT(*) as c FROM hadiths');
  final hCount = hRes.first['c'] as int;
  print('✓ Database built: $chCount chapters, $hCount hadiths');
  print('✓ Output: $outPath');

  await db.close();
}
