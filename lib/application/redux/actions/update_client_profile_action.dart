// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

// TODO(abiud): rewrite this action to cater for the new fields
class UpdateClientProfileAction extends ReduxAction<MainAppState> {
  UpdateClientProfileAction({
    this.active,
    this.lastMoodRecordedDate,
    this.nickName,
  });

  final bool? active;
  final String? lastMoodRecordedDate;
  final String? nickName;

  @override
  MainAppState reduce() {
    final MainAppState newState = state.copyWith(
      clientState: state.clientState?.copyWith.call(
        clientProfile: state.clientState?.clientProfile?.copyWith(
          active: this.active ?? state.clientState?.clientProfile?.active,
        ),
      ),
    );

    return newState;
  }
}
