// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Appointment _$$_AppointmentFromJson(Map<String, dynamic> json) =>
    _$_Appointment(
      id: json['ID'] as String?,
      type: json['type'] as String?,
      reason: json['reason'] as String?,
      status: $enumDecodeNullable(_$AppointmentStatusEnumMap, json['status']) ??
          AppointmentStatus.UNKNOWN,
      date: json['date'] as String?,
      start: json['start'] as String?,
      end: json['end'] as String?,
      pendingReschedule: json['hasRescheduledAppointment'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AppointmentToJson(_$_Appointment instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'type': instance.type,
      'reason': instance.reason,
      'status': _$AppointmentStatusEnumMap[instance.status],
      'date': instance.date,
      'start': instance.start,
      'end': instance.end,
      'hasRescheduledAppointment': instance.pendingReschedule,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.SCHEDULED: 'SCHEDULED',
  AppointmentStatus.RESCHEDULED: 'RESCHEDULED',
  AppointmentStatus.WAITING: 'WAITING',
  AppointmentStatus.MISSED: 'MISSED',
  AppointmentStatus.COMPLETED: 'COMPLETED',
  AppointmentStatus.INCONSULTATION: 'INCONSULTATION',
  AppointmentStatus.WALKIN: 'WALKIN',
  AppointmentStatus.CANCELLED: 'CANCELLED',
  AppointmentStatus.NEEDSRESCHEDULE: 'NEEDSRESCHEDULE',
  AppointmentStatus.UNKNOWN: 'UNKNOWN',
};
