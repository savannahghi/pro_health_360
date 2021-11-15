// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthCredentials _$_$_AuthCredentialsFromJson(Map<String, dynamic> json) {
  return _$_AuthCredentials(
    expiresIn: json['expiresIn'] as String?,
    idToken: json['idToken'] as String?,
    refreshToken: json['refreshToken'] as String?,
  );
}

Map<String, dynamic> _$_$_AuthCredentialsToJson(_$_AuthCredentials instance) =>
    <String, dynamic>{
      'expiresIn': instance.expiresIn,
      'idToken': instance.idToken,
      'refreshToken': instance.refreshToken,
    };
