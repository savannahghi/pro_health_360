// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GalleryImage _$_$_GalleryImageFromJson(Map<String, dynamic> json) {
  return _$_GalleryImage(
    id: json['id'] as int?,
    image: json['image'] == null
        ? null
        : ImageDetail.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_GalleryImageToJson(_$_GalleryImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
