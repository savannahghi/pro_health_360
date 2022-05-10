// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/recent_content_state.dart';

class UpdateRecentContentStateAction extends ReduxAction<AppState> {
  UpdateRecentContentStateAction({
    this.contentItems,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
  });

  final List<Content?>? contentItems;
  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;

  @override
  Future<AppState> reduce() async {
    final RecentContentState? recentContent =
        state.contentState?.recentContentState?.copyWith(
      contentItems:
          contentItems ?? state.contentState?.recentContentState?.contentItems,
      errorFetchingContent: errorFetchingContent ??
          state.contentState?.recentContentState?.errorFetchingContent,
      timeoutFetchingContent: timeoutFetchingContent ??
          state.contentState?.recentContentState?.timeoutFetchingContent,
    );

    final AppState newState = state.copyWith(
      contentState:
          state.contentState?.copyWith(recentContentState: recentContent),
    );

    return newState;
  }
}
