// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';

class AuthStatusAction extends ReduxAction<AppState> {
  AuthStatusAction({
    this.idToken,
    this.refreshToken,
    this.expiresAt,
    this.isAnonymous,
    this.signedIn,
    this.uid,
    this.signedInTime,
    this.isChangePin,
  });

  final String? expiresAt;
  final String? idToken;
  final bool? isAnonymous;
  final bool? isChangePin;
  final String? refreshToken;
  final bool? signedIn;
  final String? signedInTime;
  final String? uid;

  @override
  AppState? reduce() {
    final AuthCredentials? authCredentials = state.credentials?.authCredentials;
    final AppState? newState = state.copyWith.credentials?.call(
      authCredentials: AuthCredentials(
        idToken: idToken ?? authCredentials?.idToken,
        expiresIn: expiresAt ?? authCredentials?.expiresIn,
        refreshToken: refreshToken ?? authCredentials?.refreshToken,
      ),
    );

    return newState ?? state;
  }
}
