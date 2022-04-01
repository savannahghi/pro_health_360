import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

@freezed
class Appointment with _$Appointment {
  factory Appointment({
    @JsonKey(name: 'ID') required String? id,
    @JsonKey(name: 'type') required String? type,
    @JsonKey(name: 'reason') required String? reason,
    @JsonKey(name: 'status', defaultValue: AppointmentStatus.UNKNOWN)
        AppointmentStatus? status,
    @JsonKey(name: 'date') required String? date,
    @JsonKey(name: 'start') required String? start,
    @JsonKey(name: 'end') required String? end,
    @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
        required bool pendingReschedule,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}
