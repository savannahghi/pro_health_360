import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/feed/feed_items.dart';

part 'saved_content.freezed.dart';
part 'saved_content.g.dart';

@freezed
class SavedContent with _$SavedContent {
  factory SavedContent({
    @JsonKey(name: 'getUserBookmarkedContent') FeedItems? savedContent,
  }) = _SavedContent;

  factory SavedContent.fromJson(Map<String, dynamic> json) =>
      _$SavedContentFromJson(json);
}
