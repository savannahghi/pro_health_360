// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneLoginResponse _$_$_PhoneLoginResponseFromJson(
    Map<String, dynamic> json) {
  return _$_PhoneLoginResponse(
    phoneLoginData: json['data'] == null
        ? null
        : PhoneLoginData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PhoneLoginResponseToJson(
        _$_PhoneLoginResponse instance) =>
    <String, dynamic>{
      'data': instance.phoneLoginData,
    };
