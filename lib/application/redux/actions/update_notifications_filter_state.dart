// Flutter imports:

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/notification_filter_state.dart';

import 'package:afya_moja_core/src/domain/core/entities/notifications/notification_filter.dart';

class UpdateNotificationFilterStateAction extends ReduxAction<AppState> {
  UpdateNotificationFilterStateAction({
    this.notificationFilters,
  });

  final List<NotificationFilter?>? notificationFilters;

  @override
  Future<AppState> reduce() async {
    final NotificationFilterState notificationFilterState =
        NotificationFilterState(
      notificationFilters: notificationFilters ??
          state.clientState?.notificationFilterState?.notificationFilters,
    );

    final AppState newState = state.copyWith.call(
      clientState: state.clientState?.copyWith
          .call(notificationFilterState: notificationFilterState),
    );

    return newState;
  }
}
