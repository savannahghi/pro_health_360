// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/utils.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/feed_content_state.dart';
import 'package:myafyahub/domain/core/entities/core/recent_content_state.dart';
import 'package:myafyahub/domain/core/entities/core/saved_content_state.dart';

class UpdateReactionStatusAction extends ReduxAction<AppState> {
  UpdateReactionStatusAction({
    required this.contentDisplayedType,
    required this.contentID,
    this.hasLiked,
    this.hasSaved,
    this.updateLikeCount = false,
  });

  final int contentID;
  final bool? hasLiked;
  final bool? hasSaved;
  final bool updateLikeCount;
  final ContentDisplayedType contentDisplayedType;

  @override
  Future<AppState> reduce() async {
    // fetch the content item to update
    // modify it with the new values
    // remove the old content item and replace with the new one
    late List<Content?>? contentItems;
    switch (contentDisplayedType) {
      case ContentDisplayedType.BOOKMARK:
        contentItems = state.contentState?.savedContentState?.savedContentItems;
        break;
      case ContentDisplayedType.RECENT:
        contentItems = state.contentState?.recentContentState?.contentItems;
        break;
      default:
        contentItems = state.contentState?.feedContentState?.contentItems;
    }

    if (contentItems?.isEmpty ?? true) {
      return state;
    }

    for (int i = 0; i < contentItems!.length; i++) {
      if (contentItems[i]?.contentID == contentID) {
        contentItems[i] = contentItems[i]?.copyWith.call(
              hasLiked: hasLiked ?? contentItems[i]?.hasLiked,
              hasSaved: hasSaved ?? contentItems[i]?.hasSaved,
              likeCount: updateLikeCount
                  ? getNewLikeCount(
                      hasLiked: hasLiked,
                      likeCount: contentItems[i]?.likeCount ?? 0,
                    )
                  : contentItems[i]?.likeCount ?? 0,
            );
        break;
      }
    }

    switch (contentDisplayedType) {
      case ContentDisplayedType.FEED:
        final FeedContentState? newFeedContentState = state
            .contentState?.feedContentState
            ?.copyWith(contentItems: contentItems);

        return state.copyWith(
          contentState: state.contentState
              ?.copyWith(feedContentState: newFeedContentState),
        );

      case ContentDisplayedType.BOOKMARK:
        final SavedContentState? newSavedContentState = state
            .contentState?.savedContentState
            ?.copyWith(savedContentItems: contentItems);

        return state.copyWith(
          contentState: state.contentState
              ?.copyWith(savedContentState: newSavedContentState),
        );

      case ContentDisplayedType.RECENT:
        final RecentContentState? newRecentContentState = state
            .contentState?.recentContentState
            ?.copyWith(contentItems: contentItems);

        return state.copyWith(
          contentState: state.contentState
              ?.copyWith(recentContentState: newRecentContentState),
        );
      default:
        return state;
    }
  }
}
