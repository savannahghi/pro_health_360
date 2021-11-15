import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/credentials.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
class LoginData with _$LoginData {
  factory LoginData({
    @JsonKey(name: 'credentials') Credentials? credentials,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
