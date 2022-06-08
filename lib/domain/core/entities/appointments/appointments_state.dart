import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/appointments/appointment.dart';

part 'appointments_state.freezed.dart';
part 'appointments_state.g.dart';

@freezed
class AppointmentState with _$AppointmentState {
  factory AppointmentState({
    @JsonKey(name: 'appointments') List<Appointment>? appointments,
    int? currentPage,
    bool? hasNextPage,
    bool? errorFetchingAppointments,
  }) = _AppointmentState;

  factory AppointmentState.fromJson(Map<String, dynamic> json) =>
      _$AppointmentStateFromJson(json);

  factory AppointmentState.initial() => AppointmentState(
        appointments: <Appointment>[],
        errorFetchingAppointments: false,
        currentPage: 1,
        hasNextPage: true,
      );
}
