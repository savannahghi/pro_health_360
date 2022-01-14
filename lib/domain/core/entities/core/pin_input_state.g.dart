// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_input_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PINInputState _$_$_PINInputStateFromJson(Map<String, dynamic> json) {
  return _$_PINInputState(
    healthPagePINInputTime: json['healthPagePINInputTime'] as String?,
    pinInputTries: json['pinInputTries'] as int?,
    maxTryTime: json['maxTryTime'] as String?,
    pinVerified: json['pinVerified'] as bool?,
  );
}

Map<String, dynamic> _$_$_PINInputStateToJson(_$_PINInputState instance) =>
    <String, dynamic>{
      'healthPagePINInputTime': instance.healthPagePINInputTime,
      'pinInputTries': instance.pinInputTries,
      'maxTryTime': instance.maxTryTime,
      'pinVerified': instance.pinVerified,
    };
