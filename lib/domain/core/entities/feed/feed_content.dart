// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/feed_items.dart';

part 'feed_content.freezed.dart';
part 'feed_content.g.dart';

@freezed
class FeedContent with _$FeedContent {
  factory FeedContent({
    @JsonKey(name: 'getContent') FeedItems? feedContent,
  }) = _FeedContent;

  factory FeedContent.fromJson(Map<String, dynamic> json) =>
      _$FeedContentFromJson(json);
}
