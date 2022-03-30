// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningQuestion _$$_ScreeningQuestionFromJson(Map<String, dynamic> json) =>
    _$_ScreeningQuestion(
      id: json['id'] as String?,
      questionText: json['question'] as String?,
      answer: json['answer'] as String?,
      toolType: json['toolType'] as String?,
      sequence: json['sequence'] as int?,
      responseChoices: json['responseChoices'] as Map<String, dynamic>?,
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_ScreeningQuestionToJson(
        _$_ScreeningQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.questionText,
      'answer': instance.answer,
      'toolType': instance.toolType,
      'sequence': instance.sequence,
      'responseChoices': instance.responseChoices,
      'meta': instance.meta,
    };
