// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$_$_UserStateFromJson(Map<String, dynamic> json) {
  return _$_UserState(
    clientState: json['clientState'] == null
        ? null
        : ClientState.fromJson(json['clientState'] as Map<String, dynamic>),
    authState: json['authState'] == null
        ? null
        : AuthState.fromJson(json['authState'] as Map<String, dynamic>),
    confidentialState: json['confidentialState'] == null
        ? null
        : ConfidentialState.fromJson(
            json['confidentialState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'clientState': instance.clientState,
      'authState': instance.authState,
      'confidentialState': instance.confidentialState,
    };
