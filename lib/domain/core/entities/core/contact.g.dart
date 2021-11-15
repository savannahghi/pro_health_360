// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contact _$_$_ContactFromJson(Map<String, dynamic> json) {
  return _$_Contact(
    active: json['active'] as bool?,
    contact: json['contact'] == null
        ? null
        : PhoneNumber.fromJson(json['contact'] as String),
    contactType:
        _$enumDecodeNullable(_$ContactTypeEnumMap, json['contactType']),
    optedIn: json['optedIn'] as bool?,
  );
}

Map<String, dynamic> _$_$_ContactToJson(_$_Contact instance) =>
    <String, dynamic>{
      'active': instance.active,
      'contact': instance.contact,
      'contactType': _$ContactTypeEnumMap[instance.contactType],
      'optedIn': instance.optedIn,
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

const _$ContactTypeEnumMap = {
  ContactType.PRIMARY: 'PRIMARY',
  ContactType.SECONDARY: 'SECONDARY',
  ContactType.OFFICIAL: 'OFFICIAL',
};
