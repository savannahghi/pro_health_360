// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SecurityQuestion _$_$_SecurityQuestionFromJson(Map<String, dynamic> json) {
  return _$_SecurityQuestion(
    securityQuestionID: json['securityQuestionID'] as String,
    active: json['active'] as bool,
    description: json['description'] as String,
    flavour: _$enumDecode(_$FlavourEnumMap, json['flavour']),
    questionStem: json['questionStem'] as String,
    responseType: json['responseType'] as String,
  );
}

Map<String, dynamic> _$_$_SecurityQuestionToJson(
        _$_SecurityQuestion instance) =>
    <String, dynamic>{
      'securityQuestionID': instance.securityQuestionID,
      'active': instance.active,
      'description': instance.description,
      'flavour': _$FlavourEnumMap[instance.flavour],
      'questionStem': instance.questionStem,
      'responseType': instance.responseType,
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

const _$FlavourEnumMap = {
  Flavour.CONSUMER: 'CONSUMER',
  Flavour.PRO: 'PRO',
  Flavour.UNKNOWN: 'UNKNOWN',
};
