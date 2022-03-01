// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeaturedMedia _$$_FeaturedMediaFromJson(Map<String, dynamic> json) =>
    _$_FeaturedMedia(
      id: json['ID'] as int?,
      mediaUrl: json['url'] as String?,
      title: json['title'] as String?,
      featuredMediaType: $enumDecodeNullable(
          _$FeaturedMediaTypeEnumMap, json['type'],
          unknownValue: FeaturedMediaType.UNKNOWN),
      duration: json['duration'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$_FeaturedMediaToJson(_$_FeaturedMedia instance) =>
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

const _$FeaturedMediaTypeEnumMap = {
  FeaturedMediaType.audio: 'audio',
  FeaturedMediaType.video: 'video',
  FeaturedMediaType.UNKNOWN: 'UNKNOWN',
};
