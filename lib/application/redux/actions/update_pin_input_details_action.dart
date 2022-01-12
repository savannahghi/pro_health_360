import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';

class UpdatePINInputStateAction extends ReduxAction<AppState> {
  UpdatePINInputStateAction({
    this.healthPagePINInputTime,
    this.tries,
    this.maxTryTime,
  });

  final String? healthPagePINInputTime;
  final int? tries;
  final String? maxTryTime;

  @override
  AppState reduce() {
    final MiscState? miscState = state.miscState?.copyWith(
      healthPagePINInputTime:
          healthPagePINInputTime ?? state.miscState?.healthPagePINInputTime,
      pinInputTries: tries ?? state.miscState?.pinInputTries,
      maxTryTime: maxTryTime ?? state.miscState?.maxTryTime,
    );

    final AppState newState = state.copyWith(
      miscState: miscState,
    );

    return newState;
  }
}
