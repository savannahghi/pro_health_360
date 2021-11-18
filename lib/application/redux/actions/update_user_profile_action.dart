// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/client_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';

// TODO(abiud): rewrite this action to cater for the new fields
class UpdateClientProfileAction extends ReduxAction<MainAppState> {
  UpdateClientProfileAction({
    this.user,
    this.active,
    this.lastMoodRecordedDate,
    this.nickName,
  });

  final User? user;
  final bool? active;
  final String? lastMoodRecordedDate;
  final String? nickName;

  @override
  MainAppState reduce() {
    final ClientProfile? newClientProfile =
        state.clientState?.clientProfile?.copyWith(
      user: this.user ?? state.clientState?.clientProfile?.user,
      active: this.active ?? state.clientState?.clientProfile?.active,
    );

    final ClientState? newClientState =
        state.clientState?.copyWith.call(clientProfile: newClientProfile);

    final MainAppState newState = state.copyWith(clientState: newClientState);

    return newState;
  }
}
