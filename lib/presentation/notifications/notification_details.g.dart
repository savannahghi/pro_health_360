// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationDetails _$_$_NotificationDetailsFromJson(
    Map<String, dynamic> json) {
  return _$_NotificationDetails(
    svgPath: json['svgPath'] as String,
    description: json['description'] as String,
    date: json['date'] as String,
    calendar: json['calendar'] as bool?,
    isAlternateNotification: json['isAlternateNotification'] as bool?,
  );
}

Map<String, dynamic> _$_$_NotificationDetailsToJson(
        _$_NotificationDetails instance) =>
    <String, dynamic>{
      'svgPath': instance.svgPath,
      'description': instance.description,
      'date': instance.date,
      'calendar': instance.calendar,
      'isAlternateNotification': instance.isAlternateNotification,
    };
