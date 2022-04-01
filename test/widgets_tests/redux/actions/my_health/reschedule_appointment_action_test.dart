// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/my_health/reschedule_appointment_action.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('RescheduleAppointmentAction', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        initialState: AppState.initial(),
      );
    });

    testWidgets(
        'should show error message when error occurs '
        'UNKNOWN', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error'}),
          201,
        ),
      );
      late String testString;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: rescheduleButtonKey,
              onPressed: () {
                StoreProvider.dispatch<AppState>(
                  context,
                  RescheduleAppointmentAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                    appointmentId: '1234',
                    onError: () => testString = 'error',
                  ),
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byKey(rescheduleButtonKey));
      await tester.pumpAndSettle();
      expect(testString, 'error');
    });
  });
}
