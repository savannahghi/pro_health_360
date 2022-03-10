import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/redux/actions/communities/fetch_channel_members_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'fetch_channel_members_action_test.mocks.dart' as members_mock;

@GenerateMocks(<Type>[Channel])
void main() {
  late Store<AppState> store;

  setUp(() {
    store = Store<AppState>(initialState: AppState.initial());
  });

  group('FetchChannelMembersAction', () {
    test('should update state if successful', () async {
      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      final members_mock.MockChannel mockChannel = members_mock.MockChannel();
      when(mockChannel.queryMembers()).thenAnswer(
        (_) => Future<QueryMembersResponse>.value(
          QueryMembersResponse.fromJson(<String, dynamic>{
            'members': <Map<String, dynamic>>[
              <String, dynamic>{
                'user': <String, dynamic>{'id': 'some-id', 'name': 'John Doe'}
              }
            ]
          }),
        ),
      );

      storeTester.dispatch(FetchChannelMembersAction(mockChannel));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchChannelMembersAction);

      final Member? member =
          info.state.miscState?.channelMembersState?.members?.first;

      expect(member?.user?.id, 'some-id');
      expect(member?.user?.name, 'John Doe');
    });

    test('should throw user exception in case of error', () async {
      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      final members_mock.MockChannel mockChannel = members_mock.MockChannel();
      when(mockChannel.queryMembers()).thenThrow(Exception());

      storeTester.dispatch(FetchChannelMembersAction(mockChannel));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchChannelMembersAction);

      expect(info.error, UserException(getErrorMessage()));
    });
  });
}
