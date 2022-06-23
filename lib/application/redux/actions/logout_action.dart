import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

class LogoutAction extends ReduxAction<AppState> {
  LogoutAction({
    required this.navigationCallback,
  });

  final VoidCallback navigationCallback;

  @override
  Future<AppState> reduce() async {
    this.navigationCallback();

    await AnalyticsService().logEvent(
      name: logoutEvent,
      eventType: AnalyticsEventType.AUTH,
    );

    await AnalyticsService().reset();

    return AppState.initial();
  }
}
