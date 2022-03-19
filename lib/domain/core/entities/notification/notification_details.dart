// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
part 'notification_details.freezed.dart';
part 'notification_details.g.dart';

@freezed
class NotificationDetails with _$NotificationDetails {
  factory NotificationDetails({
    @JsonKey(name: 'icon') required IconDetails icon,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'actions') List<NotificationActions>? actions,
  }) = _NotificationDetails;

  factory NotificationDetails.fromJson(Map<String, dynamic> json) =>
      _$NotificationDetailsFromJson(json);
}
