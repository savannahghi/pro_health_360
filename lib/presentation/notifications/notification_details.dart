// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_details.freezed.dart';
part 'notification_details.g.dart';

@freezed
class NotificationDetails with _$NotificationDetails {
  factory NotificationDetails({
    @JsonKey(name: 'svgPath') required String svgPath,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'calendar') bool? calendar,
    @JsonKey(name: 'isAlternateNotification') bool? isAlternateNotification,
  }) = _NotificationDetails;

  factory NotificationDetails.fromJson(Map<String, dynamic> json) =>
      _$NotificationDetailsFromJson(json);
}
