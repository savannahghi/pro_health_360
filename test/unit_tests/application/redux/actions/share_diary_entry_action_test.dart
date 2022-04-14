import 'dart:convert';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:myafyahub/application/redux/actions/share_diary_entry_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/connectivity_state.dart';

import '../../../../mocks.dart';

void main() {
  group('ShareDiaryEntryAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should run successfully', () async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'shareHealthDiaryEntry': true,
            }
          }),
          200,
        ),
      );
      int testNumber = 0;
      storeTester.dispatch(
        ShareDiaryEntryAction(
          canShareEntireDiaryEntry: true,
          healthDiaryEntryID: '',
          client: mockShortSILGraphQlClient,
          onSuccess: () {
            testNumber += 1;
          },
          onFailure: () {},
        ),
      );

      await storeTester.waitUntil(ShareDiaryEntryAction);
      expect(testNumber, 1);
    });

    test('should show error snackbar', () async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'shareHealthDiaryEntry': false,
            }
          }),
          200,
        ),
      );
      int testNumber = 0;
      storeTester.dispatch(
        ShareDiaryEntryAction(
          canShareEntireDiaryEntry: true,
          healthDiaryEntryID: '',
          client: mockShortSILGraphQlClient,
          onSuccess: () {},
          onFailure: () {
            testNumber += 1;
          },
        ),
      );

      await storeTester.waitUntil(ShareDiaryEntryAction);
      expect(testNumber, 1);
    });

    test('should throw error if api call is not 200', () async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ]
          }),
          401,
        ),
      );
      storeTester.dispatch(
        ShareDiaryEntryAction(
          canShareEntireDiaryEntry: true,
          healthDiaryEntryID: '',
          client: mockShortSILGraphQlClient,
          onSuccess: () {},
          onFailure: () {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ShareDiaryEntryAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our '
        'help center.',
      );
    });
    test('should throw error if response has error', () async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ]
          }),
          200,
        ),
      );
      storeTester.dispatch(
        ShareDiaryEntryAction(
          canShareEntireDiaryEntry: true,
          healthDiaryEntryID: '',
          client: mockShortSILGraphQlClient,
          onSuccess: () {},
          onFailure: () {},
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(ShareDiaryEntryAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('sharing diary entry'),
      );
    });
  });
}
