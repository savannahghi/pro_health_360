// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_content_state.freezed.dart';
part 'feed_content_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FeedContentState with _$FeedContentState {
  factory FeedContentState({
    @JsonKey(name: 'items') List<Content?>? contentItems,
    ContentCategory? selectedCategory,
    bool? errorFetchingContent,
    bool? timeoutFetchingContent,
  }) = _FeedContentState;

  factory FeedContentState.fromJson(Map<String, dynamic> json) =>
      _$FeedContentStateFromJson(json);

  factory FeedContentState.initial() => FeedContentState(
        contentItems: <Content>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
        selectedCategory: ContentCategory.initial(),
      );
}
