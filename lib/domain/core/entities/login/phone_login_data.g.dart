// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneLoginData _$_$_PhoneLoginDataFromJson(Map<String, dynamic> json) {
  return _$_PhoneLoginData(
    loginData: json['login'] == null
        ? null
        : LoginData.fromJson(json['login'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PhoneLoginDataToJson(_$_PhoneLoginData instance) =>
    <String, dynamic>{
      'login': instance.loginData,
    };
