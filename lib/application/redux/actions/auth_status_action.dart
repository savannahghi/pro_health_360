// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class AuthStatusAction extends ReduxAction<AppState> {
  AuthStatusAction({
    this.idToken,
    this.refreshToken,
    this.expiresIn,
    this.isSignedIn,
    this.signedInTime,
  });

  final String? expiresIn;
  final String? idToken;
  final bool? isSignedIn;
  final String? refreshToken;
  final String? signedInTime;

  @override
  AppState? reduce() {
    final AppState newState = state.copyWith.credentials!.call(
      idToken: idToken ?? state.credentials?.idToken,
      expiresIn: expiresIn ?? state.credentials?.expiresIn,
      refreshToken: refreshToken ?? state.credentials?.refreshToken,
      isSignedIn: isSignedIn ?? state.credentials?.isSignedIn,
      signedInTime: signedInTime ?? state.credentials?.signedInTime,
    );

    return newState;
  }
}
