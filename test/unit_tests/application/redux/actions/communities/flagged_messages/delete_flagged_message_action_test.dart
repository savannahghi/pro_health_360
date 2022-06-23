import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/communities/flagged_messages/delete_flagged_message_action.dart';
import 'package:pro_health_360/application/redux/actions/communities/update_communities_state_action.dart';
import 'package:pro_health_360/application/redux/actions/update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../../../../../mocks.dart';

void main() {
  group('DeleteCommunityMessageAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial().copyWith(
          connectivityState: ConnectivityState(isConnected: true),
        ),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should update communities state', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'deleteCommunityMessage': true,
            }
          }),
          201,
        ),
      );

      storeTester.dispatch(
        UpdateCommunitiesStateAction(
          flaggedMessages: <Message>[
            Message(),
            Message(id: 'id-2'),
          ],
        ),
      );

      storeTester.dispatch(
        DeleteFlaggedMessageAction(
          client: client,
          messageID: 'id-2',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DeleteFlaggedMessageAction);

      expect(
        info.state.clientState?.communitiesState?.flaggedMessages?.length,
        1,
      );
    });

    test('should not update state if error occurs during API call', () async {
      storeTester.dispatch(
        DeleteFlaggedMessageAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
          messageID: 'message-id',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(DeleteFlaggedMessageAction);

      expect(
        (info.error! as UserException).msg,
        somethingWentWrongText,
      );
    });

    test('should return error if no connection', () async {
      String error = '';

      storeTester.dispatch(UpdateConnectivityAction(hasConnection: false));
      storeTester.dispatch(
        DeleteFlaggedMessageAction(
          client: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{'errors': 'error'}),
              201,
            ),
          ),
          messageID: 'message-id',
          onFailure: (String message) => error = message,
        ),
      );

      expect(error, '');

      await storeTester.waitUntil(DeleteFlaggedMessageAction);

      expect(error, connectionLostText);
    });
  });
}
