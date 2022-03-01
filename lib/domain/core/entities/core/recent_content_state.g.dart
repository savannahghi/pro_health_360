// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_content_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedContentState _$$_FeedContentStateFromJson(Map<String, dynamic> json) =>
    _$_FeedContentState(
      contentItems: (json['items'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingContent: json['errorFetchingContent'] as bool?,
      timeoutFetchingContent: json['timeoutFetchingContent'] as bool?,
    );

Map<String, dynamic> _$$_FeedContentStateToJson(_$_FeedContentState instance) =>
    <String, dynamic>{
      'items': instance.contentItems,
      'errorFetchingContent': instance.errorFetchingContent,
      'timeoutFetchingContent': instance.timeoutFetchingContent,
    };
