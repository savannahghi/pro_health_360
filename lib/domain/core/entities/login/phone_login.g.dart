// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneLogin _$_$_PhoneLoginFromJson(Map<String, dynamic> json) {
  return _$_PhoneLogin(
    invalidCredentials: json['invalidCredentials'] as bool? ?? false,
    phoneNumber: json['phoneNumber'] as String?,
    pinCode: json['pinCode'] as String?,
  );
}

Map<String, dynamic> _$_$_PhoneLoginToJson(_$_PhoneLogin instance) =>
    <String, dynamic>{
      'invalidCredentials': instance.invalidCredentials,
      'phoneNumber': instance.phoneNumber,
      'pinCode': instance.pinCode,
    };
