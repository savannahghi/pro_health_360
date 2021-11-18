// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class AppStateViewModel {
  AppStateViewModel({required this.appState});

  final MainAppState appState;

  static AppStateViewModel fromStore(Store<MainAppState> store) {
    return AppStateViewModel(appState: store.state);
  }
}
