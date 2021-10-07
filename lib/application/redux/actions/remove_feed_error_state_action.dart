// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_error_state.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

class RemoveFeedErrorStateAction extends ReduxAction<AppState> {
  RemoveFeedErrorStateAction();

  @override
  AppState reduce() {
    final Set<AppErrorState>? errorState = state.miscState!.appErrorState;

    errorState!.clear();

    final AppState newState = state.copyWith.miscState!.call(
      appErrorState: errorState,
    );

    return newState;
  }
}
