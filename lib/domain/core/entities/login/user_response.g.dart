// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserResponse _$$_UserResponseFromJson(Map<String, dynamic> json) =>
    _$_UserResponse(
      credentials: json['credentials'] == null
          ? null
          : AuthCredentials.fromJson(
              json['credentials'] as Map<String, dynamic>),
      clientState: json['clientProfile'] == null
          ? null
          : ClientState.fromJson(json['clientProfile'] as Map<String, dynamic>),
      streamToken: json['getStreamToken'] as String?,
    );

Map<String, dynamic> _$$_UserResponseToJson(_$_UserResponse instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
      'clientProfile': instance.clientState,
      'getStreamToken': instance.streamToken,
    };
