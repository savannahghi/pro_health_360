import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

class PINInputViewModel extends Vm {
  PINInputViewModel({this.healthPagePINInputTime, this.tries, this.maxTryTime})
      : super(equals: <Object?>[healthPagePINInputTime, tries, maxTryTime]);

  factory PINInputViewModel.fromStore(AppState state) {
    return PINInputViewModel(
      healthPagePINInputTime:
          state.miscState?.healthPagePINInputTime,
      tries: state.miscState?.pinInputTries,
      maxTryTime: state.miscState?.maxTryTime,
    );
  }
  final String? healthPagePINInputTime;
  final int? tries;
  final String? maxTryTime;
}
