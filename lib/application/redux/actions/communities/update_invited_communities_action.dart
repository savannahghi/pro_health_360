import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/community.dart';

class UpdateInvitedCommunitiesStateAction extends ReduxAction<AppState> {
  final List<Community>? communitiesList;

  UpdateInvitedCommunitiesStateAction({required this.communitiesList});

  @override
  AppState? reduce() {
    final AppState newState = state.copyWith(
      clientState: state.clientState?.copyWith(
        communitiesState: state.clientState?.communitiesState?.copyWith.call(
          invitedCommunities: communitiesList ??
              state.clientState?.communitiesState?.invitedCommunities,
        ),
      ),
    );

    return newState;
  }
}
