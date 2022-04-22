// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'notification_details.freezed.dart';
part 'notification_details.g.dart';

@freezed
class NotificationDetails with _$NotificationDetails {
  factory NotificationDetails({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'body') String? body,
    @JsonKey(name: 'type', defaultValue: NotificationType.UNKNOWN)
        NotificationType? type,
    @JsonKey(name: 'isRead', defaultValue: false) bool? isRead,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'actions') List<NotificationActions>? actions,
    @JsonKey(name: 'status') String? status,
  }) = _NotificationDetails;

  factory NotificationDetails.fromJson(Map<String, dynamic> json) =>
      _$NotificationDetailsFromJson(json);

  factory NotificationDetails.initial() => NotificationDetails(
        id: UNKNOWN,
        title: UNKNOWN,
        body: UNKNOWN,
        type: NotificationType.UNKNOWN,
        isRead: false,
        createdAt: UNKNOWN,
        actions: <NotificationActions>[],
        status: UNKNOWN,
      );
}
