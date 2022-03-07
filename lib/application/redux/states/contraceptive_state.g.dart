// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contraceptive_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContraceptiveState _$$_ContraceptiveStateFromJson(
        Map<String, dynamic> json) =>
    _$_ContraceptiveState(
      screeningQuestions: (json['screeningQuestions'] as List<dynamic>?)
          ?.map((e) => ScreeningQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingContent: json['errorFetchingContent'] as bool?,
      timeoutFetchingContent: json['timeoutFetchingContent'] as bool?,
    );

Map<String, dynamic> _$$_ContraceptiveStateToJson(
        _$_ContraceptiveState instance) =>
    <String, dynamic>{
      'screeningQuestions': instance.screeningQuestions,
      'errorFetchingContent': instance.errorFetchingContent,
      'timeoutFetchingContent': instance.timeoutFetchingContent,
    };
