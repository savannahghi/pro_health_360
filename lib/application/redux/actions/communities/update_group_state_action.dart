import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/communities/group.dart';
import 'package:myafyahub/domain/core/entities/core/groups_state.dart';

class UpdateGroupStateAction extends ReduxAction<AppState> {
  final List<Group?>? recommendedGroups;

  UpdateGroupStateAction({
    this.recommendedGroups,
  });

  @override
  Future<AppState> reduce() async {
    final GroupState? groupState =
        state.miscState?.groupState?.copyWith(
      recommendedGroups: recommendedGroups ??
          state.miscState?.groupState?.recommendedGroups,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(
        groupState: groupState,
      ),
    );

    return newState;
  }
}
