// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class MainAppStateViewModel {
  MainAppStateViewModel({required this.appState});

  final AppState appState;

  static MainAppStateViewModel fromStore(Store<AppState> store) {
    return MainAppStateViewModel(appState: store.state);
  }
}
