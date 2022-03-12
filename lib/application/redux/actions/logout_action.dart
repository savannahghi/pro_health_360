import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

class LogoutAction extends ReduxAction<AppState> {
  LogoutAction({
    required this.navigationCallback,
  });

  final VoidCallback navigationCallback;

  @override
  AppState reduce() {
    this.navigationCallback();

    return AppState.initial();
  }
}
