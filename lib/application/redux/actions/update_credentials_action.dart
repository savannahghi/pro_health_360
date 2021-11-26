// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';

class UpdateCredentialsAction extends ReduxAction<AppState> {
  final String? idToken;
  final String? expiresIn;
  final String? refreshToken;
  final bool? isSignedIn;
  final String? signedInTime;
  final String? tokenExpiryTimestamp;

  UpdateCredentialsAction({
    this.idToken,
    this.expiresIn,
    this.refreshToken,
    this.isSignedIn,
    this.signedInTime,
    this.tokenExpiryTimestamp,
  });

  @override
  AppState reduce() {
    final AuthCredentials? newCredentials = state.credentials?.copyWith(
      idToken: idToken ?? state.credentials?.idToken,
      expiresIn: expiresIn ?? state.credentials?.expiresIn,
      refreshToken: refreshToken ?? state.credentials?.refreshToken,
      isSignedIn: isSignedIn ?? state.credentials?.isSignedIn,
      signedInTime: signedInTime ?? state.credentials?.signedInTime,
      tokenExpiryTimestamp:
          tokenExpiryTimestamp ?? state.credentials?.tokenExpiryTimestamp,
    );

    return state.copyWith(credentials: newCredentials ?? state.credentials);
  }
}
