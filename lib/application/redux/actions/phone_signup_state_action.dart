// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/phone_signup.dart';

/// [PhoneSignUpStateAction] is a Redux action used to handle a `NEW` user sign up
class PhoneSignUpStateAction extends ReduxAction<AppState> {
  PhoneSignUpStateAction({
    this.phoneNumber,
    this.confirmPin,
    this.createPin,
    this.acceptCommunicationTerms,
    this.accountExists,
    this.otp,
    this.invalidCredentials,
    this.accountCreated,
  });

  /// [phoneNumber] the phone number a user inputs while signing up and is of type `String`
  ///
  /// [OTP] the OTP number a user inputs while signing up and is of type `String`
  ///
  /// [accountExists] a variable used to store the value of if a user exists and is of type `boolean`
  ///
  /// [acceptCommunicationTerms] the variable is used to store if a user has accepted app terms to allow communication using their phone number
  ///
  /// [createPin] the variable is used to store the PIN a user enters in the first attempt to create their PIN and is of type `String`
  ///
  /// [confirmPin] the variable is used to store the PIN a user enters in the second attempt to confirm the PIN they are creating and is of type `String`
  ///
  /// [invalidCredentials] the variable is used to store the response from the backend if the provided credentials did not match and is of type `bool`
  ///
  /// [accountCreated] the variable is used to store the response from the backend if a request to create account is processed successfully and is of type `bool`
  final bool? acceptCommunicationTerms;
  final bool? accountCreated;
  final bool? accountExists;
  final String? confirmPin;
  final String? createPin;
  final bool? invalidCredentials;
  final String? otp;

  /// [phoneNumber] is intentionally of type `String` and not of type `PhoneNUmber`. It will be parsed to the correct type by another action.
  /// DON'T CHANGE THIS
  final String? phoneNumber;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.miscState!.call(
      phoneSignUp: PhoneSignUp(
        phoneNumber: phoneNumber ?? state.miscState!.phoneSignUp!.phoneNumber,
        otp: otp ?? phoneNumber ?? state.miscState!.phoneSignUp!.otp,
        accountExists:
            accountExists ?? state.miscState!.phoneSignUp!.accountExists,
        acceptCommunicationTerms: acceptCommunicationTerms ??
            state.miscState!.phoneSignUp!.acceptCommunicationTerms,
        createPin: createPin ?? state.miscState!.phoneSignUp!.createPin,
        confirmPin: confirmPin ?? state.miscState!.phoneSignUp!.confirmPin,
        invalidCredentials: invalidCredentials ??
            state.miscState!.phoneSignUp!.invalidCredentials,
        accountCreated:
            accountCreated ?? state.miscState!.phoneSignUp!.accountCreated,
      ),
    );
    return newState;
  }
}
