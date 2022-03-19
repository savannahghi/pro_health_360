// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/my_health/pages/appointments_page.dart';
import 'package:myafyahub/presentation/my_health/widgets/past_appointments.dart';
import '../../../test_helpers.dart';

void main() {
  group('Appointments', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
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
        client: baseGraphQlClientMock,
        widget: AppointmentsPage(),
      );

      expect(find.byType(AppointmentsPage), findsOneWidget);
      expect(find.text(upcomingAppointmentsText), findsOneWidget);

      await tester.tap(find.text(pastAppointmentsText));
      await tester.pumpAndSettle();

      expect(find.byType(PastAppointments), findsWidgets);
    });
  });
}
