import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/redux/actions/communities/fetch_invited_communities_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/community.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

import '../../../../../mocks.dart';
import 'fetch_invited_communities_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  late IGraphQlClient client;
  late StoreTester<AppState> storeTester;

  setUp(() {
    client = MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        jsonEncode(<String, dynamic>{
          'data': <String, dynamic>{
            'listPendingInvites': <Map<String, dynamic>>[
              <String, dynamic>{
                'id': 'some-id',
                'name': 'Test group',
                'memberCount': 10,
                'description': 'test group',
              }
            ]
          }
        }),
        200,
      ),
    );

    storeTester = StoreTester<AppState>(
      initialState: AppState.initial(),
      testInfoPrinter: (TestInfo<dynamic> testInfo) {},
    );
  });

  group('FetchInvitedCommunitiesAction', () {
    test('update state correctly', () async {
      storeTester.dispatch(FetchInvitedCommunitiesAction(client: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchInvitedCommunitiesAction);

      final List<Community?>? invitedCommunities =
          info.state.clientState?.communitiesState?.invitedCommunities;

      expect(
        invitedCommunities?.first,
        Community(
          id: 'some-id',
          name: 'Test group',
          memberCount: 10,
          description: 'test group',
        ),
      );
    });

    test('throw user exception if api returns error', () async {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{'error': 'error'}),
          200,
        ),
      );

      storeTester.dispatch(FetchInvitedCommunitiesAction(client: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchInvitedCommunitiesAction);

      final List<Community?>? invitedCommunities =
          info.state.clientState?.communitiesState?.invitedCommunities;

      expect(
        info.errors.removeLast(),
        const UserException(errorFetchingInvitesText),
      );
      expect(invitedCommunities?.isEmpty, true);
    });

    test('throw user exception if http error code', () async {
      client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          jsonEncode(<String, dynamic>{'error': 'error'}),
          400,
        ),
      );

      storeTester.dispatch(FetchInvitedCommunitiesAction(client: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchInvitedCommunitiesAction);

      final List<Community?>? invitedCommunities =
          info.state.clientState?.communitiesState?.invitedCommunities;

      expect(
        info.errors.removeLast(),
        const UserException(somethingWentWrongText),
      );
      expect(invitedCommunities?.isEmpty, true);
    });

    test('throw user exception if something goes wrong', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(FetchInvitedCommunitiesAction(client: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchInvitedCommunitiesAction);

      final List<Community?>? invitedCommunities =
          info.state.clientState?.communitiesState?.invitedCommunities;

      expect(
        info.errors.removeLast(),
        const UserException(somethingWentWrongText),
      );
      expect(invitedCommunities?.isEmpty, true);
    });
  });
}
