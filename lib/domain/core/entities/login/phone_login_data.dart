import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/login/login_data.dart';

part 'phone_login_data.freezed.dart';
part 'phone_login_data.g.dart';

@freezed
class PhoneLoginData with _$PhoneLoginData {
  factory PhoneLoginData({
    @JsonKey(name: 'login') LoginData? loginData,
  }) = _PhoneLoginData;

  factory PhoneLoginData.fromJson(Map<String, dynamic> json) =>
      _$PhoneLoginDataFromJson(json);
}
