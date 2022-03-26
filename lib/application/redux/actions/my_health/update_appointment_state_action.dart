import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/appointments/appointment.dart';
import 'package:myafyahub/domain/core/entities/appointments/appointments_state.dart';

class UpdateAppointmentStateAction extends ReduxAction<AppState> {
  final List<Appointment>? appointments;
  final bool? errorFetchingAppointments;

  UpdateAppointmentStateAction({
    this.appointments,
    this.errorFetchingAppointments,
  });

  @override
  Future<AppState?> reduce() async {
    final AppointmentState? appointmentState =
        state.miscState?.appointmentState?.copyWith(
      appointments:
          appointments,
      errorFetchingAppointments: errorFetchingAppointments,
    );


    return state.copyWith(
      miscState: state.miscState?.copyWith(appointmentState: appointmentState),
    );
  }
}
