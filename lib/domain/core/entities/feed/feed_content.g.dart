// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedContent _$_$_FeedContentFromJson(Map<String, dynamic> json) {
  return _$_FeedContent(
    feedContent: json['getContent'] == null
        ? null
        : FeedItems.fromJson(json['getContent'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_FeedContentToJson(_$_FeedContent instance) =>
    <String, dynamic>{
      'getContent': instance.feedContent,
    };
