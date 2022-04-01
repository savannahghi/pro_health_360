// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/my_health/pages/appointments_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_page.dart';
import 'package:myafyahub/presentation/my_health/widgets/appointment_list_item.dart';
import 'package:myafyahub/presentation/my_health/widgets/past_appointments.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

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
    final MockShortGraphQlClient mockNullShortGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'fetchClientAppointments': <String, dynamic>{
              'appointments': <dynamic>[],
            }
          }
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
        widget: AppointmentsPage(),
      );

      expect(find.byType(AppointmentsPage), findsOneWidget);
      expect(find.text(upcomingAppointmentsText), findsOneWidget);
      expect(find.text(pastAppointmentsText), findsOneWidget);
    });

    testWidgets('displays the second tab', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: AppointmentsPage(),
      );

      expect(find.byType(AppointmentsPage), findsOneWidget);
      expect(find.text(upcomingAppointmentsText), findsOneWidget);

      await tester.tap(find.text(pastAppointmentsText));
      await tester.pumpAndSettle();

      expect(find.byType(PastAppointments), findsWidgets);
    });

    group('Upcoming Appointments Page', () {
      testWidgets(
          'should show a loading indicator when fetching upcoming appointments',
          (WidgetTester tester) async {
        store.dispatch(WaitAction<AppState>.add(fetchAppointmentsFlag));
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockLoadingShortGraphQlClient,
          widget: AppointmentsPage(),
        );

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
      testWidgets('should show error state widget if no appointments',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockErrorShortGraphQlClient,
          widget: AppointmentsPage(),
        );

        await tester.pumpAndSettle();
        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);

        // / Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(genericNoDataButton);

        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      });
      testWidgets('should show zero state widget if no appointments',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockNullShortGraphQlClient,
          widget: MyHealthPage(),
        );

        final Finder helpNoDataWidgetButton = find.byKey(helpNoDataWidgetKey);
        await tester.tap(find.text(myHealthPageAppointments));
        await tester.pumpAndSettle();
        expect(find.byType(AppointmentsPage), findsOneWidget);

        expect(find.byType(AppointmentListItem), findsNothing);
        await tester.tap(helpNoDataWidgetButton);
        await tester.pumpAndSettle();

        expect(find.byType(AppointmentsPage), findsNothing);
      });
      testWidgets(
          'should show a success message if reschedule request was sent',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: AppointmentsPage(),
        );
        await tester.pumpAndSettle();
        final Finder rescheduleButton = find.byKey(rescheduleButtonKey);
        expect(rescheduleButton, findsOneWidget);

        await tester.tap(rescheduleButton);
        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text(appointmentRescheduledMessageString), findsOneWidget);
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
                      'type': 'DENTAL',
                      'reason': 'test',
                      'status': 'SCHEDULED',
                      'date': '2022-01-04',
                      'start': 'test',
                      'end': 'test',
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
          widget: AppointmentsPage(),
        );
        await tester.pumpAndSettle();
        final Finder rescheduleButton = find.byKey(rescheduleButtonKey);
        expect(rescheduleButton, findsOneWidget);

        await tester.tap(rescheduleButton);
        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text(getErrorMessage()), findsOneWidget);
      });
      testWidgets(
          'should show a loading indicator when rescheduling an appointment',
          (WidgetTester tester) async {
        store.dispatch(
          WaitAction<AppState>.add('${rescheduleAppointmentFlag}_1234'),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: AppointmentsPage(),
        );
        await tester.pump();

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
    });
    group('Past Appointments Page', () {
      testWidgets(
          'should show a loading indicator when fetching past appointments',
          (WidgetTester tester) async {
        store.dispatch(WaitAction<AppState>.add(fetchAppointmentsFlag));
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockLoadingShortGraphQlClient,
          widget: AppointmentsPage(),
        );

        await tester.tap(find.text(pastAppointmentsText));

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
      testWidgets('should show zero state widget if no appointments',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockNullShortGraphQlClient,
          widget: MyHealthPage(),
        );

        final Finder helpNoDataWidgetButton = find.byKey(helpNoDataWidgetKey);
        await tester.tap(find.text(myHealthPageAppointments));
        await tester.pumpAndSettle();
        expect(find.byType(AppointmentsPage), findsOneWidget);
        await tester.tap(find.text(pastAppointmentsText));
        await tester.pumpAndSettle();

        expect(find.byType(AppointmentListItem), findsNothing);
        await tester.tap(helpNoDataWidgetButton);
        await tester.pumpAndSettle();

        expect(find.byType(AppointmentsPage), findsNothing);
      });
      testWidgets('should show error state widget if no appointments',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockErrorShortGraphQlClient,
          widget: AppointmentsPage(),
        );
        await tester.tap(find.text(pastAppointmentsText));
        await tester.pumpAndSettle();

        final Finder genericNoDataButton = find.byKey(helpNoDataWidgetKey);

        expect(genericNoDataButton, findsOneWidget);

        /// Refresh and expect the same thing
        await tester.ensureVisible(genericNoDataButton);
        await tester.pumpAndSettle();
        await tester.tap(genericNoDataButton);

        await tester.pumpAndSettle();
        expect(genericNoDataButton, findsOneWidget);
      });
    });
  });
}
