// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class HealthPagePINInputAction extends ReduxAction<AppState> {
  HealthPagePINInputAction({required this.lastPINInputTime});

  final String lastPINInputTime;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.miscState!.call(
      healthPagePINInputTime: lastPINInputTime,
    );
    return newState;
  }
}