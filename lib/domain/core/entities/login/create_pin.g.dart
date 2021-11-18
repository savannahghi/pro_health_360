// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_pin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePINState _$CreatePINStateFromJson(Map<String, dynamic> json) {
  return CreatePINState(
    newPIN: json['newPIN'] as String?,
    confirmPIN: json['confirmPIN'] as String?,
  );
}

Map<String, dynamic> _$CreatePINStateToJson(CreatePINState instance) =>
    <String, dynamic>{
      'newPIN': instance.newPIN,
      'confirmPIN': instance.confirmPIN,
    };
