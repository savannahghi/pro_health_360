// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violence_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolenceState _$$_ViolenceStateFromJson(Map<String, dynamic> json) =>
    _$_ViolenceState(
      screeningQuestions: json['getScreeningToolQuestions'] == null
          ? null
          : ScreeningQuestionsList.fromJson(
              json['getScreeningToolQuestions'] as Map<String, dynamic>),
      errorFetchingQuestions: json['errorFetchingQuestions'] as bool?,
      timeoutFetchingQuestions: json['timeoutFetchingQuestions'] as bool?,
      errorAnsweringQuestions: json['errorAnsweringQuestions'] as bool?,
    );

Map<String, dynamic> _$$_ViolenceStateToJson(_$_ViolenceState instance) =>
    <String, dynamic>{
      'getScreeningToolQuestions': instance.screeningQuestions,
      'errorFetchingQuestions': instance.errorFetchingQuestions,
      'timeoutFetchingQuestions': instance.timeoutFetchingQuestions,
      'errorAnsweringQuestions': instance.errorAnsweringQuestions,
    };
