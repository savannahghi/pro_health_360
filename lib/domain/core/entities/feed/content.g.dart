// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Content _$_$_ContentFromJson(Map<String, dynamic> json) {
  return _$_Content(
    contentID: json['contentID'] as String?,
    title: json['title'] as String?,
    body: json['body'] as String?,
    author: json['author'] as String?,
    authorAvatar: json['authorAvatar'] as String?,
    heroImage: json['heroImage'] as String?,
    contentType:
        _$enumDecodeNullable(_$ContentTypeEnumMap, json['contentType']),
    publicLink: json['publicLink'] as String?,
    isNew: json['isNew'] as bool?,
    estimate: json['estimate'] as String?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    createdAt: json['createdAt'] as String?,
  );
}

Map<String, dynamic> _$_$_ContentToJson(_$_Content instance) =>
    <String, dynamic>{
      'contentID': instance.contentID,
      'title': instance.title,
      'body': instance.body,
      'author': instance.author,
      'authorAvatar': instance.authorAvatar,
      'heroImage': instance.heroImage,
      'contentType': _$ContentTypeEnumMap[instance.contentType],
      'publicLink': instance.publicLink,
      'isNew': instance.isNew,
      'estimate': instance.estimate,
      'tags': instance.tags,
      'createdAt': instance.createdAt,
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
  ContentType.VIDEO: 'VIDEO',
  ContentType.AUDIO: 'AUDIO',
  ContentType.ARTICLE: 'ARTICLE',
};
