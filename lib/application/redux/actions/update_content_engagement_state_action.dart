import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content_engagement_state.dart';

class UpdateContentEngagementStateAction extends ReduxAction<AppState> {
  UpdateContentEngagementStateAction({
    this.contentId,
    this.contentOpenedAt,
  });

  final int? contentId;
  final String? contentOpenedAt;

  @override
  Future<AppState> reduce() async {
    final ContentEngagementState? contentEngagementState =
        state.contentState?.contentEngagementState?.copyWith(
      contentId:
          contentId ?? state.contentState?.contentEngagementState?.contentId,
      contentOpenedAt: contentOpenedAt ??
          state.contentState?.contentEngagementState?.contentOpenedAt,
    );
    final AppState newState = state.copyWith(
      contentState: state.contentState?.copyWith(
        contentEngagementState: contentEngagementState,
      ),
    );

    return newState;
  }
}
