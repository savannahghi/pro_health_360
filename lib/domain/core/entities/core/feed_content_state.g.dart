// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_content_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedContentState _$_$_FeedContentStateFromJson(Map<String, dynamic> json) {
  return _$_FeedContentState(
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

Map<String, dynamic> _$_$_FeedContentStateToJson(
        _$_FeedContentState instance) =>
    <String, dynamic>{
      'items': instance.contentItems,
      'selectedCategory': instance.selectedCategory,
      'errorFetchingContent': instance.errorFetchingContent,
      'timeoutFetchingContent': instance.timeoutFetchingContent,
    };
