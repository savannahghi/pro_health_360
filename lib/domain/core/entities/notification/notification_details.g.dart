// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationDetails _$$_NotificationDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationDetails(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']) ??
          NotificationType.UNKNOWN,
      isRead: json['isRead'] as bool? ?? false,
      createdAt: json['createdAt'] as String?,
      actions: (json['actions'] as List<dynamic>?)
          ?.map((e) => NotificationActions.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_NotificationDetailsToJson(
        _$_NotificationDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': _$NotificationTypeEnumMap[instance.type],
      'isRead': instance.isRead,
      'createdAt': instance.createdAt,
      'actions': instance.actions,
      'status': instance.status,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.APPOINTMENT: 'APPOINTMENT',
  NotificationType.SERVICE_REQUEST: 'SERVICE_REQUEST',
  NotificationType.COMMUNITIES: 'COMMUNITIES',
  NotificationType.UNKNOWN: 'UNKNOWN',
};
