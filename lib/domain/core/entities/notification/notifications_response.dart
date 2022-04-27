// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_response.freezed.dart';
part 'notifications_response.g.dart';

@freezed
class NotificationsResponse with _$NotificationsResponse {
  factory NotificationsResponse({
    @JsonKey(name: 'fetchNotifications') required NotificationsData data,
  }) = _NotificationsResponse;

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);
}

@freezed
class NotificationsData with _$NotificationsData {
  factory NotificationsData({
    @JsonKey(name: 'notifications')
        required List<NotificationDetails> notifications,
  }) = _NotificationsData;

  factory NotificationsData.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDataFromJson(json);
}
