// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationsResponse _$$_NotificationsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationsResponse(
      data: NotificationsData.fromJson(
          json['fetchNotifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationsResponseToJson(
        _$_NotificationsResponse instance) =>
    <String, dynamic>{
      'fetchNotifications': instance.data,
    };

_$_NotificationsData _$$_NotificationsDataFromJson(Map<String, dynamic> json) =>
    _$_NotificationsData(
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NotificationsDataToJson(
        _$_NotificationsData instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
    };
