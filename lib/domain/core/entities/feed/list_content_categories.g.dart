// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_content_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListContentCategory _$$_ListContentCategoryFromJson(
        Map<String, dynamic> json) =>
    _$_ListContentCategory(
      contentCategories: (json['listContentCategories'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ContentCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingContentCategories:
          json['errorFetchingContentCategories'] as bool?,
      timeoutFetchingContentCategories:
          json['timeoutFetchingContentCategories'] as bool?,
    );

Map<String, dynamic> _$$_ListContentCategoryToJson(
        _$_ListContentCategory instance) =>
    <String, dynamic>{
      'listContentCategories': instance.contentCategories,
      'errorFetchingContentCategories': instance.errorFetchingContentCategories,
      'timeoutFetchingContentCategories':
          instance.timeoutFetchingContentCategories,
    };
