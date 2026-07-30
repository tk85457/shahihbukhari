import 'package:isar_community/isar.dart';

part 'isar_models.g.dart';

@collection
class IsarChapter {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  int? sqliteId;

  int? bookNumber;

  @Index(type: IndexType.value)
  String? titleArabic;

  @Index(type: IndexType.value)
  String? titleUrdu;

  @Index(type: IndexType.value)
  String? titleEnglish;

  int? hadithCount;
}

@collection
class IsarHadith {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  int? sqliteId;

  int? chapterId;

  @Index(type: IndexType.value)
  String? hadithNumber;

  @Index(type: IndexType.value)
  String? arabicText;

  @Index(type: IndexType.value, caseSensitive: false)
  String? urduText;

  @Index(type: IndexType.value, caseSensitive: false)
  String? englishText;

  @Index()
  bool isPrimary = true;

  @Index()
  int? parentId;
}

@collection
class IsarBookmark {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  int? hadithId;

  DateTime? createdAt;
}

@collection
class IsarHadithCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? name;

  DateTime? createdAt;

  final hadiths = IsarLinks<IsarHadith>();
}

@collection
class IsarNote {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  int? hadithId;

  String? content;

  DateTime? createdAt;
  DateTime? updatedAt;
}

@collection
class IsarReadingProgress {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  int? chapterId;

  int? hadithIndex;

  DateTime? lastReadAt;
}
