import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/communities_state.dart';
import 'package:myafyahub/domain/core/entities/core/community.dart';

class UpdateInvitedCommunitiesStateAction extends ReduxAction<AppState> {
  final List<Community> communitiesList;

  UpdateInvitedCommunitiesStateAction({required this.communitiesList});
  @override
  Future<AppState?> reduce() async {
    final CommunitiesState? newCommunitiesState = state
        .clientState?.communitiesState
        ?.copyWith(invitedCommunities: communitiesList);

    return state.copyWith(
      clientState:
          state.clientState?.copyWith(communitiesState: newCommunitiesState),
    );
  }
}
