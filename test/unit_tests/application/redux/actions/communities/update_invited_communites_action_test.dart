import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/actions/communities/update_invited_communities_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/communities_state.dart';
import 'package:myafyahub/domain/core/entities/core/community.dart';

void main() {
  group('UpdateInvitedCommunitiesStateAction', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());
    test('should update invited state action', () {
      expect(
        store.state.clientState?.communitiesState,
        CommunitiesState.initial(),
      );

      store.dispatch(
        UpdateInvitedCommunitiesStateAction(
          communitiesList: <Community>[
            Community(name: 'Test community', memberCount: 5)
          ],
        ),
      );

      expect(
        store.state.clientState?.communitiesState?.invitedCommunities?.length,
        1,
      );

      expect(
        store.state.clientState?.communitiesState?.invitedCommunities?.first
            .name,
        'Test community',
      );

      store.dispatch(
        UpdateInvitedCommunitiesStateAction(communitiesList: null),
      );

      expect(
        store.state.clientState?.communitiesState?.invitedCommunities?.length,
        1,
      );

      expect(
        store.state.clientState?.communitiesState?.invitedCommunities?.first
            .name,
        'Test community',
      );
    });
  });
}
