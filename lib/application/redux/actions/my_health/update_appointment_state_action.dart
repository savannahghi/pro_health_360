import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/appointments/appointment.dart';
import 'package:pro_health_360/domain/core/entities/appointments/appointments_state.dart';

class UpdateAppointmentStateAction extends ReduxAction<AppState> {
  final List<Appointment>? appointments;
  final bool? errorFetchingAppointments;
  final int? currentPage;
  final bool? hasNextPage;

  UpdateAppointmentStateAction({
    this.appointments,
    this.errorFetchingAppointments,
    this.currentPage,
    this.hasNextPage,
  });

  @override
  Future<AppState?> reduce() async {
    final AppointmentState? appointmentState =
        state.miscState?.appointmentState?.copyWith(
      appointments:
          appointments ?? state.miscState?.appointmentState?.appointments,
      errorFetchingAppointments: errorFetchingAppointments ??
          state.miscState?.appointmentState?.errorFetchingAppointments,
      currentPage:
          currentPage ?? state.miscState?.appointmentState?.currentPage,
      hasNextPage:
          hasNextPage ?? state.miscState?.appointmentState?.hasNextPage,
    );

    return state.copyWith(
      miscState: state.miscState?.copyWith(appointmentState: appointmentState),
    );
  }
}
