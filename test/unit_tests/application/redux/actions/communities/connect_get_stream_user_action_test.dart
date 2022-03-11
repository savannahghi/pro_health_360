import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/redux/actions/communities/connect_get_stream_user_action.dart';
import 'package:myafyahub/application/redux/actions/update_client_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../../../../mocks.dart';

import 'connect_get_stream_user_action_test.mocks.dart';

@GenerateMocks(<Type>[StreamChatClient])
void main() {
  late Store<AppState> store;

  setUp(() {
    store = Store<AppState>(initialState: AppState.initial());
  });

  group('ConnectGetStreamUserAction', () {
    test('should complete normally', () async {
      store.dispatch(UpdateClientProfileAction(id: 'some-id'));

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'getStreamToken': 'some-token'}),
          200,
        ),
      );

      final MockStreamChatClient mockStreamChatClient = MockStreamChatClient();
      when(mockStreamChatClient.connectUserWithProvider(any, any))
          .thenAnswer((_) => Future<OwnUser>.value(OwnUser(id: 'id')));

      storeTester.dispatch(
        ConnectGetStreamUserAction(
          streamClient: mockStreamChatClient,
          client: client,
          endpoint: kTestRefreshStreamTokenEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ConnectGetStreamUserAction);

      expect(info.dispatchCount, 4);
    });

    test('should throw exception if client profile id is null', () async {
      store.dispatch(UpdateClientProfileAction(id: ''));

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'getStreamToken': 'some-token'}),
          200,
        ),
      );

      final MockStreamChatClient mockStreamChatClient = MockStreamChatClient();

      storeTester.dispatch(
        ConnectGetStreamUserAction(
          streamClient: mockStreamChatClient,
          client: client,
          endpoint: kTestRefreshStreamTokenEndpoint,
        ),
      );

      final TestInfo<AppState> info = await storeTester.waitUntilErrorGetLast(
        error: const UserException(kindlyLogOutText),
      );

      expect(info.error, const UserException(kindlyLogOutText));
    });

    test('should handle StreamWebSocketError', () async {
      store.dispatch(UpdateClientProfileAction(id: 'some-id'));

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'getStreamToken': 'some-token'}),
          200,
        ),
      );

      final MockStreamChatClient mockStreamChatClient = MockStreamChatClient();
      when(mockStreamChatClient.connectUserWithProvider(any, any)).thenThrow(
        StreamWebSocketError(
          'error',
          data: ErrorResponse.fromJson(<String, dynamic>{'code': 40}),
        ),
      );

      storeTester.dispatch(
        ConnectGetStreamUserAction(
          streamClient: mockStreamChatClient,
          client: client,
          endpoint: kTestRefreshStreamTokenEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ConnectGetStreamUserAction);

      expect(info.dispatchCount, 4);
    });

    test('should handle StreamWebSocketError apart from token error', () async {
      store.dispatch(UpdateClientProfileAction(id: 'some-id'));

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'getStreamToken': 'some-token'}),
          200,
        ),
      );

      final MockStreamChatClient mockStreamChatClient = MockStreamChatClient();
      when(mockStreamChatClient.connectUserWithProvider(any, any)).thenThrow(
        StreamWebSocketError(
          'error',
          data: ErrorResponse.fromJson(<String, dynamic>{'code': 20}),
        ),
      );

      storeTester.dispatch(
        ConnectGetStreamUserAction(
          streamClient: mockStreamChatClient,
          client: client,
          endpoint: kTestRefreshStreamTokenEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ConnectGetStreamUserAction);

      expect(info.dispatchCount, 4);
    });

    test('should handle general errors', () async {
      store.dispatch(UpdateClientProfileAction(id: 'some-id'));

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'getStreamToken': 'some-token'}),
          200,
        ),
      );

      final MockStreamChatClient mockStreamChatClient = MockStreamChatClient();
      when(mockStreamChatClient.connectUserWithProvider(any, any)).thenThrow(
        MyAfyaException(cause: 'random error', message: 'message'),
      );

      storeTester.dispatch(
        ConnectGetStreamUserAction(
          streamClient: mockStreamChatClient,
          client: client,
          endpoint: kTestRefreshStreamTokenEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ConnectGetStreamUserAction);

      expect(info.dispatchCount, 4);
    });
  });
}
