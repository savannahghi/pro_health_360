// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';
part 'notification_state.g.dart';

@freezed
class NotificationState with _$NotificationState {
  factory NotificationState() = _NotificationState;

  factory NotificationState.fromJson(Map<String, dynamic> json) =>
      _$NotificationStateFromJson(json);

  factory NotificationState.initial() => NotificationState();
}
