import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/communities/group.dart';
import 'package:pro_health_360/domain/core/entities/core/community.dart';
import 'package:pro_health_360/domain/core/entities/core/groups_state.dart';

class UpdateGroupStateAction extends ReduxAction<AppState> {
  final List<Group?>? recommendedGroups;
  final List<GroupMember?>? groupMembers;
  final List<Community?>? communities;
  final bool? isModerator;
  final bool? isOwner;

  UpdateGroupStateAction({
    this.recommendedGroups,
    this.groupMembers,
    this.isModerator,
    this.isOwner,
    this.communities,
  });

  @override
  AppState reduce() {
    final GroupState? oldState = state.miscState?.groupState;

    final GroupState? groupState = state.miscState?.groupState?.copyWith(
      recommendedGroups: recommendedGroups ?? oldState?.recommendedGroups,
      groupMembers: groupMembers ?? oldState?.groupMembers,
      isModerator: isModerator ?? oldState?.isModerator,
      isOwner: isOwner ?? oldState?.isOwner,
      communities: communities ?? oldState?.communities,
    );

    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith(groupState: groupState),
    );

    return newState;
  }
}
