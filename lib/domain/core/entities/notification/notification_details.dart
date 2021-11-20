// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/icon_details.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_actions.dart';

part 'notification_details.freezed.dart';
part 'notification_details.g.dart';

@freezed
class NotificationDetails with _$NotificationDetails {
  factory NotificationDetails({
    @JsonKey(name: 'icon') required IconDetails icon,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'actions') List<NotificationActions>? actions,
    @JsonKey(name: 'status') String? status,
  }) = _NotificationDetails;

  factory NotificationDetails.fromJson(Map<String, dynamic> json) =>
      _$NotificationDetailsFromJson(json);
}
