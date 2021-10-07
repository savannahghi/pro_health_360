// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class ProfileViewModel {
  ProfileViewModel({required this.appState, this.photoPath});

  final AppState appState;
  final String? photoPath;

  static ProfileViewModel fromStore(Store<AppState> store) {
    return ProfileViewModel(appState: store.state);
  }
}
