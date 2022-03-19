// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Appointment _$$_AppointmentFromJson(Map<String, dynamic> json) =>
    _$_Appointment(
      type: json['type'] as String?,
      reason: json['reason'] as String?,
      status: $enumDecodeNullable(_$AppointmentStatusEnumMap, json['status']) ??
          AppointmentStatus.UNKNOWN,
      date: json['date'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
    );

Map<String, dynamic> _$$_AppointmentToJson(_$_Appointment instance) =>
    <String, dynamic>{
      'type': instance.type,
      'reason': instance.reason,
      'status': _$AppointmentStatusEnumMap[instance.status],
      'date': instance.date,
      'start': instance.start,
      'end': instance.end,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.Scheduled: 'Scheduled',
  AppointmentStatus.Rescheduled: 'Rescheduled',
  AppointmentStatus.Waiting: 'Waiting',
  AppointmentStatus.Missed: 'Missed',
  AppointmentStatus.Completed: 'Completed',
  AppointmentStatus.InConsultation: 'InConsultation',
  AppointmentStatus.WalkIn: 'WalkIn',
  AppointmentStatus.Cancelled: 'Cancelled',
  AppointmentStatus.NeedsReschedule: 'NeedsReschedule',
  AppointmentStatus.UNKNOWN: 'UNKNOWN',
};
