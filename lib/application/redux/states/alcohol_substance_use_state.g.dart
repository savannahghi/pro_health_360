// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alcohol_substance_use_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlcoholSubstanceUseState _$$_AlcoholSubstanceUseStateFromJson(
        Map<String, dynamic> json) =>
    _$_AlcoholSubstanceUseState(
      screeningQuestions: (json['screeningQuestions'] as List<dynamic>?)
          ?.map((e) => ScreeningQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingContent: json['errorFetchingContent'] as bool?,
      timeoutFetchingContent: json['timeoutFetchingContent'] as bool?,
    );

Map<String, dynamic> _$$_AlcoholSubstanceUseStateToJson(
        _$_AlcoholSubstanceUseState instance) =>
    <String, dynamic>{
      'screeningQuestions': instance.screeningQuestions,
      'errorFetchingContent': instance.errorFetchingContent,
      'timeoutFetchingContent': instance.timeoutFetchingContent,
    };
