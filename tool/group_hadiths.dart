import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteFfiInit();
  final dbPath = 'assets/db/hadiths.db';
  final db = await databaseFactoryFfi.openDatabase(dbPath);

  print('Updating schema...');
  try {
    await db.execute(
      'ALTER TABLE hadiths ADD COLUMN is_primary INTEGER DEFAULT 1',
    );
    await db.execute('ALTER TABLE hadiths ADD COLUMN parent_id INTEGER');
  } catch (e) {
    print('Schema already updated or error: $e');
  }

  print('Analyzing Hadiths for grouping...');
  final chapters = await db.query('chapters', orderBy: 'id ASC');

  for (final chapter in chapters) {
    final chapterId = chapter['id'] as int;
    final hadiths = await db.query(
      'hadiths',
      where: 'chapter_id = ?',
      whereArgs: [chapterId],
      orderBy: 'id ASC',
    );

    int? lastPrimaryId;

    for (int i = 0; i < hadiths.length; i++) {
      final h = hadiths[i];
      final id = h['id'] as int;
      final urdu = (h['urdu_text'] as String?) ?? '';
      final arabic = (h['arabic_text'] as String?) ?? '';

      // Heuristic for secondary chain in Bukhari:
      // 1. Very short Urdu text (e.g. "اسی طرح مروی ہے" or just names)
      // 2. Starts with specific phrases like "تابعه" in Arabic if Matn is same

      final wordCount = urdu.split(RegExp(r'\s+')).length;
      bool isSecondary = false;

      if (i > 0 && lastPrimaryId != null) {
        if (wordCount < 15 &&
            (urdu.contains('اسی طرح') ||
                urdu.contains('گزشتہ') ||
                urdu.length < 50)) {
          isSecondary = true;
        } else if (arabic.startsWith('تابعه') || arabic.startsWith('وقال')) {
          // If it starts with follow-up phrases and is relatively short compared to a full hadith
          if (wordCount < 25) isSecondary = true;
        }
      }

      if (isSecondary) {
        await db.update(
          'hadiths',
          {'is_primary': 0, 'parent_id': lastPrimaryId},
          where: 'id = ?',
          whereArgs: [id],
        );
        print('Marked Hadith $id as secondary to $lastPrimaryId');
      } else {
        lastPrimaryId = id;
        await db.update(
          'hadiths',
          {'is_primary': 1, 'parent_id': null},
          where: 'id = ?',
          whereArgs: [id],
        );
      }
    }
  }

  print('Grouping complete.');
  await db.close();
}
