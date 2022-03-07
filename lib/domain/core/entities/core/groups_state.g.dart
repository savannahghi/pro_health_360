// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupState _$$_GroupStateFromJson(Map<String, dynamic> json) =>
    _$_GroupState(
      recommendedGroups: (json['recommendedCommunities'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GroupStateToJson(_$_GroupState instance) =>
    <String, dynamic>{
      'recommendedCommunities': instance.recommendedGroups,
    };
