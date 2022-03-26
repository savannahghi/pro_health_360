// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppointmentState _$$_AppointmentStateFromJson(Map<String, dynamic> json) =>
    _$_AppointmentState(
      appointments: (json['appointments'] as List<dynamic>?)
          ?.map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingAppointments: json['errorFetchingAppointments'] as bool?,
    );

Map<String, dynamic> _$$_AppointmentStateToJson(_$_AppointmentState instance) =>
    <String, dynamic>{
      'appointments': instance.appointments,
      'errorFetchingAppointments': instance.errorFetchingAppointments,
    };
