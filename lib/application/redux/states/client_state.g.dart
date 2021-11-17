// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientState _$_$_ClientStateFromJson(Map<String, dynamic> json) {
  return _$_ClientState(
    clientProfile: json['clientProfile'] == null
        ? null
        : ClientProfile.fromJson(json['clientProfile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ClientStateToJson(_$_ClientState instance) =>
    <String, dynamic>{
      'clientProfile': instance.clientProfile,
    };
