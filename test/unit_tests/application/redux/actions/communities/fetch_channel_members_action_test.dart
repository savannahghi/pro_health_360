import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/redux/actions/communities/fetch_channel_members_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/communities/ban_status.dart';
import 'package:myafyahub/domain/core/entities/communities/group_member.dart';
import 'package:myafyahub/domain/core/entities/communities/member.dart';

import '../../../../../mocks.dart';
import 'fetch_channel_members_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('FetchChannelMembersAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should update state correctly', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{
            'data': <String, dynamic>{
              'listCommunityMembers': <Map<String, dynamic>>[
                <String, dynamic>{
                  'user': <String, dynamic>{
                    'ID': 'some-id',
                    'username': 'John',
                    'role': 'user',
                    'name': 'John Doe',
                    'gender': 'male',
                    'extraData': <String, dynamic>{'bannedInCommunity': false}
                  },
                  'isModerator': false
                }
              ]
            }
          }),
          200,
        ),
      );

      storeTester.dispatch(
        FetchChannelMembersAction(httpClient: client, channelId: 'id'),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchChannelMembersAction);

      expect(
        info.state.miscState?.groupState?.groupMembers?.first,
        GroupMember(
          memberDetails: Member(
            id: 'some-id',
            role: 'user',
            username: 'John',
            gender: Gender.male,
            extraData: ExtraData(bannedInCommunity: false),
          ),
        ),
      );
    });

    test('should throw error if response contains error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'error'}),
          200,
        ),
      );

      storeTester.dispatch(
        FetchChannelMembersAction(httpClient: client, channelId: 'id'),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchChannelMembersAction);

      expect(
        info.errors.removeLast(),
        UserException(getErrorMessage()),
      );
    });

    test('should throw error if http response is not success', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'error'}),
          500,
        ),
      );

      storeTester.dispatch(
        FetchChannelMembersAction(httpClient: client, channelId: 'id'),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchChannelMembersAction);

      expect(
        info.errors.removeLast(),
        UserException(getErrorMessage()),
      );
    });

    test('should throw error if exception is thrown', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(
        FetchChannelMembersAction(httpClient: client, channelId: 'id'),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchChannelMembersAction);

      expect(
        info.errors.removeLast(),
        UserException(getErrorMessage()),
      );
    });
  });
}
