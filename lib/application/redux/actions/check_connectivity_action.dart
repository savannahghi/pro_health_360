// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class CheckConnectivityAction extends ReduxAction<AppState> {
  CheckConnectivityAction({required this.hasConnection});

  final bool hasConnection;

  @override
  AppState reduce() {
    final AppState newState =
        state.copyWith.connectivityState!.call(isConnected: this.hasConnection);
    return newState;
  }
}
