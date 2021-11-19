// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SecurityQuestion _$_$_SecurityQuestionFromJson(Map<String, dynamic> json) {
  return _$_SecurityQuestion(
    id: json['id'] as String?,
    questionStem: json['questionStem'] as String?,
    description: json['description'] as String?,
    responseType: json['responseType'] as String?,
    flavour: json['flavour'] as String?,
    active: json['active'] as bool? ?? false,
    sequence: json['sequence'] as int?,
  );
}

Map<String, dynamic> _$_$_SecurityQuestionToJson(
        _$_SecurityQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionStem': instance.questionStem,
      'description': instance.description,
      'responseType': instance.responseType,
      'flavour': instance.flavour,
      'active': instance.active,
      'sequence': instance.sequence,
    };
