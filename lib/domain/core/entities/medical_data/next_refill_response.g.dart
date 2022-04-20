// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_refill_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NextRefillResponse _$$_NextRefillResponseFromJson(
        Map<String, dynamic> json) =>
    _$_NextRefillResponse(
      data: json['data'] == null
          ? null
          : NextRefillData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NextRefillResponseToJson(
        _$_NextRefillResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
