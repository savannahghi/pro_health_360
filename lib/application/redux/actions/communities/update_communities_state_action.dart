import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/communities_state.dart';
import 'package:pro_health_360/domain/core/entities/core/community.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class UpdateCommunitiesStateAction extends ReduxAction<AppState> {
  UpdateCommunitiesStateAction({
    this.communitiesList,
    this.flaggedMessages,
  });

  final List<Community?>? communitiesList;
  final List<Message?>? flaggedMessages;

  @override
  AppState reduce() {
    final CommunitiesState? communitiesState =
        state.clientState?.communitiesState;

    final CommunitiesState? newCommunitiesState =
        state.clientState?.communitiesState?.copyWith(
      invitedCommunities:
          communitiesList ?? communitiesState?.invitedCommunities,
      flaggedMessages: flaggedMessages ?? communitiesState?.flaggedMessages,
    );

    final AppState newState = state.copyWith(
      clientState:
          state.clientState?.copyWith(communitiesState: newCommunitiesState),
    );
    return newState;
  }
}
