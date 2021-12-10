// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeaturedMedia _$_$_FeaturedMediaFromJson(Map<String, dynamic> json) {
  return _$_FeaturedMedia(
    id: json['ID'] as int?,
    mediaUrl: json['url'] as String?,
    title: json['title'] as String?,
    featuredMediaType: _$enumDecodeNullable(
        _$FeaturedMediaTypeEnumMap, json['type'],
        unknownValue: FeaturedMediaType.UNKNOWN),
    duration: json['duration'] as int?,
    width: json['width'] as int?,
    height: json['height'] as int?,
    thumbnail: json['thumbnail'] as String?,
  );
}

Map<String, dynamic> _$_$_FeaturedMediaToJson(_$_FeaturedMedia instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'url': instance.mediaUrl,
      'title': instance.title,
      'type': _$FeaturedMediaTypeEnumMap[instance.featuredMediaType],
      'duration': instance.duration,
      'width': instance.width,
      'height': instance.height,
      'thumbnail': instance.thumbnail,
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

const _$FeaturedMediaTypeEnumMap = {
  FeaturedMediaType.audio: 'audio',
  FeaturedMediaType.video: 'video',
  FeaturedMediaType.UNKNOWN: 'UNKNOWN',
};
