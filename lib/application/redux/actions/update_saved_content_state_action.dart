import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

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
    final AppState newState = state.copyWith.savedContentState!.call(
      savedContentItems: savedContentItems ?? state.savedContentState!.savedContentItems,
      errorFetchingContent:
          errorFetchingContent ?? state.savedContentState!.errorFetchingContent,
      timeoutFetchingContent:
          timeoutFetchingContent ?? state.savedContentState!.timeoutFetchingContent,
    );

    return newState;
  }
}
