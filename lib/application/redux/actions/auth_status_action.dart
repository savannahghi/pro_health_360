// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class AuthStatusAction extends ReduxAction<MainAppState> {
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
  MainAppState? reduce() {
    final MainAppState newState = state.copyWith.credentials!.call(
      idToken: idToken ?? state.credentials?.idToken,
      expiresIn: expiresAt ?? state.credentials?.expiresIn,
      refreshToken: refreshToken ?? state.credentials?.refreshToken,
    );

    return newState;
  }
}
