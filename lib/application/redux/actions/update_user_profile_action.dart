// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';

// TODO(abiud): rewrite this action to cater for the new fields
class UpdateClientProfileAction extends ReduxAction<AppState> {
  UpdateClientProfileAction({
    this.user,
    this.active,
    this.lastMoodRecordedDate,
  });

  final User? user;
  final bool? active;
  final String? lastMoodRecordedDate;

  @override
  AppState reduce() {
    final User? user = state.userState?.clientState?.clientProfile?.user;
    final bool? active = state.userState?.clientState?.clientProfile?.active;

    final ClientProfile? newState =
        state.userState?.clientState?.clientProfile?.copyWith(
      user: this.user ?? user,
      active: this.active ?? active,
    );

    final ClientState? newClientState =
        state.userState?.clientState?.copyWith(clientProfile: newState);

    return state.copyWith(
      userState: state.userState?.copyWith(clientState: newClientState),
    );
  }
}
