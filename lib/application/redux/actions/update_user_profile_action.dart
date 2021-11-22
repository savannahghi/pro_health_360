// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';
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
    this.termsAccepted,
  });

  final bool? active;
  final String? nickName;
  final String? firstName;
  final String? lastName;
  final String? avatar;
  final Contact? phoneNumber;
  final bool? termsAccepted;

  @override
  AppState reduce() {
    final User? userFromState = state.clientState?.user;

    final User? newUserProfile = state.clientState?.user?.copyWith(
      active: this.active ?? userFromState?.active,
      firstName: firstName ?? userFromState?.firstName,
      lastName: lastName ?? userFromState?.lastName,
      avatar: avatar ?? userFromState?.avatar,
      username: nickName ?? userFromState?.username,
      termsAccepted: termsAccepted ?? userFromState?.termsAccepted,
    );

    final ClientState newState =
        state.clientState!.copyWith(user: newUserProfile);

    return state.copyWith.call(clientState: newState);
  }
}

/// This class replaces the whole user object
class UpdateUserAction extends ReduxAction<AppState> {
  UpdateUserAction({this.user});

  final User? user;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.clientState!.call(
      user: user ?? state.clientState!.user,
    );

    return newState;
  }
}
