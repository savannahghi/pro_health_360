// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
