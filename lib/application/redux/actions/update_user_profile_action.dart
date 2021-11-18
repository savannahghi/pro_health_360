// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';

class UpdateUserProfileAction extends ReduxAction<AppState> {
  UpdateUserProfileAction({
    this.active,
    this.nickName,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  final bool? active;
  final String? nickName;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  final Contact? phoneNumber;

  @override
  AppState reduce() {
    final User? userFromState = state.clientState?.clientProfile?.user;

    final User? newUserProfile =
        state.clientState?.clientProfile!.user?.copyWith(
      active: this.active ?? userFromState?.active,
      firstName: firstName ?? userFromState?.firstName,
      lastName: lastName ?? userFromState?.lastName,
      avatar: avatar ?? userFromState?.avatar,
    );

    final ClientProfile newState =
        state.clientState!.clientProfile!.copyWith(user: newUserProfile);

    return state.copyWith.clientState!.call(clientProfile: newState);
  }
}

/// This class replaces the whole user object
class UpdateUserAction extends ReduxAction<AppState> {
  UpdateUserAction({this.user});

  final User? user;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.clientState!.call(
      clientProfile: state.clientState!.clientProfile!.copyWith.call(
        user: user ?? state.clientState!.clientProfile!.user,
      ),
    );

    return newState;
  }
}
