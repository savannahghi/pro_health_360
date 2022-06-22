import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_question.dart';

part 'screening_questions_list.freezed.dart';
part 'screening_questions_list.g.dart';

@freezed
class ScreeningQuestionsList with _$ScreeningQuestionsList {
  factory ScreeningQuestionsList({
    @JsonKey(name: 'getScreeningToolQuestions')
        List<ScreeningQuestion>? screeningQuestionsList,
  }) = _ScreeningQuestionsList;

  factory ScreeningQuestionsList.fromJson(Map<String, dynamic> json) =>
      _$ScreeningQuestionsListFromJson(json);

  factory ScreeningQuestionsList.initial() =>
      ScreeningQuestionsList(screeningQuestionsList: <ScreeningQuestion>[]);
}
