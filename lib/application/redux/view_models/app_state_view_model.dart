// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class AppStateViewModel extends Vm {
  AppStateViewModel({required this.appState})
      : super(equals: <Object?>[appState]);

  final AppState appState;

  static AppStateViewModel fromStore(Store<AppState> store) {
    return AppStateViewModel(appState: store.state);
  }
}
