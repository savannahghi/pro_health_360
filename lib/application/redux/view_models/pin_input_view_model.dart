import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class PINInputViewModel extends Vm {
  PINInputViewModel({
    this.healthPagePINInputTime,
    this.tries,
    this.maxTryTime,
    this.wait,
    this.pinVerified,
    this.resumeTimer,
  }) : super(
          equals: <Object?>[
            healthPagePINInputTime,
            tries,
            maxTryTime,
            pinVerified,
            resumeTimer,
            wait,
          ],
        );

  factory PINInputViewModel.fromStore(AppState state) {
    return PINInputViewModel(
      healthPagePINInputTime: state.miscState?.healthPagePINInputTime,
      tries: state.miscState?.pinInputTries,
      maxTryTime: state.miscState?.maxTryTime,
      pinVerified: state.miscState?.pinVerified,
      resumeTimer: state.miscState?.resumeTimer,
      wait: state.wait,
    );
  }
  final String? healthPagePINInputTime;
  final int? tries;
  final String? maxTryTime;
  final bool? pinVerified;
  final bool? resumeTimer;
  final Wait? wait;
}
