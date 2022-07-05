// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/feed_content_state.dart';
import 'package:pro_health_360/domain/core/entities/core/recent_content_state.dart';
import 'package:pro_health_360/domain/core/entities/core/saved_content_state.dart';
import 'package:pro_health_360/domain/core/entities/feed/content_engagement_state.dart';

part 'content_state.freezed.dart';
part 'content_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ContentState with _$ContentState {
  factory ContentState({
    FeedContentState? feedContentState,
    SavedContentState? savedContentState,
    RecentContentState? recentContentState,
    ListContentCategory? categoriesList,
    ContentEngagementState? contentEngagementState,
  }) = _ContentState;

  factory ContentState.fromJson(Map<String, dynamic> json) =>
      _$ContentStateFromJson(json);

  factory ContentState.initial() => ContentState(
        feedContentState: FeedContentState.initial(),
        savedContentState: SavedContentState.initial(),
        recentContentState: RecentContentState.initial(),
        contentEngagementState: ContentEngagementState.initial(),
        categoriesList: ListContentCategory.initial(),
      );
}
