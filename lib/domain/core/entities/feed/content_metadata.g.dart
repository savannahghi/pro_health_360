// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
