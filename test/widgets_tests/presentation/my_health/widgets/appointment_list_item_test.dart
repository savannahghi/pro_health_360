// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/appointments/appointment.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/my_health/widgets/appointment_list_item.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('AppointmentListItem', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: AppointmentListItem(
          appointment: Appointment(
            id: '1234',
            type: 'Scheduled clinic visit',
            reason: 'No reason at all',
            date: '2022-03-13',
            start: '0000-01-01T11:07:56Z',
            end: '0000-01-01T12:07:56Z',
            status: AppointmentStatus.WAITING,
            pendingReschedule: false,
          ),
          appointmentListTye: AppointmentListTye.Upcoming,
        ),
      );

      expect(find.byType(AppointmentListItem), findsOneWidget);
      expect(find.text('Scheduled clinic visit'), findsOneWidget);
    });
  });
}
