// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violence_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolenceState _$$_ViolenceStateFromJson(Map<String, dynamic> json) =>
    _$_ViolenceState(
      screeningQuestions: (json['screeningQuestions'] as List<dynamic>?)
          ?.map((e) => ScreeningQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingContent: json['errorFetchingContent'] as bool?,
      timeoutFetchingContent: json['timeoutFetchingContent'] as bool?,
    );

Map<String, dynamic> _$$_ViolenceStateToJson(_$_ViolenceState instance) =>
    <String, dynamic>{
      'screeningQuestions': instance.screeningQuestions,
      'errorFetchingContent': instance.errorFetchingContent,
      'timeoutFetchingContent': instance.timeoutFetchingContent,
    };
