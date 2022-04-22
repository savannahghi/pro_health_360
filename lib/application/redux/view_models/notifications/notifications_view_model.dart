import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_details.dart';

class NotificationsViewModel extends Vm {
  final Wait wait;
  final List<NotificationDetails?> notifications;

  NotificationsViewModel({
    required this.wait,
    required this.notifications,
  }) : super(equals: <Object?>[wait, notifications]);

  factory NotificationsViewModel.fromStore(Store<AppState> store) {
    return NotificationsViewModel(
      wait: store.state.wait!,
      notifications:
          store.state.clientState?.notifications ?? <NotificationDetails>[],
    );
  }
}
