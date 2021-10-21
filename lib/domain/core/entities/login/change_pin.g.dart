// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePIN _$ChangePINFromJson(Map<String, dynamic> json) {
  return ChangePIN(
    createPIN: json['createPIN'] as String?,
    confirmPIN: json['confirmPIN'] as String?,
    invalidCredentials: json['invalidCredentials'] as bool,
  );
}

Map<String, dynamic> _$ChangePINToJson(ChangePIN instance) => <String, dynamic>{
      'createPIN': instance.createPIN,
      'confirmPIN': instance.confirmPIN,
      'invalidCredentials': instance.invalidCredentials,
    };
