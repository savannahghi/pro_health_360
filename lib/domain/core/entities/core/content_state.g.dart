// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentState _$_$_ContentStateFromJson(Map<String, dynamic> json) {
  return _$_ContentState(
    contentItems: (json['items'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Content.fromJson(e as Map<String, dynamic>))
        .toList(),
    selectedCategory: json['selectedCategory'] == null
        ? null
        : ContentCategory.fromJson(
            json['selectedCategory'] as Map<String, dynamic>),
    errorFetchingContent: json['errorFetchingContent'] as bool?,
    timeoutFetchingContent: json['timeoutFetchingContent'] as bool?,
  );
}

Map<String, dynamic> _$_$_ContentStateToJson(_$_ContentState instance) =>
    <String, dynamic>{
      'items': instance.contentItems,
      'selectedCategory': instance.selectedCategory,
      'errorFetchingContent': instance.errorFetchingContent,
      'timeoutFetchingContent': instance.timeoutFetchingContent,
    };
