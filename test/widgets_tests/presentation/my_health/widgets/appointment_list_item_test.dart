// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/appointments/appointment.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/my_health/widgets/appointment_list_item.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('AppointmentListItem', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: AppointmentListItem(
          appointment: Appointment(
            id: '1234',
            reason: 'No reason at all',
            date: '2022-03-13',
            pendingReschedule: false,
          ),
          appointmentListTye: AppointmentListTye.Upcoming,
        ),
      );

      expect(find.byType(AppointmentListItem), findsOneWidget);
      expect(find.text('No reason at all'), findsOneWidget);
    });
  });
}
