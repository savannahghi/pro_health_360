import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/auth.dart';

import 'package:dart_fcm/dart_fcm.dart';

class LogoutAction extends ReduxAction<AppState> {
  LogoutAction({required this.navigationCallback, required this.context});

  final BuildContext context;
  final Function navigationCallback;

  @override
  Future<AppState> reduce() async {
    this.navigationCallback();

    try {
      /// set [expiresAt] to a extreme time. This will ensure the refresh logic does not kick in
      /// which may affect app performance
      await store.dispatch(
        AuthStatusAction(
          signedIn: false,
          idToken: UNDEFINED_AUTH_TOKEN,
          refreshToken: UNDEFINED_REFRESH_TOKEN,
          expiresAt:
              DateTime.now().add(const Duration(days: 1000)).toIso8601String(),
        ),
      );

      await SILFCM().resetToken();
    } catch (error, stackTrace) {
      await Sentry.captureException(error, stackTrace: stackTrace);
    }

    return AppState.initial();
  }
}
