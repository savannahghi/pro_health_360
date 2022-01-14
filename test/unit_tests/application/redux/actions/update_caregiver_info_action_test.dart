import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/profile/update_caregiver_information_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/caregiver_information.dart';

import '../../../../mocks.dart';

void main() {
  test('should catch error if present', () async {
    final MockShortSILGraphQlClient client =
        MockShortSILGraphQlClient.withResponse(
      '',
      '',
      Response(
        json.encode(<String, dynamic>{'data': '', 'error': 'test'}),
        200,
      ),
    );

    final StoreTester<AppState> storeTester =
        StoreTester<AppState>(initialState: AppState.initial());

    storeTester.dispatch(
      UpdateCaregiverInfoAction(
        caregiverInformation: CaregiverInformation(),
        graphQlClient: client,
      ),
    );

    final TestInfo<AppState> info =
        await storeTester.waitUntil(UpdateCaregiverInfoAction);

    // TODO: write more appropriate test after hooking up state
    expect(info.state.clientState, AppState.initial().clientState);
  });

  test('should return normally', () async {
    final MockShortSILGraphQlClient client =
        MockShortSILGraphQlClient.withResponse(
      '',
      '',
      Response(
        json.encode(<String, dynamic>{'data': ''}),
        200,
      ),
    );

    final StoreTester<AppState> storeTester =
        StoreTester<AppState>(initialState: AppState.initial());

    storeTester.dispatch(
      UpdateCaregiverInfoAction(
        caregiverInformation: CaregiverInformation(),
        graphQlClient: client,
      ),
    );

    final TestInfo<AppState> info =
        await storeTester.waitUntil(UpdateCaregiverInfoAction);

    // TODO: write more appropriate test after hooking up state
    expect(info.state.clientState, AppState.initial().clientState);
  });
}
