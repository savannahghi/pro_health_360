import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';

part 'credentials.freezed.dart';
part 'credentials.g.dart';

@freezed
class Credentials with _$Credentials {
  factory Credentials({
    @JsonKey(name: 'clientProfile') ClientProfile? clientProfile,
    @JsonKey(name: 'authCredentials') AuthCredentials? authCredentials,
  }) = _Credentials;

  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);
}
