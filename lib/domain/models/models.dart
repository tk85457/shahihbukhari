// ─── Chapter (Book / Kitab) ───
class Chapter {
  final int id;
  final int bookNumber;
  final String titleArabic;
  final String titleUrdu;
  final String titleEnglish;
  final int hadithCount;

  const Chapter({
    required this.id,
    required this.bookNumber,
    required this.titleArabic,
    required this.titleUrdu,
    required this.titleEnglish,
    required this.hadithCount,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'book_number': bookNumber,
    'title_arabic': titleArabic,
    'title_urdu': titleUrdu,
    'title_english': titleEnglish,
    'hadith_count': hadithCount,
  };

  factory Chapter.fromMap(Map<String, dynamic> m) => Chapter(
    id: m['id'] as int,
    bookNumber: m['book_number'] as int,
    titleArabic: m['title_arabic'] as String,
    titleUrdu: m['title_urdu'] as String,
    titleEnglish: m['title_english'] as String,
    hadithCount: m['hadith_count'] as int,
  );
}

// ─── Hadith ───
class Hadith {
  final int id;
  final int chapterId;
  final String hadithNumber;
  final String arabicText;
  final String urduText;
  final String englishText;
  final bool isPrimary;
  final int? parentId;

  const Hadith({
    required this.id,
    required this.chapterId,
    required this.hadithNumber,
    required this.arabicText,
    required this.urduText,
    required this.englishText,
    this.isPrimary = true,
    this.parentId,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'chapter_id': chapterId,
    'hadith_number': hadithNumber,
    'arabic_text': arabicText,
    'urdu_text': urduText,
    'english_text': englishText,
    'is_primary': isPrimary ? 1 : 0,
    'parent_id': parentId,
  };

  factory Hadith.fromMap(Map<String, dynamic> m) => Hadith(
    id: m['id'] as int,
    chapterId: m['chapter_id'] as int,
    hadithNumber: m['hadith_number'].toString(),
    arabicText: m['arabic_text'] as String,
    urduText: m['urdu_text'] as String,
    englishText: m['english_text'] as String,
    isPrimary: (m['is_primary'] as int? ?? 1) == 1,
    parentId: m['parent_id'] as int?,
  );
}

// ─── Bookmark ───
class Bookmark {
  final int id;
  final int hadithId;
  final DateTime createdAt;

  const Bookmark({
    required this.id,
    required this.hadithId,
    required this.createdAt,
  });

  factory Bookmark.fromMap(Map<String, dynamic> m) => Bookmark(
    id: m['id'] as int,
    hadithId: m['hadith_id'] as int,
    createdAt: DateTime.parse(m['created_at'] as String),
  );
}

// ─── Collection ───
class HadithCollection {
  final int id;
  final String name;
  final DateTime createdAt;

  const HadithCollection({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'created_at': createdAt.toIso8601String(),
  };

  factory HadithCollection.fromMap(Map<String, dynamic> m) => HadithCollection(
    id: m['id'] as int,
    name: m['name'] as String,
    createdAt: DateTime.parse(m['created_at'] as String),
  );
}

// ─── Note ───
class Note {
  final int id;
  final int hadithId;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Note({
    required this.id,
    required this.hadithId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Note.fromMap(Map<String, dynamic> m) => Note(
    id: m['id'] as int,
    hadithId: m['hadith_id'] as int,
    content: m['content'] as String,
    createdAt: DateTime.parse(m['created_at'] as String),
    updatedAt: DateTime.parse(m['updated_at'] as String),
  );
}

// ─── Reading Progress ───
class ReadingProgress {
  final int id;
  final int chapterId;
  final int hadithIndex;
  final DateTime lastReadAt;

  const ReadingProgress({
    required this.id,
    required this.chapterId,
    required this.hadithIndex,
    required this.lastReadAt,
  });

  factory ReadingProgress.fromMap(Map<String, dynamic> m) => ReadingProgress(
    id: m['id'] as int,
    chapterId: m['chapter_id'] as int,
    hadithIndex: m['hadith_index'] as int,
    lastReadAt: DateTime.parse(m['last_read_at'] as String),
  );
}
