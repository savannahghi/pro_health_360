// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_login.freezed.dart';
part 'phone_login.g.dart';

@freezed
class PhoneLogin with _$PhoneLogin {
  factory PhoneLogin({
    @Default(false) bool invalidCredentials,
    String? phoneNumber,
    String? pinCode,
  }) = _PhoneLogin;

  factory PhoneLogin.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginFromJson(json);

  factory PhoneLogin.initial() => PhoneLogin(
        phoneNumber: UNKNOWN,
        pinCode: UNKNOWN,
      );
}
