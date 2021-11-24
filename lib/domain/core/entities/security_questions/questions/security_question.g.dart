// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SecurityQuestion _$_$_SecurityQuestionFromJson(Map<String, dynamic> json) {
  return _$_SecurityQuestion(
    securityQuestionID: json['SecurityQuestionID'] as String?,
    questionStem: json['QuestionStem'] as String?,
    description: json['Description'] as String?,
    responseType: _$enumDecodeNullable(
            _$SecurityQuestionResponseTypeEnumMap, json['ResponseType']) ??
        SecurityQuestionResponseType.UNKNOWN,
    active: json['Active'] as bool?,
  );
}

Map<String, dynamic> _$_$_SecurityQuestionToJson(
        _$_SecurityQuestion instance) =>
    <String, dynamic>{
      'SecurityQuestionID': instance.securityQuestionID,
      'QuestionStem': instance.questionStem,
      'Description': instance.description,
      'ResponseType':
          _$SecurityQuestionResponseTypeEnumMap[instance.responseType],
      'Active': instance.active,
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

const _$SecurityQuestionResponseTypeEnumMap = {
  SecurityQuestionResponseType.NUMBER: 'NUMBER',
  SecurityQuestionResponseType.TEXT: 'TEXT',
  SecurityQuestionResponseType.DATE: 'DATE',
  SecurityQuestionResponseType.UNKNOWN: 'UNKNOWN',
};
