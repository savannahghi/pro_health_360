// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

class ConnectivityViewModel {
  final ConnectivityState connectivityState;

  ConnectivityViewModel({required this.connectivityState});

  static ConnectivityViewModel fromStore(Store<AppState> store) {
    return ConnectivityViewModel(
      connectivityState: store.state.connectivityState!,
    );
  }
}
