import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/redux/actions/verify_pin_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';

import '../../../../mocks.dart';
import 'verify_pin_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('VerifyPINAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (_) {},
      );
    });

    test('should show error if pin is wrong', () async {
      storeTester.dispatch(
        VerifyPINAction(
          inputPIN: '',
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'code': 8, 'error': '8: wrong PIN'},
              ),
              400,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifyPINAction);

      expect(info.state.miscState?.pinVerified, false);
      expect(info.state.miscState?.pinInputTries, 1);
    });

    test('should handle other http errors', () async {
      storeTester.dispatch(
        VerifyPINAction(
          inputPIN: '',
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'code': 11, 'error': 'error'},
              ),
              400,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifyPINAction);

      expect(info.errors.removeFirst().msg, somethingWentWrongText);
    });

    test('should handle uncaught errors', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(
        VerifyPINAction(
          inputPIN: '',
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{'message': 'success'},
              ),
              200,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifyPINAction);

      expect(info.errors.removeFirst().msg, somethingWentWrongText);
    });

    test('should handle pin verified is true', () async {
      storeTester.dispatch(
        VerifyPINAction(
          inputPIN: '',
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{
                  'data': <String, bool>{'verifyPIN': true}
                },
              ),
              400,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifyPINAction);

      expect(info.state.miscState?.pinVerified, true);
      expect(info.state.miscState?.pinInputTries, 0);
    });

    test('should handle pin verified is false', () async {
      storeTester.dispatch(
        VerifyPINAction(
          inputPIN: '',
          httpClient: MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              jsonEncode(
                <String, dynamic>{
                  'data': <String, bool>{'verifyPIN': false}
                },
              ),
              400,
            ),
          ),
          endpoint: kTestVerifyPhoneEndpoint,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(VerifyPINAction);

      expect(info.state.miscState?.pinVerified, false);
      expect(info.state.miscState?.pinInputTries, 0);
    });
  });
}
