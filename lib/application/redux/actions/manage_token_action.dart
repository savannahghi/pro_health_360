// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/refresh_token_manager.dart';

// Project imports:
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

/// [ManageTokenAction] called when a valid auth has been received. In this regarded, [signedIn] will always be [true]
class ManageTokenAction extends ReduxAction<AppState> {
  ManageTokenAction({
    required this.context,
    required this.refreshToken,
    required this.idToken,
    required this.expiresIn,
    required this.refreshTokenManger,
    this.canExperiment = false,
  });

  bool? canExperiment;
  final BuildContext context;
  String idToken;
  String expiresIn;
  String refreshToken;
  RefreshTokenManger refreshTokenManger;

  @override
  AppState reduce() {
    dispatch(
      AuthStatusAction(
        isSignedIn: true,
        idToken: idToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
      ),
    );

    final int expiresInAsInt = int.parse(this.expiresIn);
    final String parsedExpireAt =
        DateTimeParser().parsedExpireAt(expiresInAsInt);

    /// start refresh token timer
    this.refreshTokenManger.updateExpireTime(parsedExpireAt).reset();
    return state;
  }
}
