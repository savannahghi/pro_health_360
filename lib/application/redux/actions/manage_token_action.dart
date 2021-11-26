// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/refresh_token_manager.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

/// [ManageTokenAction] called when a valid auth has been received. In this regarded, [signedIn] will always be [true]
class ManageTokenAction extends ReduxAction<AppState> {
  ManageTokenAction({
    required this.refreshToken,
    required this.idToken,
    required this.expiresIn,
    required this.refreshTokenManger,
    this.tokenExpiryTimestamp,
    this.canExperiment = false,
  });

  bool? canExperiment;
  String idToken;
  String expiresIn;
  String refreshToken;
  String? tokenExpiryTimestamp;
  RefreshTokenManger refreshTokenManger;

  @override
  AppState reduce() {
    dispatch(
      AuthStatusAction(
        idToken: idToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn,
        tokenExpiryTimestamp: tokenExpiryTimestamp,
      ),
    );

    return state;
  }
}
