// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/content.dart';

// Project imports:
part 'feed_items.freezed.dart';
part 'feed_items.g.dart';

@freezed
class FeedItems with _$FeedItems {
  factory FeedItems({
    @JsonKey(name: 'items') List<Content?>? items,
  }) = _FeedItems;

  factory FeedItems.fromJson(Map<String, dynamic> json) =>
      _$FeedItemsFromJson(json);
}
