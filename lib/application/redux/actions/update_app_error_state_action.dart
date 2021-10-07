// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_error_state.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

class UpdateAppErrorStateAction extends ReduxAction<AppState> {
  UpdateAppErrorStateAction({
    required this.errorMessage,
    required this.errorType,
    this.isError,
    this.isTimeout,
  });

  final String errorMessage;
  final AppErrorType errorType;
  final bool? isError;
  final bool? isTimeout;

  @override
  AppState reduce() {
    final Set<AppErrorState>? errorState = state.miscState!.appErrorState;

    final AppErrorState newErrorState = AppErrorState(
      errorMessage: errorMessage,
      isError: isError,
      isTimeout: isTimeout,
      appErrorType: errorType,
    );

    errorState!.add(newErrorState);

    final AppState newState = state.copyWith.miscState!.call(
      appErrorState: errorState,
    );

    return newState;
  }
}
