// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TBState _$$_TBStateFromJson(Map<String, dynamic> json) => _$_TBState(
      screeningQuestions: json['getScreeningToolQuestions'] == null
          ? null
          : ScreeningQuestionsList.fromJson(
              json['getScreeningToolQuestions'] as Map<String, dynamic>),
      errorFetchingQuestions: json['errorFetchingQuestions'] as bool?,
      timeoutFetchingQuestions: json['timeoutFetchingQuestions'] as bool?,
    );

Map<String, dynamic> _$$_TBStateToJson(_$_TBState instance) =>
    <String, dynamic>{
      'getScreeningToolQuestions': instance.screeningQuestions,
      'errorFetchingQuestions': instance.errorFetchingQuestions,
      'timeoutFetchingQuestions': instance.timeoutFetchingQuestions,
    };
