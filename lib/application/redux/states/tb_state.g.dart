// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tb_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TBState _$$_TBStateFromJson(Map<String, dynamic> json) => _$_TBState(
      screeningQuestions: (json['screeningQuestions'] as List<dynamic>?)
          ?.map((e) => ScreeningQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingContent: json['errorFetchingContent'] as bool?,
      timeoutFetchingContent: json['timeoutFetchingContent'] as bool?,
    );

Map<String, dynamic> _$$_TBStateToJson(_$_TBState instance) =>
    <String, dynamic>{
      'screeningQuestions': instance.screeningQuestions,
      'errorFetchingContent': instance.errorFetchingContent,
      'timeoutFetchingContent': instance.timeoutFetchingContent,
    };
