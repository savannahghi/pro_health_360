import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/appointments/appointments_state.dart';

class AppointmentsViewModel extends Vm {
  AppointmentsViewModel({
    this.wait,
    this.appointmentState,
  }) : super(
          equals: <Object?>[
            wait,
            appointmentState,
          ],
        );

  factory AppointmentsViewModel.fromStore(AppState state) {
    return AppointmentsViewModel(
      wait: state.wait,
      appointmentState: state.miscState?.appointmentState,
    );
  }
  final AppointmentState? appointmentState;
  final Wait? wait;
}
