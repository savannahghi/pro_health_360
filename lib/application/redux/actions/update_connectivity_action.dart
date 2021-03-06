// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

class UpdateConnectivityAction extends ReduxAction<AppState> {
  UpdateConnectivityAction({required this.hasConnection});

  final bool hasConnection;

  @override
  AppState reduce() {
    final ConnectivityState? newState =
        state.connectivityState?.copyWith(isConnected: this.hasConnection);

    return state.copyWith(connectivityState: newState);
  }
}
