// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login.dart';

/// [PhoneLoginStateAction] is a Redux action used to handle an existing user login
/// The action stores the phone number, PIN and the login status(success or failure) of if a users credentials match those stored in our backend.

class PhoneLoginStateAction extends ReduxAction<AppState> {
  PhoneLoginStateAction({
    this.phoneNumber,
    this.pinCode,
    this.invalidCredentials = false,
  });

  /// [phoneNumber] the phone number a user inputs while logging in of type `String`
  ///
  /// [pinCode] the PIN number a user inputs while logging in of type `String`
  ///
  /// [invalidCredentials] a variable used to set that a user sign in credentials do not match those we get from our backend, of type `boolean`
  final bool invalidCredentials;

  final String? phoneNumber;
  final String? pinCode;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.onboardingState!.call(
      phoneLogin: PhoneLogin(
        phoneNumber: phoneNumber ?? UNKNOWN,
        pinCode: pinCode ?? UNKNOWN,
        invalidCredentials: invalidCredentials,
      ),
    );
    return newState;
  }
}
