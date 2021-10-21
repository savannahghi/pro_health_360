// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/change_pin.dart';

/// [ChangePINStateAction] is a Redux action used to handle an existing user login
/// The action stores the phone number, PIN and the login status(success or failure) of if a users credentials match those stored in our backend.

class ChangePINStateAction extends ReduxAction<AppState> {
  ChangePINStateAction({
    this.createPIN,
    this.confirmPIN,
    this.invalidCredentials = false,
  });

  final String? confirmPIN;
  final String? createPIN;
  final bool invalidCredentials;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.miscState!.call(
      changePIN: ChangePIN(createPIN: createPIN, confirmPIN: confirmPIN),
    );

    return newState;
  }
}
