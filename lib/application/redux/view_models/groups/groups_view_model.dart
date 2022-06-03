import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/communities/group.dart';

class GroupsViewModel extends Vm {
  final Wait wait;
  final List<Group?>? recommendedGroups;
  final List<GroupMember?>? groupMembers;
  final List<Role>? clientRoles;
  final bool? isModerator;
  final bool? isOwner;

  GroupsViewModel({
    required this.wait,
    this.recommendedGroups,
    this.groupMembers,
    this.clientRoles,
    this.isModerator,
    this.isOwner,
  }) : super(
          equals: <Object?>[
            wait,
            recommendedGroups,
            groupMembers,
            clientRoles,
            isModerator,
            isOwner,
          ],
        );

  factory GroupsViewModel.fromStore(Store<AppState> store) {
    return GroupsViewModel(
      wait: store.state.wait!,
      recommendedGroups: store.state.miscState?.groupState?.recommendedGroups,
      groupMembers: store.state.miscState?.groupState?.groupMembers,
      clientRoles: store.state.clientState?.user?.roles,
      isModerator: store.state.miscState?.groupState?.isModerator,
    );
  }
}
