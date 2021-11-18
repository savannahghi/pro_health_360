// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    addressType:
        _$enumDecodeNullable(_$AddressTypeEnumMap, json['addressType']),
    text: json['text'] as String?,
    country: json['country'] as String?,
    postalCode: json['postalCode'] as String?,
    county: json['county'] as String?,
    active: json['active'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'addressType': _$AddressTypeEnumMap[instance.addressType],
      'text': instance.text,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'county': instance.county,
      'active': instance.active,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$AddressTypeEnumMap = {
  AddressType.POSTAL: 'POSTAL',
  AddressType.PHYSICAL: 'PHYSICAL',
  AddressType.BOTH: 'BOTH',
  AddressType.UNKNOWN: 'UNKNOWN',
};
