// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_questions_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningQuestionsList _$$_ScreeningQuestionsListFromJson(
        Map<String, dynamic> json) =>
    _$_ScreeningQuestionsList(
      screeningQuestionsList: (json['getScreeningToolQuestions']
              as List<dynamic>?)
          ?.map((e) => ScreeningQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScreeningQuestionsListToJson(
        _$_ScreeningQuestionsList instance) =>
    <String, dynamic>{
      'getScreeningToolQuestions': instance.screeningQuestionsList,
    };
