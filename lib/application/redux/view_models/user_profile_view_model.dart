// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';

class UserProfileViewModel {
  final UserProfileState userProfileState;

  UserProfileViewModel({required this.userProfileState});

  static UserProfileViewModel fromStore(Store<AppState> store) {
    return UserProfileViewModel(
        userProfileState: store.state.userProfileState!);
  }
}
