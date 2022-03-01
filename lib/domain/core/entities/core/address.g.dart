// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      addressType:
          $enumDecodeNullable(_$AddressTypeEnumMap, json['addressType']),
      text: json['text'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      county: json['county'] as String?,
      active: json['active'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'addressType': _$AddressTypeEnumMap[instance.addressType],
      'text': instance.text,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'county': instance.county,
      'active': instance.active,
    };

const _$AddressTypeEnumMap = {
  AddressType.POSTAL: 'POSTAL',
  AddressType.PHYSICAL: 'PHYSICAL',
  AddressType.BOTH: 'BOTH',
  AddressType.UNKNOWN: 'UNKNOWN',
};
