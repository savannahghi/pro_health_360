import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_events.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

class LogoutAction extends ReduxAction<AppState> {
  LogoutAction({
    required this.navigationCallback,
  });

  final VoidCallback navigationCallback;

  @override
  Future<AppState> reduce() async {
    this.navigationCallback();

    await logUserEvent(
      name: logoutEvent,
      state: state,
      eventType: AnalyticsEventType.AUTH_EVENT,
    );

    return AppState.initial();
  }
}
