// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_input_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PINInputState _$_$_PINInputStateFromJson(Map<String, dynamic> json) {
  return _$_PINInputState(
    healthPagePINInputTime: json['healthPagePINInputTime'] as String?,
    tries: json['tries'] as int?,
    maxTryTime: json['maxTryTime'] as String?,
  );
}

Map<String, dynamic> _$_$_PINInputStateToJson(_$_PINInputState instance) =>
    <String, dynamic>{
      'healthPagePINInputTime': instance.healthPagePINInputTime,
      'tries': instance.tries,
      'maxTryTime': instance.maxTryTime,
    };
