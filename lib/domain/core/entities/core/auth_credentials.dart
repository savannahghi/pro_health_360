import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_credentials.freezed.dart';
part 'auth_credentials.g.dart';

@freezed
class AuthCredentials with _$AuthCredentials {
  factory AuthCredentials({
    String? expiresIn,
    String? idToken,
    String? refreshToken,
  }) = _AuthCredentials;

  factory AuthCredentials.fromJson(Map<String, dynamic> json) =>
      _$AuthCredentialsFromJson(json);
}
