import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/community.dart';

class InvitedGroupsViewModel extends Vm {
  InvitedGroupsViewModel({required this.wait, this.invitedCommunities})
      : super(equals: <Object?>[wait, invitedCommunities]);

  factory InvitedGroupsViewModel.fromStore(Store<AppState> store) {
    return InvitedGroupsViewModel(
      wait: store.state.wait!,
      invitedCommunities:
          store.state.clientState?.communitiesState?.invitedCommunities,
    );
  }

  final List<Community?>? invitedCommunities;
  final Wait wait;
}
