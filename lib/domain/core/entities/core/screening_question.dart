import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_question.freezed.dart';
part 'screening_question.g.dart';

@freezed
class ScreeningQuestion with _$ScreeningQuestion {
  factory ScreeningQuestion({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'question') String? questionText,
    @JsonKey(name: 'answer') String? answer,
    @JsonKey(name: 'toolType') String? toolType,
    @JsonKey(name: 'sequence') int? sequence,
    @JsonKey(name: 'responseChoices') Map<String, dynamic>? responseChoices,
    @JsonKey(name: 'meta') Map<String, dynamic>? meta,
  }) = _ScreeningQuestion;

  factory ScreeningQuestion.fromJson(Map<String, dynamic> json) =>
      _$ScreeningQuestionFromJson(json);

  factory ScreeningQuestion.initial() => ScreeningQuestion(
        id: UNKNOWN,
        questionText: UNKNOWN,
        toolType: UNKNOWN,
        meta: <String, dynamic>{},
        responseChoices: <String, dynamic>{},
        sequence: 0,
        answer: UNKNOWN,
      );
}
