// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/my_health/widgets/reschedule_appointment_action_dialog.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('Appointments', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    final MockShortGraphQlClient mockLoadingShortGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'loading': true}
        }),
        201,
      ),
    );

    final MockShortGraphQlClient mockErrorShortGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{'error': 'some error occurred'}),
        201,
      ),
    );

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const RescheduleAppointmentActionDialog(
                    appointmentId: 'test',
                  );
                },
              ),
            );
          },
        ),
      );

      final Finder rescheduleButton = find.byKey(rescheduleButtonKey);
      final Finder rescheduleDate = find.byKey(rescheduleDateKey);
      final DateTime currentDate = DateTime.now().add(const Duration(days: 1));

      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
      expect(rescheduleButton, findsOneWidget);

      expect(rescheduleDate, findsOneWidget);
      await tester.ensureVisible(rescheduleDate);
      await tester.pumpAndSettle();
      await tester.tap(rescheduleDate);
      await tester.pumpAndSettle();

      expect(find.text(currentDate.year.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();

      expect(find.text(currentDate.day.toString()), findsOneWidget);
      await tester.tap(find.text(currentDate.day.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.tap(rescheduleButton);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(appointmentRescheduledMessageString), findsOneWidget);
    });

    testWidgets('should show a loading indicator when rescheduling',
        (WidgetTester tester) async {
      store.dispatch(
        WaitAction<AppState>.add('${rescheduleAppointmentFlag}_test'),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockLoadingShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const RescheduleAppointmentActionDialog(
                    appointmentId: 'test',
                  );
                },
              ),
            );
          },
        ),
      );
      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets(
        'should show an error message if reschedule request was not sent',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'fetchClientAppointments': <String, dynamic>{
                'appointments': <dynamic>[
                  <String, dynamic>{
                    'ID': '1234',
                    'reason': 'test',
                    'date': '2022-01-04',
                    'hasRescheduledAppointment': false
                  }
                ],
              }
            }
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const RescheduleAppointmentActionDialog(
                    appointmentId: 'test',
                  );
                },
              ),
            );
          },
        ),
      );

      final Finder rescheduleButton = find.byKey(rescheduleButtonKey);
      final Finder rescheduleDate = find.byKey(rescheduleDateKey);
      final DateTime currentDate = DateTime.now().add(const Duration(days: 1));

      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(rescheduleDate, findsOneWidget);
      await tester.ensureVisible(rescheduleDate);
      await tester.pumpAndSettle();
      await tester.tap(rescheduleDate);
      await tester.pumpAndSettle();

      expect(find.text(currentDate.year.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();

      expect(find.text(currentDate.day.toString()), findsOneWidget);
      await tester.tap(find.text(currentDate.day.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.tap(rescheduleButton);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(getErrorMessage()), findsOneWidget);
    });
    testWidgets('should show error message when an error occurs',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockErrorShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const RescheduleAppointmentActionDialog(
                    appointmentId: 'test',
                  );
                },
              ),
            );
          },
        ),
      );

      final Finder rescheduleButton = find.byKey(rescheduleButtonKey);
      final Finder rescheduleDate = find.byKey(rescheduleDateKey);
      final DateTime currentDate = DateTime.now().add(const Duration(days: 1));

      expect(find.byType(GestureDetector), findsOneWidget);
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(rescheduleDate, findsOneWidget);
      await tester.ensureVisible(rescheduleDate);
      await tester.pumpAndSettle();
      await tester.tap(rescheduleDate);
      await tester.pumpAndSettle();
      expect(find.text(currentDate.year.toString()), findsOneWidget);
      await tester.tap(find.text(currentYear.toString()));
      await tester.pumpAndSettle();

      expect(find.text(currentDate.day.toString()), findsOneWidget);
      await tester.tap(find.text(currentDate.day.toString()));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.tap(rescheduleButton);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(getErrorMessage()), findsOneWidget);
    });
  });
}
