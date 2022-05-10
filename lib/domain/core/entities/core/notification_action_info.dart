import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_action_info.freezed.dart';

@freezed
class NotificationActionInfo with _$NotificationActionInfo {
  factory NotificationActionInfo({
    // The title string on the action button
    required String? actionTitle,

    // The route to navigate to
    required String? route,

    // Any route arguments that may need to be passed while navigating
    @Default(null) dynamic arguments,
  }) = _NotificationActionInfo;
}
