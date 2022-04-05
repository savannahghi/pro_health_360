import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

@freezed
class Appointment with _$Appointment {
  factory Appointment({
    @JsonKey(name: 'ID') required String? id,
    @JsonKey(name: 'reason') required String? reason,
    @JsonKey(name: 'date') required String? date,
    @JsonKey(name: 'HasRescheduledAppointment', defaultValue: false)
        required bool pendingReschedule,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}
