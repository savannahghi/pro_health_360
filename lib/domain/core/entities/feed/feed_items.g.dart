// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedItems _$_$_FeedItemsFromJson(Map<String, dynamic> json) {
  return _$_FeedItems(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_FeedItemsToJson(_$_FeedItems instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
