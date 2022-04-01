import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/communities/group.dart';
import 'package:myafyahub/domain/core/entities/communities/group_member.dart';

class GroupsViewModel extends Vm {
  final Wait wait;
  final List<Group?>? recommendedGroups;
  final List<GroupMember?>? groupMembers;

  GroupsViewModel({
    required this.wait,
    this.recommendedGroups,
    this.groupMembers,
  }) : super(equals: <Object?>[wait, recommendedGroups, groupMembers]);

  factory GroupsViewModel.fromStore(Store<AppState> store) {
    return GroupsViewModel(
      wait: store.state.wait!,
      recommendedGroups: store.state.miscState?.groupState?.recommendedGroups,
      groupMembers: store.state.miscState?.groupState?.groupMembers,
    );
  }
}
