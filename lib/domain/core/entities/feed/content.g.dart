// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Content _$_$_ContentFromJson(Map<String, dynamic> json) {
  return _$_Content(
    contentID: json['ID'] as int?,
    title: json['title'] as String?,
    date: json['date'] as String?,
    intro: json['intro'] as String?,
    authorName: json['authorName'] as String?,
    author: json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    contentType: _$enumDecodeNullable(_$ContentTypeEnumMap, json['itemType']),
    estimate: json['timeEstimateSeconds'] as int?,
    body: json['body'] as String?,
    heroImage: json['heroImageRendition'] == null
        ? null
        : HeroImage.fromJson(
            json['heroImageRendition'] as Map<String, dynamic>),
    likeCount: json['likeCount'] as int?,
    bookmarkCount: json['bookmarkCount'] as int?,
    viewCount: json['viewCount'] as int?,
    shareCount: json['shareCount'] as int?,
    documents: (json['documents'] as List<dynamic>?)
        ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
        .toList(),
    categories: (json['categoryDetails'] as List<dynamic>?)
        ?.map((e) => ContentCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    tags:
        (json['tagNames'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    metadata: json['meta'] == null
        ? null
        : ContentMetadata.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ContentToJson(_$_Content instance) =>
    <String, dynamic>{
      'ID': instance.contentID,
      'title': instance.title,
      'date': instance.date,
      'intro': instance.intro,
      'authorName': instance.authorName,
      'author': instance.author,
      'itemType': _$ContentTypeEnumMap[instance.contentType],
      'timeEstimateSeconds': instance.estimate,
      'body': instance.body,
      'heroImageRendition': instance.heroImage,
      'likeCount': instance.likeCount,
      'bookmarkCount': instance.bookmarkCount,
      'viewCount': instance.viewCount,
      'shareCount': instance.shareCount,
      'documents': instance.documents,
      'categoryDetails': instance.categories,
      'tagNames': instance.tags,
      'meta': instance.metadata,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ContentTypeEnumMap = {
  ContentType.AUDIOVIDEO: 'AUDIOVIDEO',
  ContentType.DOCUMENT: 'DOCUMENT',
  ContentType.ARTICLE: 'ARTICLE',
  ContentType.UNKNOWN: 'UNKNOWN',
};

_$_Document _$_$_DocumentFromJson(Map<String, dynamic> json) {
  return _$_Document(
    id: json['ID'] as int?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$_$_DocumentToJson(_$_Document instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'title': instance.title,
    };

_$_ContentCategory _$_$_ContentCategoryFromJson(Map<String, dynamic> json) {
  return _$_ContentCategory(
    id: json['ID'] as int?,
    name: json['categoryName'] as String?,
    icon: json['categoryIcon'] as String?,
  );
}

Map<String, dynamic> _$_$_ContentCategoryToJson(_$_ContentCategory instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'categoryName': instance.name,
      'categoryIcon': instance.icon,
    };

_$_ContentMetadata _$_$_ContentMetadataFromJson(Map<String, dynamic> json) {
  return _$_ContentMetadata(
    publicLink: json['contentHTMLURL'] as String?,
    createdAt: json['firstPublishedAt'] as String?,
  );
}

Map<String, dynamic> _$_$_ContentMetadataToJson(_$_ContentMetadata instance) =>
    <String, dynamic>{
      'contentHTMLURL': instance.publicLink,
      'firstPublishedAt': instance.createdAt,
    };

_$_Author _$_$_AuthorFromJson(Map<String, dynamic> json) {
  return _$_Author(
    id: json['ID'] as String?,
  );
}

Map<String, dynamic> _$_$_AuthorToJson(_$_Author instance) => <String, dynamic>{
      'ID': instance.id,
    };

_$_HeroImage _$_$_HeroImageFromJson(Map<String, dynamic> json) {
  return _$_HeroImage(
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$_$_HeroImageToJson(_$_HeroImage instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
