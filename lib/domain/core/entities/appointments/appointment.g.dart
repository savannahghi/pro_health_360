// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Appointment _$$_AppointmentFromJson(Map<String, dynamic> json) =>
    _$_Appointment(
      id: json['ID'] as String?,
      reason: json['reason'] as String?,
      date: json['date'] as String?,
      pendingReschedule: json['HasRescheduledAppointment'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AppointmentToJson(_$_Appointment instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'reason': instance.reason,
      'date': instance.date,
      'HasRescheduledAppointment': instance.pendingReschedule,
    };
