// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'user_pin.g.dart';

@JsonSerializable()
class UserPin {
  final bool forgotPIN;
  final bool invalidPin;
  final bool isChangingPin;
  final String? pin;
  final String? recoveryOtp;
  UserPin({
    this.forgotPIN = false,
    this.invalidPin = false,
    this.isChangingPin = false,
    this.pin,
    this.recoveryOtp,
  });

  factory UserPin.fromJson(Map<String, dynamic> json) =>
      _$UserPinFromJson(json);

  Map<String, dynamic> toJson() => _$UserPinToJson(this);
}
