import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pro_health_360/application/redux/actions/set_push_token_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/auth_credentials.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../../../mocks.dart';
import 'set_push_token_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient, StreamChatClient])
void main() {
  group('SetPushToken', () {
    late StoreTester<AppState> storeTester;
    late MockStreamChatClient mockStreamChatClient;

    setUp(() {
      setupFirebaseMessagingMocks();

      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials(isSignedIn: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );

      mockStreamChatClient = MockStreamChatClient();
      when(mockStreamChatClient.addDevice(any, any))
          .thenAnswer((_) => Future<EmptyResponse>.value(EmptyResponse()));
    });

    test('should handle error', () async {
      storeTester.dispatch(
        SetPushToken(
          token: '',
          streamClient: mockStreamChatClient,
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'error': 'some error'},
              ),
              200,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitUntil(SetPushToken);

      expect(info.dispatchCount, 2);
    });

    test('should handle unexpected error', () async {
      storeTester.dispatch(
        SetPushToken(
          streamClient: mockStreamChatClient,
          token: '',
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'error': 'some error'},
              ),
              400,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitUntil(SetPushToken);

      expect(info.dispatchCount, 1);
    });

    test('should handle uncaught errors', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(
        SetPushToken(
          streamClient: mockStreamChatClient,
          token: '',
          client: client,
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitUntil(SetPushToken);

      expect(info.errors.removeFirst().msg, getErrorMessage());
    });
  });
}
