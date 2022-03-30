// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alcohol_substance_use_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlcoholSubstanceUseState _$$_AlcoholSubstanceUseStateFromJson(
        Map<String, dynamic> json) =>
    _$_AlcoholSubstanceUseState(
      screeningQuestions: json['getScreeningToolQuestions'] == null
          ? null
          : ScreeningQuestionsList.fromJson(
              json['getScreeningToolQuestions'] as Map<String, dynamic>),
      errorFetchingQuestions: json['errorFetchingQuestions'] as bool?,
      timeoutFetchingQuestions: json['timeoutFetchingQuestions'] as bool?,
      errorAnsweringQuestions: json['errorAnsweringQuestions'] as bool?,
    );

Map<String, dynamic> _$$_AlcoholSubstanceUseStateToJson(
        _$_AlcoholSubstanceUseState instance) =>
    <String, dynamic>{
      'getScreeningToolQuestions': instance.screeningQuestions,
      'errorFetchingQuestions': instance.errorFetchingQuestions,
      'timeoutFetchingQuestions': instance.timeoutFetchingQuestions,
      'errorAnsweringQuestions': instance.errorAnsweringQuestions,
    };
