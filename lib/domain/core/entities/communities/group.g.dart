// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      id: json['id'] as String?,
      messagingID: json['cid'] as String?,
      name: json['name'] as String?,
      disabled: json['disabled'] as bool?,
      memberCount: json['memberCount'] as int?,
      avatar: json['avatar'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      gender: (json['gender'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$GenderEnumMap, e))
          .toList(),
      clientType: (json['clientType'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ClientTypeEnumMap, e))
          .toList(),
      inviteOnly: json['inviteOnly'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) => <String, dynamic>{
      'id': instance.id,
      'cid': instance.messagingID,
      'name': instance.name,
      'disabled': instance.disabled,
      'memberCount': instance.memberCount,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'gender': instance.gender?.map((e) => _$GenderEnumMap[e]).toList(),
      'clientType':
          instance.clientType?.map((e) => _$ClientTypeEnumMap[e]).toList(),
      'inviteOnly': instance.inviteOnly,
      'description': instance.description,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
  Gender.unknown: 'unknown',
};

const _$ClientTypeEnumMap = {
  ClientType.PMTCT: 'PMTCT',
  ClientType.OVC: 'OVC',
  ClientType.OTZ: 'OTZ',
  ClientType.OTZ_PLUS: 'OTZ_PLUS',
  ClientType.HVL: 'HVL',
  ClientType.DREAMS: 'DREAMS',
  ClientType.HIGH_RISK: 'HIGH_RISK',
  ClientType.SPOUSES: 'SPOUSES',
  ClientType.YOUTH: 'YOUTH',
  ClientType.UNKNOWN: 'UNKNOWN',
};
