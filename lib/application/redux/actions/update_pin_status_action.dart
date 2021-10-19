// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/user_pin.dart';

class UpdatePinStatusAction extends ReduxAction<AppState> {
  UpdatePinStatusAction({
    this.pin,
    this.invalidPin,
    this.isChangingPin,
    this.recoveryOtp,
    this.forgotPIN,
    this.controller,
  });

  final TextEditingController? controller;
  final bool? forgotPIN;
  final bool? invalidPin;
  final bool? isChangingPin;
  final String? pin;
  final String? recoveryOtp;

  @override
  AppState reduce() {
    final UserPin? pinObj = state.miscState!.userPin;
    if (invalidPin != null && invalidPin!) {
      if (controller != null) {
        controller!.clear();
      }
    }

    final AppState newState = state.copyWith.miscState!.call(
      userPin: UserPin(
        pin: pin ?? pinObj!.pin,
        invalidPin: invalidPin ?? pinObj!.invalidPin,
        forgotPIN: forgotPIN ?? pinObj!.forgotPIN,
        isChangingPin: isChangingPin ?? pinObj!.isChangingPin,
        recoveryOtp: recoveryOtp ?? pinObj!.recoveryOtp,
      ),
    );

    return newState;
  }
}
