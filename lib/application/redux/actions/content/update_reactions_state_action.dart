// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/feed_content_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

class UpdateReactionStatusAction extends ReduxAction<AppState> {
  UpdateReactionStatusAction({
    required this.contentID,
    this.hasLiked,
    this.hasSaved,
  });

  final int contentID;
  final bool? hasLiked;
  final bool? hasSaved;

  @override
  Future<AppState> reduce() async {
    // fetch the content item to update
    // modify it with the new values
    // remove the old content item and replace with the new one
    final List<Content?>? contentItems =
        state.contentState?.feedContentState?.contentItems;

    final Content? contentToUpdate =
        state.contentState?.feedContentState?.contentItems?.firstWhere(
      (Content? element) => element?.contentID == contentID,
      orElse: () => Content.initial(),
    );

    if (contentToUpdate != Content.initial()) {
      final int arrLength = contentItems?.length ?? 0;
      for (int i = 0; i < arrLength; i++) {
        final int contentToCheck = contentItems?[i]?.contentID ?? 0;
        if (contentToCheck == contentID) {
          contentItems![i] = contentItems[i]?.copyWith.call(
                hasLiked: hasLiked ?? contentItems[i]?.hasLiked,
                hasSaved: hasSaved ?? contentItems[i]?.hasSaved,
              );
          break;
        }
      }

      final FeedContentState? newFeedState = state
          .contentState?.feedContentState
          ?.copyWith(contentItems: contentItems);

      final AppState newState = state.copyWith(
        contentState:
            state.contentState?.copyWith(feedContentState: newFeedState),
      );

      return newState;
    }
    return state;
  }
}
