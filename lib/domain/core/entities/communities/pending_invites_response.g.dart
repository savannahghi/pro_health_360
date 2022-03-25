// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_invites_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PendingInvites _$$_PendingInvitesFromJson(Map<String, dynamic> json) =>
    _$_PendingInvites(
      communities: (json['communities'] as List<dynamic>?)
          ?.map((e) => Community.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PendingInvitesToJson(_$_PendingInvites instance) =>
    <String, dynamic>{
      'communities': instance.communities,
    };
