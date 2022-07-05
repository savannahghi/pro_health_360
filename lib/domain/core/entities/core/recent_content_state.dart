// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_content_state.freezed.dart';
part 'recent_content_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class RecentContentState with _$RecentContentState {
  factory RecentContentState({
    @JsonKey(name: 'items') List<Content?>? contentItems,
    bool? errorFetchingContent,
    bool? timeoutFetchingContent,
  }) = _FeedContentState;

  factory RecentContentState.fromJson(Map<String, dynamic> json) =>
      _$RecentContentStateFromJson(json);

  factory RecentContentState.initial() => RecentContentState(
        contentItems: <Content>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
      );
}
