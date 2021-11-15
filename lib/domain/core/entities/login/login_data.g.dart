// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginData _$_$_LoginDataFromJson(Map<String, dynamic> json) {
  return _$_LoginData(
    credentials: json['credentials'] == null
        ? null
        : Credentials.fromJson(json['credentials'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_LoginDataToJson(_$_LoginData instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
    };
