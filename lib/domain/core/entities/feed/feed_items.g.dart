// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedItems _$$_FeedItemsFromJson(Map<String, dynamic> json) => _$_FeedItems(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FeedItemsToJson(_$_FeedItems instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
