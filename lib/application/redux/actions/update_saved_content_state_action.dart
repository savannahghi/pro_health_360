// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/saved_content_state.dart';

class UpdateSavedContentStateAction extends ReduxAction<AppState> {
  UpdateSavedContentStateAction({
    this.savedContentItems,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
  });

  final List<Content?>? savedContentItems;
  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;

  @override
  Future<AppState> reduce() async {
    final SavedContentState? savedContentState =
        state.contentState?.savedContentState?.copyWith(
      savedContentItems: savedContentItems ??
          state.contentState?.savedContentState?.savedContentItems,
      errorFetchingContent: errorFetchingContent ??
          state.contentState?.savedContentState?.errorFetchingContent,
      timeoutFetchingContent: timeoutFetchingContent ??
          state.contentState?.savedContentState?.timeoutFetchingContent,
    );
    final AppState newState = state.copyWith(
      contentState: state.contentState?.copyWith(
        savedContentState: savedContentState,
      ),
    );

    return newState;
  }
}
