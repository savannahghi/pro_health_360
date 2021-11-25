// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
