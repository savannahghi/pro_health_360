// Package imports:
import 'dart:convert';
import 'dart:ui';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/redux/actions/update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/my_health/pages/appointments_page.dart';
import 'package:pro_health_360/presentation/my_health/pages/my_health_page.dart';
import 'package:pro_health_360/presentation/my_health/widgets/appointment_list_item.dart';
import 'package:pro_health_360/presentation/my_health/widgets/reschedule_appointment_action_dialog.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('Appointments', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      await setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
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
      tester.binding.window.physicalSizeTestValue = const Size(700, 4200);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: AppointmentsPage(),
      );

      final Finder appointmentListItem = find.byType(AppointmentListItem);
      await tester.pumpAndSettle();
      expect(find.byType(AppointmentsPage), findsOneWidget);
      expect(find.text(upcomingAppointmentsText), findsOneWidget);
      expect(appointmentListItem, findsWidgets);
      await tester.fling(
        appointmentListItem.last,
        const Offset(0.0, -30000.0),
        10000.0,
      );
      await tester.pumpAndSettle();

      expect(appointmentListItem, findsWidgets);
      expect(find.text(pastAppointmentsText), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('displays the second tab', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(700, 3000);
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: AppointmentsPage(),
      );

      final Finder appointmentListItem = find.byType(AppointmentListItem);

      expect(find.byType(AppointmentsPage), findsOneWidget);
      expect(find.text(upcomingAppointmentsText), findsOneWidget);

      await tester.tap(find.text(pastAppointmentsText));
      await tester.pumpAndSettle();

      expect(appointmentListItem, findsWidgets);
      await tester.fling(
        appointmentListItem.last,
        const Offset(0.0, -30000.0),
        10000.0,
      );
      await tester.pumpAndSettle();

      expect(appointmentListItem, findsWidgets);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    group('Upcoming Appointments Page', () {
      testWidgets(
          'should show a loading indicator when fetching upcoming appointments',
          (WidgetTester tester) async {
        store.dispatch(WaitAction<AppState>.add('${fetchAppointmentsFlag}1'));
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockLoadingShortGraphQlClient,
          widget: AppointmentsPage(),
        );

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
      testWidgets(
          'should show a loading indicator when fetching more upcoming appointments',
          (WidgetTester tester) async {
        store.dispatch(WaitAction<AppState>.add(fetchAppointmentsFlag));
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: AppointmentsPage(),
        );
        await tester.pump();
        expect(find.byType(PlatformLoader), findsOneWidget);
      });
      testWidgets('should show show dialog when reschedule button is tapped',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: AppointmentsPage(),
        );
        await tester.pumpAndSettle();
        final Finder rescheduleButton = find.byKey(rescheduleButtonKey);
        expect(rescheduleButton, findsNWidgets(2));

        await tester.tap(rescheduleButton.first);
        await tester.pumpAndSettle();
        expect(find.byType(RescheduleAppointmentActionDialog), findsOneWidget);
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
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockNullShortGraphQlClient,
          widget: const MyHealthPage(),
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
    });
    group('Past Appointments Page', () {
      testWidgets(
          'should show a loading indicator when fetching past appointments',
          (WidgetTester tester) async {
        store.dispatch(WaitAction<AppState>.add('${fetchAppointmentsFlag}1'));
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockLoadingShortGraphQlClient,
          widget: AppointmentsPage(),
        );

        await tester.tap(find.text(pastAppointmentsText));

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
      testWidgets(
          'should show a loading indicator when fetching more past appointments',
          (WidgetTester tester) async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: MockGraphQlClient(),
          widget: AppointmentsPage(),
        );

        await tester.tap(find.text(pastAppointmentsText));

        store.dispatch(WaitAction<AppState>.add(fetchAppointmentsFlag));
        await tester.pump();
        await tester.pump(const Duration(seconds: 5));

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
      testWidgets('should show zero state widget if no appointments',
          (WidgetTester tester) async {
        store.dispatch(UpdateConnectivityAction(hasConnection: true));

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockNullShortGraphQlClient,
          widget: const MyHealthPage(),
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
