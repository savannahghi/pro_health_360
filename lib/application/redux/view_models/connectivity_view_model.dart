// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/connectivity_state.dart';

class ConnectivityViewModel {
  final ConnectivityState connectivityState;

  ConnectivityViewModel({required this.connectivityState});

  static ConnectivityViewModel fromStore(Store<AppState> store) {
    return ConnectivityViewModel(
        connectivityState: store.state.connectivityState!);
  }
}
