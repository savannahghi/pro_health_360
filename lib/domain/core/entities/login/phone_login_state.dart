// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_login_state.freezed.dart';
part 'phone_login_state.g.dart';

@freezed
class PhoneLoginState with _$PhoneLoginState {
  factory PhoneLoginState({
    @Default(false) bool invalidCredentials,
    String? phoneNumber,
    String? pinCode,
  }) = _PhoneLoginState;

  factory PhoneLoginState.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginStateFromJson(json);

  factory PhoneLoginState.initial() => PhoneLoginState(
        phoneNumber: UNKNOWN,
        pinCode: UNKNOWN,
      );
}
