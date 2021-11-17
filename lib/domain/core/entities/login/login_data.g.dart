// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginData _$_$_LoginDataFromJson(Map<String, dynamic> json) {
  return _$_LoginData(
    code: json['code'] as String?,
    message: json['message'] as String?,
    credentials: json['credentials'] == null
        ? null
        : AuthCredentials.fromJson(json['credentials'] as Map<String, dynamic>),
    clientProfile: json['clientProfile'] == null
        ? null
        : ClientProfile.fromJson(json['clientProfile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_LoginDataToJson(_$_LoginData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'credentials': instance.credentials,
      'clientProfile': instance.clientProfile,
    };
