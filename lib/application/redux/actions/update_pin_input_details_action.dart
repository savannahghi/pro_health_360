import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';

class UpdatePINInputDetailsAction extends ReduxAction<AppState> {
  UpdatePINInputDetailsAction({
    this.healthPagePINInputTime,
    this.pinInputTries,
    this.maxTryTime,
    this.pinVerified,
    this.resumeTimer,
  });

  final String? healthPagePINInputTime;
  final int? pinInputTries;
  final String? maxTryTime;
  final bool? pinVerified;
  final bool? resumeTimer;

  @override
  AppState reduce() {
    final MiscState? miscState = state.miscState?.copyWith(
      healthPagePINInputTime:
          healthPagePINInputTime ?? state.miscState?.healthPagePINInputTime,
      pinInputTries: pinInputTries ?? state.miscState?.pinInputTries,
      maxTryTime: maxTryTime ?? state.miscState?.maxTryTime,
      pinVerified: pinVerified ?? state.miscState?.pinVerified,
      resumeTimer: resumeTimer ?? state.miscState?.resumeTimer,
    );

    final AppState newState = state.copyWith(
      miscState: miscState,
    );

    return newState;
  }
}
