// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';

class LoginPageViewModel extends Vm {
  LoginPageViewModel({
    required this.wait,
    required this.invalidCredentials,
  }) : super(equals: <Object?>[wait, invalidCredentials]);

  final Wait? wait;
  final bool? invalidCredentials;

  static LoginPageViewModel fromState(AppState state) {
    return LoginPageViewModel(
      wait: state.wait,
      invalidCredentials: state.onboardingState?.invalidCredentials,
    );
  }
}
