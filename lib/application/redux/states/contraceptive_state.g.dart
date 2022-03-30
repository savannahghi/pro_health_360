// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contraceptive_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContraceptiveState _$$_ContraceptiveStateFromJson(
        Map<String, dynamic> json) =>
    _$_ContraceptiveState(
      screeningQuestions: json['getScreeningToolQuestions'] == null
          ? null
          : ScreeningQuestionsList.fromJson(
              json['getScreeningToolQuestions'] as Map<String, dynamic>),
      errorFetchingQuestions: json['errorFetchingQuestions'] as bool?,
      errorAnsweringQuestions: json['errorAnsweringQuestions'] as bool?,
      timeoutFetchingQuestions: json['timeoutFetchingQuestions'] as bool?,
    );

Map<String, dynamic> _$$_ContraceptiveStateToJson(
        _$_ContraceptiveState instance) =>
    <String, dynamic>{
      'getScreeningToolQuestions': instance.screeningQuestions,
      'errorFetchingQuestions': instance.errorFetchingQuestions,
      'errorAnsweringQuestions': instance.errorAnsweringQuestions,
      'timeoutFetchingQuestions': instance.timeoutFetchingQuestions,
    };
