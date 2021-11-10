// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedDetails _$_$_FeedDetailsFromJson(Map<String, dynamic> json) {
  return _$_FeedDetails(
    coverImageUrl: json['coverImageUrl'] as String,
    header: json['header'] as String,
    date: json['date'] as String,
    readTime: json['readTime'] as String?,
    authorName: json['authorName'] as String,
    bodyContent: json['bodyContent'] as String,
    authorDisplayPic: json['authorDisplayPic'] as String?,
    isNew: json['isNew'] as bool?,
    type: _$enumDecodeNullable(_$FeedTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$_$_FeedDetailsToJson(_$_FeedDetails instance) =>
    <String, dynamic>{
      'coverImageUrl': instance.coverImageUrl,
      'header': instance.header,
      'date': instance.date,
      'readTime': instance.readTime,
      'authorName': instance.authorName,
      'bodyContent': instance.bodyContent,
      'authorDisplayPic': instance.authorDisplayPic,
      'isNew': instance.isNew,
      'type': _$FeedTypeEnumMap[instance.type],
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

const _$FeedTypeEnumMap = {
  FeedType.Video: 'Video',
  FeedType.Article: 'Article',
};
