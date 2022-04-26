import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/profile/update_caregiver_information_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/connectivity_state.dart';
import 'package:myafyahub/domain/core/entities/profile/caregiver_information.dart';

import '../../../../mocks.dart';

void main() {
  group('UpdateCareInformationAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });
    test('should catch error if present', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          json.encode(<String, dynamic>{'data': '', 'error': 'test'}),
          500,
        ),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>(initialState: AppState.initial());

      storeTester.dispatch(
        UpdateCaregiverInfoAction(
          caregiverInformation: CaregiverInformation(),
          client: client,
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateCaregiverInfoAction);

      expect(
        (info.error! as UserException).msg,
        'Sorry, an unknown error occurred, please try again or get help from our help center.',
      );
    });

    test('should throw error when data is null', () async {
      storeTester.dispatch(
        UpdateCaregiverInfoAction(
          caregiverInformation: CaregiverInformation(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              json.encode(
                <String, dynamic>{
                  'data': <String, dynamic>{
                    'createOrUpdateClientCaregiver': null
                  }
                },
              ),
              201,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateCaregiverInfoAction);

      expect((info.error! as UserException).msg, null);
    });

    test('should throw error if response has error', () async {
      storeTester.dispatch(
        UpdateCaregiverInfoAction(
          caregiverInformation: CaregiverInformation(),
          client: MockShortGraphQlClient.withResponse(
            '',
            '',
            Response(
              jsonEncode(<String, String>{'error': 'error occurred'}),
              200,
            ),
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateCaregiverInfoAction);

      expect(
        (info.error! as UserException).msg,
        getErrorMessage('updating caregiver information'),
      );
    });
  });
}
