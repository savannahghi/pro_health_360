// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_login_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneLoginState _$$_PhoneLoginStateFromJson(Map<String, dynamic> json) =>
    _$_PhoneLoginState(
      invalidCredentials: json['invalidCredentials'] as bool? ?? false,
      phoneNumber: json['phoneNumber'] as String?,
      pinCode: json['pinCode'] as String?,
      failedLoginCount: json['failedLoginCount'] as int?,
    );

Map<String, dynamic> _$$_PhoneLoginStateToJson(_$_PhoneLoginState instance) =>
    <String, dynamic>{
      'invalidCredentials': instance.invalidCredentials,
      'phoneNumber': instance.phoneNumber,
      'pinCode': instance.pinCode,
      'failedLoginCount': instance.failedLoginCount,
    };
