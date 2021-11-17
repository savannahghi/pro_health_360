// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/refresh_token_manager.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

/// [ManageTokenAction] called when a valid auth has been received. In this regarded, [signedIn] will always be [true]
class ManageTokenAction extends ReduxAction<AppState> {
  ManageTokenAction({
    required this.context,
    required this.refreshToken,
    required this.idToken,
    required this.parsedExpiresAt,
    required this.refreshTokenManger,
    this.canExperiment = false,
  });

  bool? canExperiment;
  final BuildContext context;
  String idToken;
  String parsedExpiresAt;
  String refreshToken;
  RefreshTokenManger refreshTokenManger;

  @override
  Future<AppState> reduce() async {
    await dispatch(
      AuthStatusAction(
        signedIn: true,
        idToken: idToken,
        refreshToken: refreshToken,
        expiresAt: parsedExpiresAt,
        isAnonymous: false,
      ),
    );

    /// start refresh token timer
    this.refreshTokenManger.updateExpireTime(parsedExpiresAt).reset();
    return state;
  }
}
