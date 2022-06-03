import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/communities/group.dart';
import 'package:myafyahub/domain/core/entities/core/groups_state.dart';

class UpdateGroupStateAction extends ReduxAction<AppState> {
  final List<Group?>? recommendedGroups;
  final List<GroupMember?>? groupMembers;
  final bool? isModerator;
  final bool? isOwner;

  UpdateGroupStateAction({
    this.recommendedGroups,
    this.groupMembers,
    this.isModerator,
    this.isOwner,
  });

  @override
  AppState reduce() {
    final GroupState? oldState = state.miscState?.groupState;

    final GroupState? groupState = state.miscState?.groupState?.copyWith(
      recommendedGroups: recommendedGroups ?? oldState?.recommendedGroups,
      groupMembers: groupMembers ?? oldState?.groupMembers,
      isModerator: isModerator ?? oldState?.isModerator,
      isOwner: isOwner ?? oldState?.isOwner,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(groupState: groupState),
    );

    return newState;
  }
}
