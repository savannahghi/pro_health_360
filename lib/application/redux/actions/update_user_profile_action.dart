// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/client_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';

class UpdateUserProfileAction extends ReduxAction<AppState> {
  UpdateUserProfileAction({
    this.active,
    this.nickName,
    this.phoneNumber,
  });

  final bool? active;
  final String? nickName;
  final Contact? phoneNumber;

  @override
  AppState reduce() {
    final ClientProfile? newClientProfile =
        state.clientState?.clientProfile?.copyWith(
      // user: this.user ?? state.clientState?.clientProfile?.user,
      active: this.active ?? state.clientState?.clientProfile?.active,
    );

    final ClientState? newClientState =
        state.clientState?.copyWith.call(clientProfile: newClientProfile);

    final AppState newState = state.copyWith(clientState: newClientState);

    return newState;
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
