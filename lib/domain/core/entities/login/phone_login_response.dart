import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_data.dart';

part 'phone_login_response.freezed.dart';
part 'phone_login_response.g.dart';

@freezed
class PhoneLoginResponse with _$PhoneLoginResponse {
  factory PhoneLoginResponse({
    @JsonKey(name: 'data') PhoneLoginData? phoneLoginData,
  }) = _PhoneLoginResponse;

  factory PhoneLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginResponseFromJson(json);
}
