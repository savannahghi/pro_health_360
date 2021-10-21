// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phone_login.g.dart';

@JsonSerializable()
class PhoneLogin {
  PhoneLogin({
    this.invalidCredentials = false,
    required this.phoneNumber,
    required this.pinCode,
  });

  factory PhoneLogin.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginFromJson(json);

  factory PhoneLogin.initial() => PhoneLogin(
        phoneNumber: UNKNOWN,
        pinCode: UNKNOWN,
      );

  final bool invalidCredentials;
  final String phoneNumber;
  final String pinCode;

  Map<String, dynamic> toJson() => _$PhoneLoginToJson(this);
}
