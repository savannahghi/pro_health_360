// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'phone_signup.g.dart';

@JsonSerializable()
class PhoneSignUp {
  final bool acceptCommunicationTerms;
  final bool accountCreated;
  final bool accountExists;
  final String? confirmPin;
  final String? createPin;
  final bool invalidCredentials;
  final String? otp;
  final String? phoneNumber;
  PhoneSignUp({
    this.acceptCommunicationTerms = false,
    this.phoneNumber,
    this.accountCreated = false,
    this.accountExists = false,
    this.confirmPin,
    this.createPin,
    this.invalidCredentials = false,
    this.otp,
  });

  factory PhoneSignUp.fromJson(Map<String, dynamic> json) =>
      _$PhoneSignUpFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneSignUpToJson(this);
}
