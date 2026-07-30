// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarChapterCollection on Isar {
  IsarCollection<IsarChapter> get isarChapters => this.collection();
}

const IsarChapterSchema = CollectionSchema(
  name: r'IsarChapter',
  id: -1179651731391696624,
  properties: {
    r'bookNumber': PropertySchema(
      id: 0,
      name: r'bookNumber',
      type: IsarType.long,
    ),
    r'hadithCount': PropertySchema(
      id: 1,
      name: r'hadithCount',
      type: IsarType.long,
    ),
    r'sqliteId': PropertySchema(id: 2, name: r'sqliteId', type: IsarType.long),
    r'titleArabic': PropertySchema(
      id: 3,
      name: r'titleArabic',
      type: IsarType.string,
    ),
    r'titleEnglish': PropertySchema(
      id: 4,
      name: r'titleEnglish',
      type: IsarType.string,
    ),
    r'titleUrdu': PropertySchema(
      id: 5,
      name: r'titleUrdu',
      type: IsarType.string,
    ),
  },

  estimateSize: _isarChapterEstimateSize,
  serialize: _isarChapterSerialize,
  deserialize: _isarChapterDeserialize,
  deserializeProp: _isarChapterDeserializeProp,
  idName: r'id',
  indexes: {
    r'sqliteId': IndexSchema(
      id: -7892941694082631125,
      name: r'sqliteId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sqliteId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'titleArabic': IndexSchema(
      id: 185569196879461423,
      name: r'titleArabic',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'titleArabic',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'titleUrdu': IndexSchema(
      id: 6586771860058994318,
      name: r'titleUrdu',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'titleUrdu',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'titleEnglish': IndexSchema(
      id: -8320474698168289341,
      name: r'titleEnglish',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'titleEnglish',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarChapterGetId,
  getLinks: _isarChapterGetLinks,
  attach: _isarChapterAttach,
  version: '3.3.2',
);

int _isarChapterEstimateSize(
  IsarChapter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.titleArabic;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.titleEnglish;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.titleUrdu;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarChapterSerialize(
  IsarChapter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bookNumber);
  writer.writeLong(offsets[1], object.hadithCount);
  writer.writeLong(offsets[2], object.sqliteId);
  writer.writeString(offsets[3], object.titleArabic);
  writer.writeString(offsets[4], object.titleEnglish);
  writer.writeString(offsets[5], object.titleUrdu);
}

IsarChapter _isarChapterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarChapter();
  object.bookNumber = reader.readLongOrNull(offsets[0]);
  object.hadithCount = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.sqliteId = reader.readLongOrNull(offsets[2]);
  object.titleArabic = reader.readStringOrNull(offsets[3]);
  object.titleEnglish = reader.readStringOrNull(offsets[4]);
  object.titleUrdu = reader.readStringOrNull(offsets[5]);
  return object;
}

P _isarChapterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarChapterGetId(IsarChapter object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarChapterGetLinks(IsarChapter object) {
  return [];
}

void _isarChapterAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarChapter object,
) {
  object.id = id;
}

extension IsarChapterByIndex on IsarCollection<IsarChapter> {
  Future<IsarChapter?> getBySqliteId(int? sqliteId) {
    return getByIndex(r'sqliteId', [sqliteId]);
  }

  IsarChapter? getBySqliteIdSync(int? sqliteId) {
    return getByIndexSync(r'sqliteId', [sqliteId]);
  }

  Future<bool> deleteBySqliteId(int? sqliteId) {
    return deleteByIndex(r'sqliteId', [sqliteId]);
  }

  bool deleteBySqliteIdSync(int? sqliteId) {
    return deleteByIndexSync(r'sqliteId', [sqliteId]);
  }

  Future<List<IsarChapter?>> getAllBySqliteId(List<int?> sqliteIdValues) {
    final values = sqliteIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'sqliteId', values);
  }

  List<IsarChapter?> getAllBySqliteIdSync(List<int?> sqliteIdValues) {
    final values = sqliteIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'sqliteId', values);
  }

  Future<int> deleteAllBySqliteId(List<int?> sqliteIdValues) {
    final values = sqliteIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'sqliteId', values);
  }

  int deleteAllBySqliteIdSync(List<int?> sqliteIdValues) {
    final values = sqliteIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'sqliteId', values);
  }

  Future<Id> putBySqliteId(IsarChapter object) {
    return putByIndex(r'sqliteId', object);
  }

  Id putBySqliteIdSync(IsarChapter object, {bool saveLinks = true}) {
    return putByIndexSync(r'sqliteId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySqliteId(List<IsarChapter> objects) {
    return putAllByIndex(r'sqliteId', objects);
  }

  List<Id> putAllBySqliteIdSync(
    List<IsarChapter> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'sqliteId', objects, saveLinks: saveLinks);
  }
}

extension IsarChapterQueryWhereSort
    on QueryBuilder<IsarChapter, IsarChapter, QWhere> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhere> anySqliteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'sqliteId'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhere> anyTitleArabic() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'titleArabic'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhere> anyTitleUrdu() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'titleUrdu'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhere> anyTitleEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'titleEnglish'),
      );
    });
  }
}

extension IsarChapterQueryWhere
    on QueryBuilder<IsarChapter, IsarChapter, QWhereClause> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> sqliteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sqliteId', value: [null]),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  sqliteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sqliteId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> sqliteIdEqualTo(
    int? sqliteId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sqliteId', value: [sqliteId]),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> sqliteIdNotEqualTo(
    int? sqliteId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sqliteId',
                lower: [],
                upper: [sqliteId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sqliteId',
                lower: [sqliteId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sqliteId',
                lower: [sqliteId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sqliteId',
                lower: [],
                upper: [sqliteId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> sqliteIdGreaterThan(
    int? sqliteId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sqliteId',
          lower: [sqliteId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> sqliteIdLessThan(
    int? sqliteId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sqliteId',
          lower: [],
          upper: [sqliteId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> sqliteIdBetween(
    int? lowerSqliteId,
    int? upperSqliteId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sqliteId',
          lower: [lowerSqliteId],
          includeLower: includeLower,
          upper: [upperSqliteId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleArabicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'titleArabic', value: [null]),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleArabicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleArabic',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleArabicEqualTo(
    String? titleArabic,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'titleArabic',
          value: [titleArabic],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleArabicNotEqualTo(String? titleArabic) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleArabic',
                lower: [],
                upper: [titleArabic],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleArabic',
                lower: [titleArabic],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleArabic',
                lower: [titleArabic],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleArabic',
                lower: [],
                upper: [titleArabic],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleArabicGreaterThan(String? titleArabic, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleArabic',
          lower: [titleArabic],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleArabicLessThan(
    String? titleArabic, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleArabic',
          lower: [],
          upper: [titleArabic],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleArabicBetween(
    String? lowerTitleArabic,
    String? upperTitleArabic, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleArabic',
          lower: [lowerTitleArabic],
          includeLower: includeLower,
          upper: [upperTitleArabic],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleArabicStartsWith(String TitleArabicPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleArabic',
          lower: [TitleArabicPrefix],
          upper: ['$TitleArabicPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleArabicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'titleArabic', value: ['']),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleArabicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'titleArabic', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'titleArabic',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'titleArabic',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'titleArabic', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleUrduIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'titleUrdu', value: [null]),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleUrduIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleUrdu',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleUrduEqualTo(
    String? titleUrdu,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'titleUrdu', value: [titleUrdu]),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleUrduNotEqualTo(
    String? titleUrdu,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleUrdu',
                lower: [],
                upper: [titleUrdu],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleUrdu',
                lower: [titleUrdu],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleUrdu',
                lower: [titleUrdu],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleUrdu',
                lower: [],
                upper: [titleUrdu],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleUrduGreaterThan(String? titleUrdu, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleUrdu',
          lower: [titleUrdu],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleUrduLessThan(
    String? titleUrdu, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleUrdu',
          lower: [],
          upper: [titleUrdu],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleUrduBetween(
    String? lowerTitleUrdu,
    String? upperTitleUrdu, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleUrdu',
          lower: [lowerTitleUrdu],
          includeLower: includeLower,
          upper: [upperTitleUrdu],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleUrduStartsWith(
    String TitleUrduPrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleUrdu',
          lower: [TitleUrduPrefix],
          upper: ['$TitleUrduPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleUrduIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'titleUrdu', value: ['']),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleUrduIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'titleUrdu', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'titleUrdu',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'titleUrdu',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'titleUrdu', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleEnglishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'titleEnglish', value: [null]),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleEnglishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleEnglish',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleEnglishEqualTo(
    String? titleEnglish,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'titleEnglish',
          value: [titleEnglish],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleEnglishNotEqualTo(String? titleEnglish) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleEnglish',
                lower: [],
                upper: [titleEnglish],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleEnglish',
                lower: [titleEnglish],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleEnglish',
                lower: [titleEnglish],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'titleEnglish',
                lower: [],
                upper: [titleEnglish],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleEnglishGreaterThan(String? titleEnglish, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleEnglish',
          lower: [titleEnglish],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleEnglishLessThan(String? titleEnglish, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleEnglish',
          lower: [],
          upper: [titleEnglish],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause> titleEnglishBetween(
    String? lowerTitleEnglish,
    String? upperTitleEnglish, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleEnglish',
          lower: [lowerTitleEnglish],
          includeLower: includeLower,
          upper: [upperTitleEnglish],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleEnglishStartsWith(String TitleEnglishPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'titleEnglish',
          lower: [TitleEnglishPrefix],
          upper: ['$TitleEnglishPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleEnglishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'titleEnglish', value: ['']),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterWhereClause>
  titleEnglishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'titleEnglish',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'titleEnglish',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'titleEnglish',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'titleEnglish',
                upper: [''],
              ),
            );
      }
    });
  }
}

extension IsarChapterQueryFilter
    on QueryBuilder<IsarChapter, IsarChapter, QFilterCondition> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  bookNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'bookNumber'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  bookNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'bookNumber'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  bookNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bookNumber', value: value),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  bookNumberGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bookNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  bookNumberLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bookNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  bookNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bookNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  hadithCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'hadithCount'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  hadithCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'hadithCount'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  hadithCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hadithCount', value: value),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  hadithCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hadithCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  hadithCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hadithCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  hadithCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hadithCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  sqliteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sqliteId'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  sqliteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sqliteId'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> sqliteIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sqliteId', value: value),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  sqliteIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sqliteId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  sqliteIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sqliteId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition> sqliteIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sqliteId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'titleArabic'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'titleArabic'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'titleArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'titleArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'titleArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'titleArabic',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'titleArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'titleArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'titleArabic',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'titleArabic',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'titleArabic', value: ''),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleArabicIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'titleArabic', value: ''),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'titleEnglish'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'titleEnglish'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'titleEnglish',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'titleEnglish',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'titleEnglish',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'titleEnglish', value: ''),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleEnglishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'titleEnglish', value: ''),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'titleUrdu'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'titleUrdu'),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'titleUrdu',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'titleUrdu',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'titleUrdu',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'titleUrdu',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'titleUrdu',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'titleUrdu',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'titleUrdu',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'titleUrdu',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'titleUrdu', value: ''),
      );
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterFilterCondition>
  titleUrduIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'titleUrdu', value: ''),
      );
    });
  }
}

extension IsarChapterQueryObject
    on QueryBuilder<IsarChapter, IsarChapter, QFilterCondition> {}

extension IsarChapterQueryLinks
    on QueryBuilder<IsarChapter, IsarChapter, QFilterCondition> {}

extension IsarChapterQuerySortBy
    on QueryBuilder<IsarChapter, IsarChapter, QSortBy> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByBookNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByBookNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByHadithCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithCount', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByHadithCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithCount', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortBySqliteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sqliteId', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortBySqliteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sqliteId', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByTitleArabic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleArabic', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByTitleArabicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleArabic', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByTitleEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEnglish', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy>
  sortByTitleEnglishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEnglish', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByTitleUrdu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleUrdu', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> sortByTitleUrduDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleUrdu', Sort.desc);
    });
  }
}

extension IsarChapterQuerySortThenBy
    on QueryBuilder<IsarChapter, IsarChapter, QSortThenBy> {
  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByBookNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByBookNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByHadithCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithCount', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByHadithCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithCount', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenBySqliteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sqliteId', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenBySqliteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sqliteId', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByTitleArabic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleArabic', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByTitleArabicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleArabic', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByTitleEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEnglish', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy>
  thenByTitleEnglishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEnglish', Sort.desc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByTitleUrdu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleUrdu', Sort.asc);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QAfterSortBy> thenByTitleUrduDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleUrdu', Sort.desc);
    });
  }
}

extension IsarChapterQueryWhereDistinct
    on QueryBuilder<IsarChapter, IsarChapter, QDistinct> {
  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByBookNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookNumber');
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByHadithCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithCount');
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctBySqliteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sqliteId');
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByTitleArabic({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleArabic', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByTitleEnglish({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleEnglish', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarChapter, IsarChapter, QDistinct> distinctByTitleUrdu({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleUrdu', caseSensitive: caseSensitive);
    });
  }
}

extension IsarChapterQueryProperty
    on QueryBuilder<IsarChapter, IsarChapter, QQueryProperty> {
  QueryBuilder<IsarChapter, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarChapter, int?, QQueryOperations> bookNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookNumber');
    });
  }

  QueryBuilder<IsarChapter, int?, QQueryOperations> hadithCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithCount');
    });
  }

  QueryBuilder<IsarChapter, int?, QQueryOperations> sqliteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sqliteId');
    });
  }

  QueryBuilder<IsarChapter, String?, QQueryOperations> titleArabicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleArabic');
    });
  }

  QueryBuilder<IsarChapter, String?, QQueryOperations> titleEnglishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleEnglish');
    });
  }

  QueryBuilder<IsarChapter, String?, QQueryOperations> titleUrduProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleUrdu');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarHadithCollection on Isar {
  IsarCollection<IsarHadith> get isarHadiths => this.collection();
}

const IsarHadithSchema = CollectionSchema(
  name: r'IsarHadith',
  id: 1299079627590655307,
  properties: {
    r'arabicText': PropertySchema(
      id: 0,
      name: r'arabicText',
      type: IsarType.string,
    ),
    r'chapterId': PropertySchema(
      id: 1,
      name: r'chapterId',
      type: IsarType.long,
    ),
    r'englishText': PropertySchema(
      id: 2,
      name: r'englishText',
      type: IsarType.string,
    ),
    r'hadithNumber': PropertySchema(
      id: 3,
      name: r'hadithNumber',
      type: IsarType.string,
    ),
    r'isPrimary': PropertySchema(
      id: 4,
      name: r'isPrimary',
      type: IsarType.bool,
    ),
    r'parentId': PropertySchema(id: 5, name: r'parentId', type: IsarType.long),
    r'sqliteId': PropertySchema(id: 6, name: r'sqliteId', type: IsarType.long),
    r'urduText': PropertySchema(
      id: 7,
      name: r'urduText',
      type: IsarType.string,
    ),
  },

  estimateSize: _isarHadithEstimateSize,
  serialize: _isarHadithSerialize,
  deserialize: _isarHadithDeserialize,
  deserializeProp: _isarHadithDeserializeProp,
  idName: r'id',
  indexes: {
    r'sqliteId': IndexSchema(
      id: -7892941694082631125,
      name: r'sqliteId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sqliteId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'hadithNumber': IndexSchema(
      id: -119658973594151740,
      name: r'hadithNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hadithNumber',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'arabicText': IndexSchema(
      id: 6165951699865175843,
      name: r'arabicText',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'arabicText',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'urduText': IndexSchema(
      id: 7306667881018231209,
      name: r'urduText',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'urduText',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'englishText': IndexSchema(
      id: -1027996372147428349,
      name: r'englishText',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'englishText',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'isPrimary': IndexSchema(
      id: -419999206349340363,
      name: r'isPrimary',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isPrimary',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'parentId': IndexSchema(
      id: -809199838039056779,
      name: r'parentId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'parentId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarHadithGetId,
  getLinks: _isarHadithGetLinks,
  attach: _isarHadithAttach,
  version: '3.3.2',
);

int _isarHadithEstimateSize(
  IsarHadith object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.arabicText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.englishText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.hadithNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.urduText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarHadithSerialize(
  IsarHadith object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.arabicText);
  writer.writeLong(offsets[1], object.chapterId);
  writer.writeString(offsets[2], object.englishText);
  writer.writeString(offsets[3], object.hadithNumber);
  writer.writeBool(offsets[4], object.isPrimary);
  writer.writeLong(offsets[5], object.parentId);
  writer.writeLong(offsets[6], object.sqliteId);
  writer.writeString(offsets[7], object.urduText);
}

IsarHadith _isarHadithDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarHadith();
  object.arabicText = reader.readStringOrNull(offsets[0]);
  object.chapterId = reader.readLongOrNull(offsets[1]);
  object.englishText = reader.readStringOrNull(offsets[2]);
  object.hadithNumber = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.isPrimary = reader.readBool(offsets[4]);
  object.parentId = reader.readLongOrNull(offsets[5]);
  object.sqliteId = reader.readLongOrNull(offsets[6]);
  object.urduText = reader.readStringOrNull(offsets[7]);
  return object;
}

P _isarHadithDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarHadithGetId(IsarHadith object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarHadithGetLinks(IsarHadith object) {
  return [];
}

void _isarHadithAttach(IsarCollection<dynamic> col, Id id, IsarHadith object) {
  object.id = id;
}

extension IsarHadithByIndex on IsarCollection<IsarHadith> {
  Future<IsarHadith?> getBySqliteId(int? sqliteId) {
    return getByIndex(r'sqliteId', [sqliteId]);
  }

  IsarHadith? getBySqliteIdSync(int? sqliteId) {
    return getByIndexSync(r'sqliteId', [sqliteId]);
  }

  Future<bool> deleteBySqliteId(int? sqliteId) {
    return deleteByIndex(r'sqliteId', [sqliteId]);
  }

  bool deleteBySqliteIdSync(int? sqliteId) {
    return deleteByIndexSync(r'sqliteId', [sqliteId]);
  }

  Future<List<IsarHadith?>> getAllBySqliteId(List<int?> sqliteIdValues) {
    final values = sqliteIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'sqliteId', values);
  }

  List<IsarHadith?> getAllBySqliteIdSync(List<int?> sqliteIdValues) {
    final values = sqliteIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'sqliteId', values);
  }

  Future<int> deleteAllBySqliteId(List<int?> sqliteIdValues) {
    final values = sqliteIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'sqliteId', values);
  }

  int deleteAllBySqliteIdSync(List<int?> sqliteIdValues) {
    final values = sqliteIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'sqliteId', values);
  }

  Future<Id> putBySqliteId(IsarHadith object) {
    return putByIndex(r'sqliteId', object);
  }

  Id putBySqliteIdSync(IsarHadith object, {bool saveLinks = true}) {
    return putByIndexSync(r'sqliteId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySqliteId(List<IsarHadith> objects) {
    return putAllByIndex(r'sqliteId', objects);
  }

  List<Id> putAllBySqliteIdSync(
    List<IsarHadith> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'sqliteId', objects, saveLinks: saveLinks);
  }
}

extension IsarHadithQueryWhereSort
    on QueryBuilder<IsarHadith, IsarHadith, QWhere> {
  QueryBuilder<IsarHadith, IsarHadith, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhere> anySqliteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'sqliteId'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhere> anyHadithNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'hadithNumber'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhere> anyArabicText() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'arabicText'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhere> anyUrduText() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'urduText'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhere> anyEnglishText() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'englishText'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhere> anyIsPrimary() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isPrimary'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhere> anyParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'parentId'),
      );
    });
  }
}

extension IsarHadithQueryWhere
    on QueryBuilder<IsarHadith, IsarHadith, QWhereClause> {
  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> sqliteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sqliteId', value: [null]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> sqliteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sqliteId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> sqliteIdEqualTo(
    int? sqliteId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sqliteId', value: [sqliteId]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> sqliteIdNotEqualTo(
    int? sqliteId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sqliteId',
                lower: [],
                upper: [sqliteId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sqliteId',
                lower: [sqliteId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sqliteId',
                lower: [sqliteId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sqliteId',
                lower: [],
                upper: [sqliteId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> sqliteIdGreaterThan(
    int? sqliteId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sqliteId',
          lower: [sqliteId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> sqliteIdLessThan(
    int? sqliteId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sqliteId',
          lower: [],
          upper: [sqliteId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> sqliteIdBetween(
    int? lowerSqliteId,
    int? upperSqliteId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'sqliteId',
          lower: [lowerSqliteId],
          includeLower: includeLower,
          upper: [upperSqliteId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> hadithNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'hadithNumber', value: [null]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  hadithNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithNumber',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> hadithNumberEqualTo(
    String? hadithNumber,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'hadithNumber',
          value: [hadithNumber],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  hadithNumberNotEqualTo(String? hadithNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithNumber',
                lower: [],
                upper: [hadithNumber],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithNumber',
                lower: [hadithNumber],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithNumber',
                lower: [hadithNumber],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithNumber',
                lower: [],
                upper: [hadithNumber],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  hadithNumberGreaterThan(String? hadithNumber, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithNumber',
          lower: [hadithNumber],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> hadithNumberLessThan(
    String? hadithNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithNumber',
          lower: [],
          upper: [hadithNumber],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> hadithNumberBetween(
    String? lowerHadithNumber,
    String? upperHadithNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithNumber',
          lower: [lowerHadithNumber],
          includeLower: includeLower,
          upper: [upperHadithNumber],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  hadithNumberStartsWith(String HadithNumberPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithNumber',
          lower: [HadithNumberPrefix],
          upper: ['$HadithNumberPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  hadithNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'hadithNumber', value: ['']),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  hadithNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'hadithNumber',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'hadithNumber',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'hadithNumber',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'hadithNumber',
                upper: [''],
              ),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> arabicTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'arabicText', value: [null]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  arabicTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'arabicText',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> arabicTextEqualTo(
    String? arabicText,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'arabicText', value: [arabicText]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> arabicTextNotEqualTo(
    String? arabicText,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'arabicText',
                lower: [],
                upper: [arabicText],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'arabicText',
                lower: [arabicText],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'arabicText',
                lower: [arabicText],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'arabicText',
                lower: [],
                upper: [arabicText],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> arabicTextGreaterThan(
    String? arabicText, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'arabicText',
          lower: [arabicText],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> arabicTextLessThan(
    String? arabicText, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'arabicText',
          lower: [],
          upper: [arabicText],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> arabicTextBetween(
    String? lowerArabicText,
    String? upperArabicText, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'arabicText',
          lower: [lowerArabicText],
          includeLower: includeLower,
          upper: [upperArabicText],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> arabicTextStartsWith(
    String ArabicTextPrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'arabicText',
          lower: [ArabicTextPrefix],
          upper: ['$ArabicTextPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> arabicTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'arabicText', value: ['']),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  arabicTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'arabicText', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'arabicText',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'arabicText',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'arabicText', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> urduTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'urduText', value: [null]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> urduTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'urduText',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> urduTextEqualTo(
    String? urduText,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'urduText', value: [urduText]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> urduTextNotEqualTo(
    String? urduText,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'urduText',
                lower: [],
                upper: [urduText],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'urduText',
                lower: [urduText],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'urduText',
                lower: [urduText],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'urduText',
                lower: [],
                upper: [urduText],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> urduTextGreaterThan(
    String? urduText, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'urduText',
          lower: [urduText],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> urduTextLessThan(
    String? urduText, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'urduText',
          lower: [],
          upper: [urduText],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> urduTextBetween(
    String? lowerUrduText,
    String? upperUrduText, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'urduText',
          lower: [lowerUrduText],
          includeLower: includeLower,
          upper: [upperUrduText],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> urduTextStartsWith(
    String UrduTextPrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'urduText',
          lower: [UrduTextPrefix],
          upper: ['$UrduTextPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> urduTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'urduText', value: ['']),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> urduTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'urduText', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'urduText', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'urduText', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'urduText', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> englishTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'englishText', value: [null]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  englishTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'englishText',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> englishTextEqualTo(
    String? englishText,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'englishText',
          value: [englishText],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> englishTextNotEqualTo(
    String? englishText,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'englishText',
                lower: [],
                upper: [englishText],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'englishText',
                lower: [englishText],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'englishText',
                lower: [englishText],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'englishText',
                lower: [],
                upper: [englishText],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  englishTextGreaterThan(String? englishText, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'englishText',
          lower: [englishText],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> englishTextLessThan(
    String? englishText, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'englishText',
          lower: [],
          upper: [englishText],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> englishTextBetween(
    String? lowerEnglishText,
    String? upperEnglishText, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'englishText',
          lower: [lowerEnglishText],
          includeLower: includeLower,
          upper: [upperEnglishText],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> englishTextStartsWith(
    String EnglishTextPrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'englishText',
          lower: [EnglishTextPrefix],
          upper: ['$EnglishTextPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> englishTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'englishText', value: ['']),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause>
  englishTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'englishText', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'englishText',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'englishText',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'englishText', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> isPrimaryEqualTo(
    bool isPrimary,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'isPrimary', value: [isPrimary]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> isPrimaryNotEqualTo(
    bool isPrimary,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isPrimary',
                lower: [],
                upper: [isPrimary],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isPrimary',
                lower: [isPrimary],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isPrimary',
                lower: [isPrimary],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isPrimary',
                lower: [],
                upper: [isPrimary],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> parentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'parentId', value: [null]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> parentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'parentId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> parentIdEqualTo(
    int? parentId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'parentId', value: [parentId]),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> parentIdNotEqualTo(
    int? parentId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'parentId',
                lower: [],
                upper: [parentId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'parentId',
                lower: [parentId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'parentId',
                lower: [parentId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'parentId',
                lower: [],
                upper: [parentId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> parentIdGreaterThan(
    int? parentId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'parentId',
          lower: [parentId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> parentIdLessThan(
    int? parentId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'parentId',
          lower: [],
          upper: [parentId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterWhereClause> parentIdBetween(
    int? lowerParentId,
    int? upperParentId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'parentId',
          lower: [lowerParentId],
          includeLower: includeLower,
          upper: [upperParentId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarHadithQueryFilter
    on QueryBuilder<IsarHadith, IsarHadith, QFilterCondition> {
  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  arabicTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'arabicText'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  arabicTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'arabicText'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> arabicTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  arabicTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  arabicTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> arabicTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'arabicText',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  arabicTextStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  arabicTextEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  arabicTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'arabicText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> arabicTextMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'arabicText',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  arabicTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'arabicText', value: ''),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  arabicTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'arabicText', value: ''),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  chapterIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'chapterId'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  chapterIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'chapterId'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> chapterIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chapterId', value: value),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  chapterIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chapterId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> chapterIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chapterId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> chapterIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chapterId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'englishText'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'englishText'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'englishText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'englishText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'englishText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'englishText',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'englishText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'englishText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'englishText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'englishText',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'englishText', value: ''),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  englishTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'englishText', value: ''),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'hadithNumber'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'hadithNumber'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'hadithNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hadithNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hadithNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hadithNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'hadithNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'hadithNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'hadithNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'hadithNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hadithNumber', value: ''),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  hadithNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'hadithNumber', value: ''),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> isPrimaryEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isPrimary', value: value),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> parentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'parentId'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  parentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'parentId'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> parentIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'parentId', value: value),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  parentIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'parentId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> parentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'parentId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> parentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'parentId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> sqliteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'sqliteId'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  sqliteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'sqliteId'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> sqliteIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sqliteId', value: value),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  sqliteIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sqliteId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> sqliteIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sqliteId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> sqliteIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sqliteId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> urduTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'urduText'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  urduTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'urduText'),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> urduTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'urduText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  urduTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'urduText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> urduTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'urduText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> urduTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'urduText',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  urduTextStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'urduText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> urduTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'urduText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> urduTextContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'urduText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition> urduTextMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'urduText',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  urduTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'urduText', value: ''),
      );
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterFilterCondition>
  urduTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'urduText', value: ''),
      );
    });
  }
}

extension IsarHadithQueryObject
    on QueryBuilder<IsarHadith, IsarHadith, QFilterCondition> {}

extension IsarHadithQueryLinks
    on QueryBuilder<IsarHadith, IsarHadith, QFilterCondition> {}

extension IsarHadithQuerySortBy
    on QueryBuilder<IsarHadith, IsarHadith, QSortBy> {
  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByArabicText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabicText', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByArabicTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabicText', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByEnglishText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishText', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByEnglishTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishText', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByHadithNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByHadithNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByIsPrimary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrimary', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByIsPrimaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrimary', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortBySqliteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sqliteId', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortBySqliteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sqliteId', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByUrduText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urduText', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> sortByUrduTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urduText', Sort.desc);
    });
  }
}

extension IsarHadithQuerySortThenBy
    on QueryBuilder<IsarHadith, IsarHadith, QSortThenBy> {
  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByArabicText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabicText', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByArabicTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arabicText', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByEnglishText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishText', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByEnglishTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishText', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByHadithNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithNumber', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByHadithNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithNumber', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByIsPrimary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrimary', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByIsPrimaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrimary', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenBySqliteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sqliteId', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenBySqliteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sqliteId', Sort.desc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByUrduText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urduText', Sort.asc);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QAfterSortBy> thenByUrduTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'urduText', Sort.desc);
    });
  }
}

extension IsarHadithQueryWhereDistinct
    on QueryBuilder<IsarHadith, IsarHadith, QDistinct> {
  QueryBuilder<IsarHadith, IsarHadith, QDistinct> distinctByArabicText({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'arabicText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QDistinct> distinctByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterId');
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QDistinct> distinctByEnglishText({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'englishText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QDistinct> distinctByHadithNumber({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QDistinct> distinctByIsPrimary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPrimary');
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QDistinct> distinctByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentId');
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QDistinct> distinctBySqliteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sqliteId');
    });
  }

  QueryBuilder<IsarHadith, IsarHadith, QDistinct> distinctByUrduText({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'urduText', caseSensitive: caseSensitive);
    });
  }
}

extension IsarHadithQueryProperty
    on QueryBuilder<IsarHadith, IsarHadith, QQueryProperty> {
  QueryBuilder<IsarHadith, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarHadith, String?, QQueryOperations> arabicTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'arabicText');
    });
  }

  QueryBuilder<IsarHadith, int?, QQueryOperations> chapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterId');
    });
  }

  QueryBuilder<IsarHadith, String?, QQueryOperations> englishTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'englishText');
    });
  }

  QueryBuilder<IsarHadith, String?, QQueryOperations> hadithNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithNumber');
    });
  }

  QueryBuilder<IsarHadith, bool, QQueryOperations> isPrimaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPrimary');
    });
  }

  QueryBuilder<IsarHadith, int?, QQueryOperations> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentId');
    });
  }

  QueryBuilder<IsarHadith, int?, QQueryOperations> sqliteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sqliteId');
    });
  }

  QueryBuilder<IsarHadith, String?, QQueryOperations> urduTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'urduText');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarBookmarkCollection on Isar {
  IsarCollection<IsarBookmark> get isarBookmarks => this.collection();
}

const IsarBookmarkSchema = CollectionSchema(
  name: r'IsarBookmark',
  id: 4634539686431133545,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'hadithId': PropertySchema(id: 1, name: r'hadithId', type: IsarType.long),
  },

  estimateSize: _isarBookmarkEstimateSize,
  serialize: _isarBookmarkSerialize,
  deserialize: _isarBookmarkDeserialize,
  deserializeProp: _isarBookmarkDeserializeProp,
  idName: r'id',
  indexes: {
    r'hadithId': IndexSchema(
      id: 3874849906276205956,
      name: r'hadithId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hadithId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarBookmarkGetId,
  getLinks: _isarBookmarkGetLinks,
  attach: _isarBookmarkAttach,
  version: '3.3.2',
);

int _isarBookmarkEstimateSize(
  IsarBookmark object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _isarBookmarkSerialize(
  IsarBookmark object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.hadithId);
}

IsarBookmark _isarBookmarkDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBookmark();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.hadithId = reader.readLongOrNull(offsets[1]);
  object.id = id;
  return object;
}

P _isarBookmarkDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarBookmarkGetId(IsarBookmark object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarBookmarkGetLinks(IsarBookmark object) {
  return [];
}

void _isarBookmarkAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarBookmark object,
) {
  object.id = id;
}

extension IsarBookmarkByIndex on IsarCollection<IsarBookmark> {
  Future<IsarBookmark?> getByHadithId(int? hadithId) {
    return getByIndex(r'hadithId', [hadithId]);
  }

  IsarBookmark? getByHadithIdSync(int? hadithId) {
    return getByIndexSync(r'hadithId', [hadithId]);
  }

  Future<bool> deleteByHadithId(int? hadithId) {
    return deleteByIndex(r'hadithId', [hadithId]);
  }

  bool deleteByHadithIdSync(int? hadithId) {
    return deleteByIndexSync(r'hadithId', [hadithId]);
  }

  Future<List<IsarBookmark?>> getAllByHadithId(List<int?> hadithIdValues) {
    final values = hadithIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'hadithId', values);
  }

  List<IsarBookmark?> getAllByHadithIdSync(List<int?> hadithIdValues) {
    final values = hadithIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'hadithId', values);
  }

  Future<int> deleteAllByHadithId(List<int?> hadithIdValues) {
    final values = hadithIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'hadithId', values);
  }

  int deleteAllByHadithIdSync(List<int?> hadithIdValues) {
    final values = hadithIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'hadithId', values);
  }

  Future<Id> putByHadithId(IsarBookmark object) {
    return putByIndex(r'hadithId', object);
  }

  Id putByHadithIdSync(IsarBookmark object, {bool saveLinks = true}) {
    return putByIndexSync(r'hadithId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByHadithId(List<IsarBookmark> objects) {
    return putAllByIndex(r'hadithId', objects);
  }

  List<Id> putAllByHadithIdSync(
    List<IsarBookmark> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'hadithId', objects, saveLinks: saveLinks);
  }
}

extension IsarBookmarkQueryWhereSort
    on QueryBuilder<IsarBookmark, IsarBookmark, QWhere> {
  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhere> anyHadithId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'hadithId'),
      );
    });
  }
}

extension IsarBookmarkQueryWhere
    on QueryBuilder<IsarBookmark, IsarBookmark, QWhereClause> {
  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause> hadithIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'hadithId', value: [null]),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause>
  hadithIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause> hadithIdEqualTo(
    int? hadithId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'hadithId', value: [hadithId]),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause>
  hadithIdNotEqualTo(int? hadithId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithId',
                lower: [],
                upper: [hadithId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithId',
                lower: [hadithId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithId',
                lower: [hadithId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithId',
                lower: [],
                upper: [hadithId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause>
  hadithIdGreaterThan(int? hadithId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithId',
          lower: [hadithId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause> hadithIdLessThan(
    int? hadithId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithId',
          lower: [],
          upper: [hadithId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterWhereClause> hadithIdBetween(
    int? lowerHadithId,
    int? upperHadithId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithId',
          lower: [lowerHadithId],
          includeLower: includeLower,
          upper: [upperHadithId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarBookmarkQueryFilter
    on QueryBuilder<IsarBookmark, IsarBookmark, QFilterCondition> {
  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  createdAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  createdAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  hadithIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'hadithId'),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  hadithIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'hadithId'),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  hadithIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hadithId', value: value),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  hadithIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hadithId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  hadithIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hadithId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition>
  hadithIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hadithId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarBookmarkQueryObject
    on QueryBuilder<IsarBookmark, IsarBookmark, QFilterCondition> {}

extension IsarBookmarkQueryLinks
    on QueryBuilder<IsarBookmark, IsarBookmark, QFilterCondition> {}

extension IsarBookmarkQuerySortBy
    on QueryBuilder<IsarBookmark, IsarBookmark, QSortBy> {
  QueryBuilder<IsarBookmark, IsarBookmark, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterSortBy> sortByHadithId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithId', Sort.asc);
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterSortBy> sortByHadithIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithId', Sort.desc);
    });
  }
}

extension IsarBookmarkQuerySortThenBy
    on QueryBuilder<IsarBookmark, IsarBookmark, QSortThenBy> {
  QueryBuilder<IsarBookmark, IsarBookmark, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterSortBy> thenByHadithId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithId', Sort.asc);
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterSortBy> thenByHadithIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithId', Sort.desc);
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarBookmarkQueryWhereDistinct
    on QueryBuilder<IsarBookmark, IsarBookmark, QDistinct> {
  QueryBuilder<IsarBookmark, IsarBookmark, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarBookmark, IsarBookmark, QDistinct> distinctByHadithId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithId');
    });
  }
}

extension IsarBookmarkQueryProperty
    on QueryBuilder<IsarBookmark, IsarBookmark, QQueryProperty> {
  QueryBuilder<IsarBookmark, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarBookmark, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarBookmark, int?, QQueryOperations> hadithIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarHadithCollectionCollection on Isar {
  IsarCollection<IsarHadithCollection> get isarHadithCollections =>
      this.collection();
}

const IsarHadithCollectionSchema = CollectionSchema(
  name: r'IsarHadithCollection',
  id: 2810775686564181443,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(id: 1, name: r'name', type: IsarType.string),
  },

  estimateSize: _isarHadithCollectionEstimateSize,
  serialize: _isarHadithCollectionSerialize,
  deserialize: _isarHadithCollectionDeserialize,
  deserializeProp: _isarHadithCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {
    r'hadiths': LinkSchema(
      id: -4604503684550322922,
      name: r'hadiths',
      target: r'IsarHadith',
      single: false,
    ),
  },
  embeddedSchemas: {},

  getId: _isarHadithCollectionGetId,
  getLinks: _isarHadithCollectionGetLinks,
  attach: _isarHadithCollectionAttach,
  version: '3.3.2',
);

int _isarHadithCollectionEstimateSize(
  IsarHadithCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarHadithCollectionSerialize(
  IsarHadithCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.name);
}

IsarHadithCollection _isarHadithCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarHadithCollection();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[1]);
  return object;
}

P _isarHadithCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarHadithCollectionGetId(IsarHadithCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarHadithCollectionGetLinks(
  IsarHadithCollection object,
) {
  return [object.hadiths];
}

void _isarHadithCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarHadithCollection object,
) {
  object.id = id;
  object.hadiths.attach(col, col.isar.collection<IsarHadith>(), r'hadiths', id);
}

extension IsarHadithCollectionByIndex on IsarCollection<IsarHadithCollection> {
  Future<IsarHadithCollection?> getByName(String? name) {
    return getByIndex(r'name', [name]);
  }

  IsarHadithCollection? getByNameSync(String? name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String? name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String? name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<IsarHadithCollection?>> getAllByName(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<IsarHadithCollection?> getAllByNameSync(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String?> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(IsarHadithCollection object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(IsarHadithCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<IsarHadithCollection> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(
    List<IsarHadithCollection> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension IsarHadithCollectionQueryWhereSort
    on QueryBuilder<IsarHadithCollection, IsarHadithCollection, QWhere> {
  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarHadithCollectionQueryWhere
    on QueryBuilder<IsarHadithCollection, IsarHadithCollection, QWhereClause> {
  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterWhereClause>
  nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [null]),
      );
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterWhereClause>
  nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterWhereClause>
  nameEqualTo(String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [name]),
      );
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterWhereClause>
  nameNotEqualTo(String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension IsarHadithCollectionQueryFilter
    on
        QueryBuilder<
          IsarHadithCollection,
          IsarHadithCollection,
          QFilterCondition
        > {
  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  createdAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  createdAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'name'),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'name'),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }
}

extension IsarHadithCollectionQueryObject
    on
        QueryBuilder<
          IsarHadithCollection,
          IsarHadithCollection,
          QFilterCondition
        > {}

extension IsarHadithCollectionQueryLinks
    on
        QueryBuilder<
          IsarHadithCollection,
          IsarHadithCollection,
          QFilterCondition
        > {
  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  hadiths(FilterQuery<IsarHadith> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'hadiths');
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  hadithsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'hadiths', length, true, length, true);
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  hadithsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'hadiths', 0, true, 0, true);
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  hadithsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'hadiths', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  hadithsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'hadiths', 0, true, length, include);
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  hadithsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'hadiths', length, include, 999999, true);
    });
  }

  QueryBuilder<
    IsarHadithCollection,
    IsarHadithCollection,
    QAfterFilterCondition
  >
  hadithsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'hadiths',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IsarHadithCollectionQuerySortBy
    on QueryBuilder<IsarHadithCollection, IsarHadithCollection, QSortBy> {
  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension IsarHadithCollectionQuerySortThenBy
    on QueryBuilder<IsarHadithCollection, IsarHadithCollection, QSortThenBy> {
  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension IsarHadithCollectionQueryWhereDistinct
    on QueryBuilder<IsarHadithCollection, IsarHadithCollection, QDistinct> {
  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarHadithCollection, IsarHadithCollection, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension IsarHadithCollectionQueryProperty
    on
        QueryBuilder<
          IsarHadithCollection,
          IsarHadithCollection,
          QQueryProperty
        > {
  QueryBuilder<IsarHadithCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarHadithCollection, DateTime?, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarHadithCollection, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarNoteCollection on Isar {
  IsarCollection<IsarNote> get isarNotes => this.collection();
}

const IsarNoteSchema = CollectionSchema(
  name: r'IsarNote',
  id: -6588628299822617142,
  properties: {
    r'content': PropertySchema(id: 0, name: r'content', type: IsarType.string),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'hadithId': PropertySchema(id: 2, name: r'hadithId', type: IsarType.long),
    r'updatedAt': PropertySchema(
      id: 3,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _isarNoteEstimateSize,
  serialize: _isarNoteSerialize,
  deserialize: _isarNoteDeserialize,
  deserializeProp: _isarNoteDeserializeProp,
  idName: r'id',
  indexes: {
    r'hadithId': IndexSchema(
      id: 3874849906276205956,
      name: r'hadithId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hadithId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarNoteGetId,
  getLinks: _isarNoteGetLinks,
  attach: _isarNoteAttach,
  version: '3.3.2',
);

int _isarNoteEstimateSize(
  IsarNote object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.content;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarNoteSerialize(
  IsarNote object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.hadithId);
  writer.writeDateTime(offsets[3], object.updatedAt);
}

IsarNote _isarNoteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarNote();
  object.content = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTimeOrNull(offsets[1]);
  object.hadithId = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.updatedAt = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _isarNoteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarNoteGetId(IsarNote object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarNoteGetLinks(IsarNote object) {
  return [];
}

void _isarNoteAttach(IsarCollection<dynamic> col, Id id, IsarNote object) {
  object.id = id;
}

extension IsarNoteByIndex on IsarCollection<IsarNote> {
  Future<IsarNote?> getByHadithId(int? hadithId) {
    return getByIndex(r'hadithId', [hadithId]);
  }

  IsarNote? getByHadithIdSync(int? hadithId) {
    return getByIndexSync(r'hadithId', [hadithId]);
  }

  Future<bool> deleteByHadithId(int? hadithId) {
    return deleteByIndex(r'hadithId', [hadithId]);
  }

  bool deleteByHadithIdSync(int? hadithId) {
    return deleteByIndexSync(r'hadithId', [hadithId]);
  }

  Future<List<IsarNote?>> getAllByHadithId(List<int?> hadithIdValues) {
    final values = hadithIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'hadithId', values);
  }

  List<IsarNote?> getAllByHadithIdSync(List<int?> hadithIdValues) {
    final values = hadithIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'hadithId', values);
  }

  Future<int> deleteAllByHadithId(List<int?> hadithIdValues) {
    final values = hadithIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'hadithId', values);
  }

  int deleteAllByHadithIdSync(List<int?> hadithIdValues) {
    final values = hadithIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'hadithId', values);
  }

  Future<Id> putByHadithId(IsarNote object) {
    return putByIndex(r'hadithId', object);
  }

  Id putByHadithIdSync(IsarNote object, {bool saveLinks = true}) {
    return putByIndexSync(r'hadithId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByHadithId(List<IsarNote> objects) {
    return putAllByIndex(r'hadithId', objects);
  }

  List<Id> putAllByHadithIdSync(
    List<IsarNote> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'hadithId', objects, saveLinks: saveLinks);
  }
}

extension IsarNoteQueryWhereSort on QueryBuilder<IsarNote, IsarNote, QWhere> {
  QueryBuilder<IsarNote, IsarNote, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhere> anyHadithId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'hadithId'),
      );
    });
  }
}

extension IsarNoteQueryWhere on QueryBuilder<IsarNote, IsarNote, QWhereClause> {
  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> hadithIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'hadithId', value: [null]),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> hadithIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> hadithIdEqualTo(
    int? hadithId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'hadithId', value: [hadithId]),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> hadithIdNotEqualTo(
    int? hadithId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithId',
                lower: [],
                upper: [hadithId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithId',
                lower: [hadithId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithId',
                lower: [hadithId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hadithId',
                lower: [],
                upper: [hadithId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> hadithIdGreaterThan(
    int? hadithId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithId',
          lower: [hadithId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> hadithIdLessThan(
    int? hadithId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithId',
          lower: [],
          upper: [hadithId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterWhereClause> hadithIdBetween(
    int? lowerHadithId,
    int? upperHadithId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'hadithId',
          lower: [lowerHadithId],
          includeLower: includeLower,
          upper: [upperHadithId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarNoteQueryFilter
    on QueryBuilder<IsarNote, IsarNote, QFilterCondition> {
  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'content'),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'content'),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'content',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'content',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'content',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'content', value: ''),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'content', value: ''),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> createdAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> hadithIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'hadithId'),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> hadithIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'hadithId'),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> hadithIdEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hadithId', value: value),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> hadithIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hadithId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> hadithIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hadithId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> hadithIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hadithId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> updatedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarNoteQueryObject
    on QueryBuilder<IsarNote, IsarNote, QFilterCondition> {}

extension IsarNoteQueryLinks
    on QueryBuilder<IsarNote, IsarNote, QFilterCondition> {}

extension IsarNoteQuerySortBy on QueryBuilder<IsarNote, IsarNote, QSortBy> {
  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> sortByHadithId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithId', Sort.asc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> sortByHadithIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithId', Sort.desc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarNoteQuerySortThenBy
    on QueryBuilder<IsarNote, IsarNote, QSortThenBy> {
  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> thenByHadithId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithId', Sort.asc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> thenByHadithIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithId', Sort.desc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarNoteQueryWhereDistinct
    on QueryBuilder<IsarNote, IsarNote, QDistinct> {
  QueryBuilder<IsarNote, IsarNote, QDistinct> distinctByContent({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarNote, IsarNote, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarNote, IsarNote, QDistinct> distinctByHadithId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithId');
    });
  }

  QueryBuilder<IsarNote, IsarNote, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension IsarNoteQueryProperty
    on QueryBuilder<IsarNote, IsarNote, QQueryProperty> {
  QueryBuilder<IsarNote, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarNote, String?, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<IsarNote, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarNote, int?, QQueryOperations> hadithIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithId');
    });
  }

  QueryBuilder<IsarNote, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarReadingProgressCollection on Isar {
  IsarCollection<IsarReadingProgress> get isarReadingProgress =>
      this.collection();
}

const IsarReadingProgressSchema = CollectionSchema(
  name: r'IsarReadingProgress',
  id: 4040007429963721947,
  properties: {
    r'chapterId': PropertySchema(
      id: 0,
      name: r'chapterId',
      type: IsarType.long,
    ),
    r'hadithIndex': PropertySchema(
      id: 1,
      name: r'hadithIndex',
      type: IsarType.long,
    ),
    r'lastReadAt': PropertySchema(
      id: 2,
      name: r'lastReadAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _isarReadingProgressEstimateSize,
  serialize: _isarReadingProgressSerialize,
  deserialize: _isarReadingProgressDeserialize,
  deserializeProp: _isarReadingProgressDeserializeProp,
  idName: r'id',
  indexes: {
    r'chapterId': IndexSchema(
      id: -1917949875430644359,
      name: r'chapterId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'chapterId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarReadingProgressGetId,
  getLinks: _isarReadingProgressGetLinks,
  attach: _isarReadingProgressAttach,
  version: '3.3.2',
);

int _isarReadingProgressEstimateSize(
  IsarReadingProgress object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _isarReadingProgressSerialize(
  IsarReadingProgress object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.chapterId);
  writer.writeLong(offsets[1], object.hadithIndex);
  writer.writeDateTime(offsets[2], object.lastReadAt);
}

IsarReadingProgress _isarReadingProgressDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarReadingProgress();
  object.chapterId = reader.readLongOrNull(offsets[0]);
  object.hadithIndex = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.lastReadAt = reader.readDateTimeOrNull(offsets[2]);
  return object;
}

P _isarReadingProgressDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarReadingProgressGetId(IsarReadingProgress object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarReadingProgressGetLinks(
  IsarReadingProgress object,
) {
  return [];
}

void _isarReadingProgressAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarReadingProgress object,
) {
  object.id = id;
}

extension IsarReadingProgressByIndex on IsarCollection<IsarReadingProgress> {
  Future<IsarReadingProgress?> getByChapterId(int? chapterId) {
    return getByIndex(r'chapterId', [chapterId]);
  }

  IsarReadingProgress? getByChapterIdSync(int? chapterId) {
    return getByIndexSync(r'chapterId', [chapterId]);
  }

  Future<bool> deleteByChapterId(int? chapterId) {
    return deleteByIndex(r'chapterId', [chapterId]);
  }

  bool deleteByChapterIdSync(int? chapterId) {
    return deleteByIndexSync(r'chapterId', [chapterId]);
  }

  Future<List<IsarReadingProgress?>> getAllByChapterId(
    List<int?> chapterIdValues,
  ) {
    final values = chapterIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'chapterId', values);
  }

  List<IsarReadingProgress?> getAllByChapterIdSync(List<int?> chapterIdValues) {
    final values = chapterIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'chapterId', values);
  }

  Future<int> deleteAllByChapterId(List<int?> chapterIdValues) {
    final values = chapterIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'chapterId', values);
  }

  int deleteAllByChapterIdSync(List<int?> chapterIdValues) {
    final values = chapterIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'chapterId', values);
  }

  Future<Id> putByChapterId(IsarReadingProgress object) {
    return putByIndex(r'chapterId', object);
  }

  Id putByChapterIdSync(IsarReadingProgress object, {bool saveLinks = true}) {
    return putByIndexSync(r'chapterId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByChapterId(List<IsarReadingProgress> objects) {
    return putAllByIndex(r'chapterId', objects);
  }

  List<Id> putAllByChapterIdSync(
    List<IsarReadingProgress> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'chapterId', objects, saveLinks: saveLinks);
  }
}

extension IsarReadingProgressQueryWhereSort
    on QueryBuilder<IsarReadingProgress, IsarReadingProgress, QWhere> {
  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhere>
  anyChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'chapterId'),
      );
    });
  }
}

extension IsarReadingProgressQueryWhere
    on QueryBuilder<IsarReadingProgress, IsarReadingProgress, QWhereClause> {
  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  chapterIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'chapterId', value: [null]),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  chapterIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'chapterId',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  chapterIdEqualTo(int? chapterId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'chapterId', value: [chapterId]),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  chapterIdNotEqualTo(int? chapterId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chapterId',
                lower: [],
                upper: [chapterId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chapterId',
                lower: [chapterId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chapterId',
                lower: [chapterId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'chapterId',
                lower: [],
                upper: [chapterId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  chapterIdGreaterThan(int? chapterId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'chapterId',
          lower: [chapterId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  chapterIdLessThan(int? chapterId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'chapterId',
          lower: [],
          upper: [chapterId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterWhereClause>
  chapterIdBetween(
    int? lowerChapterId,
    int? upperChapterId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'chapterId',
          lower: [lowerChapterId],
          includeLower: includeLower,
          upper: [upperChapterId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarReadingProgressQueryFilter
    on
        QueryBuilder<
          IsarReadingProgress,
          IsarReadingProgress,
          QFilterCondition
        > {
  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  chapterIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'chapterId'),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  chapterIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'chapterId'),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  chapterIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chapterId', value: value),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  chapterIdGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chapterId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  chapterIdLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chapterId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  chapterIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chapterId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  hadithIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'hadithIndex'),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  hadithIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'hadithIndex'),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  hadithIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hadithIndex', value: value),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  hadithIndexGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hadithIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  hadithIndexLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hadithIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  hadithIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hadithIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  lastReadAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastReadAt'),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  lastReadAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastReadAt'),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  lastReadAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastReadAt', value: value),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  lastReadAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastReadAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  lastReadAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastReadAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterFilterCondition>
  lastReadAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastReadAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarReadingProgressQueryObject
    on
        QueryBuilder<
          IsarReadingProgress,
          IsarReadingProgress,
          QFilterCondition
        > {}

extension IsarReadingProgressQueryLinks
    on
        QueryBuilder<
          IsarReadingProgress,
          IsarReadingProgress,
          QFilterCondition
        > {}

extension IsarReadingProgressQuerySortBy
    on QueryBuilder<IsarReadingProgress, IsarReadingProgress, QSortBy> {
  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  sortByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  sortByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  sortByHadithIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithIndex', Sort.asc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  sortByHadithIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithIndex', Sort.desc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  sortByLastReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadAt', Sort.asc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  sortByLastReadAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadAt', Sort.desc);
    });
  }
}

extension IsarReadingProgressQuerySortThenBy
    on QueryBuilder<IsarReadingProgress, IsarReadingProgress, QSortThenBy> {
  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  thenByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.asc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  thenByChapterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterId', Sort.desc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  thenByHadithIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithIndex', Sort.asc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  thenByHadithIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithIndex', Sort.desc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  thenByLastReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadAt', Sort.asc);
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QAfterSortBy>
  thenByLastReadAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadAt', Sort.desc);
    });
  }
}

extension IsarReadingProgressQueryWhereDistinct
    on QueryBuilder<IsarReadingProgress, IsarReadingProgress, QDistinct> {
  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QDistinct>
  distinctByChapterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterId');
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QDistinct>
  distinctByHadithIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithIndex');
    });
  }

  QueryBuilder<IsarReadingProgress, IsarReadingProgress, QDistinct>
  distinctByLastReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReadAt');
    });
  }
}

extension IsarReadingProgressQueryProperty
    on QueryBuilder<IsarReadingProgress, IsarReadingProgress, QQueryProperty> {
  QueryBuilder<IsarReadingProgress, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarReadingProgress, int?, QQueryOperations>
  chapterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterId');
    });
  }

  QueryBuilder<IsarReadingProgress, int?, QQueryOperations>
  hadithIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithIndex');
    });
  }

  QueryBuilder<IsarReadingProgress, DateTime?, QQueryOperations>
  lastReadAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReadAt');
    });
  }
}
