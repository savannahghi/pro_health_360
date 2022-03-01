// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/auth.dart';

class LogoutAction extends ReduxAction<AppState> {
  LogoutAction({
    required this.navigationCallback,
    required this.context,
  });

  final BuildContext context;
  final Function navigationCallback;

  @override
  Future<AppState> reduce() async {
    this.navigationCallback();

    dispatch(
      AuthStatusAction(
        isSignedIn: false,
        idToken: UNDEFINED_AUTH_TOKEN,
        refreshToken: UNDEFINED_REFRESH_TOKEN,
        expiresIn: UNKNOWN,
        tokenExpiryTimestamp: UNKNOWN,
      ),
    );

    return AppState.initial();
  }
}
