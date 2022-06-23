import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/community.dart';

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
