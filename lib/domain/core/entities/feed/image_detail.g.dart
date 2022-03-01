// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageDetail _$$_ImageDetailFromJson(Map<String, dynamic> json) =>
    _$_ImageDetail(
      id: json['id'] as int?,
      title: json['title'] as String?,
      meta: json['meta'] == null
          ? null
          : ImageMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ImageDetailToJson(_$_ImageDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'meta': instance.meta,
    };
