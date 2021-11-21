// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class VerifyPhoneViewModel extends Vm {
  VerifyPhoneViewModel({
    required this.wait,
    required this.userID,
    required this.phoneNumber,
    required this.otp,
    this.invalidOTP,
  }) : super(
          equals: <Object?>[wait, userID, phoneNumber, otp],
        );

  final Wait? wait;
  final String? userID;
  final String? phoneNumber;
  final String? otp;
  final bool? invalidOTP;

  static VerifyPhoneViewModel fromStore(Store<AppState> store) {
    final AppState state = store.state;
    return VerifyPhoneViewModel(
      wait: state.wait,
      userID: state.clientState!.user!.userId,
      phoneNumber: state.clientState!.user!.primaryContact!.value,
      otp: state.onboardingState!.verifyPhoneState!.otp,
      invalidOTP: state.onboardingState!.verifyPhoneState!.invalidOTP,
    );
  }
}
