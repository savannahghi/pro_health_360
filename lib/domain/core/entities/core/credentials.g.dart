// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Credentials _$_$_CredentialsFromJson(Map<String, dynamic> json) {
  return _$_Credentials(
    clientProfile: json['clientProfile'] == null
        ? null
        : ClientProfile.fromJson(json['clientProfile'] as Map<String, dynamic>),
    authCredentials: json['authCredentials'] == null
        ? null
        : AuthCredentials.fromJson(
            json['authCredentials'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_CredentialsToJson(_$_Credentials instance) =>
    <String, dynamic>{
      'clientProfile': instance.clientProfile,
      'authCredentials': instance.authCredentials,
    };
