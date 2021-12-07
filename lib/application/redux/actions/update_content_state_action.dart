// Flutter imports:

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/feed_content_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';

class UpdateContentStateAction extends ReduxAction<AppState> {
  UpdateContentStateAction({
    this.contentItems,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
    this.selectedCategory,
  });

  final List<Content?>? contentItems;
  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;
  final ContentCategory? selectedCategory;

  @override
  Future<AppState> reduce() async {
    final FeedContentState? feedContentState =
        state.contentState?.feedContentState?.copyWith(
      contentItems:
          contentItems ?? state.contentState?.feedContentState?.contentItems,
      errorFetchingContent: errorFetchingContent ??
          state.contentState?.feedContentState?.errorFetchingContent,
      timeoutFetchingContent: timeoutFetchingContent ??
          state.contentState?.feedContentState?.timeoutFetchingContent,
      selectedCategory: selectedCategory ??
          state.contentState?.feedContentState?.selectedCategory,
    );

    final AppState newState = state.copyWith(
      contentState:
          state.contentState?.copyWith(feedContentState: feedContentState),
    );

    return newState;
  }
}
