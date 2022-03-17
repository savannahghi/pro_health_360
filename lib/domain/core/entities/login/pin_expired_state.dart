// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_expired_state.freezed.dart';
part 'pin_expired_state.g.dart';

@freezed
class PINExpiredState with _$PINExpiredState {
  factory PINExpiredState({
    // The phone number
    String? phone,
    // Whether the phone number has been verified
    bool? isPhoneVerified,

    // Whether the PIN has been changed
    bool? isPINChanged,

    // The PIN
    final String? pin,

    // The confirm PIN
    final String? confirmPIN,

    // The OTP used when confirming the phone number
    final String? otp,
  }) = _PINExpiredState;

  factory PINExpiredState.fromJson(Map<String, dynamic> json) =>
      _$PINExpiredStateFromJson(json);

  factory PINExpiredState.initial() => PINExpiredState(
        phone: UNKNOWN,
        isPhoneVerified: false,
        isPINChanged: false,
        pin: UNKNOWN,
        confirmPIN: UNKNOWN,
        otp: UNKNOWN,
      );
}
