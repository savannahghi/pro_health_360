// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_pin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePIN _$CreatePINFromJson(Map<String, dynamic> json) {
  return CreatePIN(
    newPIN: json['newPIN'] as String?,
    confirmPIN: json['confirmPIN'] as String?,
  );
}

Map<String, dynamic> _$CreatePINToJson(CreatePIN instance) => <String, dynamic>{
      'newPIN': instance.newPIN,
      'confirmPIN': instance.confirmPIN,
    };
