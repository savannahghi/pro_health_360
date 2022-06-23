import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_questions_list.dart';

part 'alcohol_substance_use_state.g.dart';
part 'alcohol_substance_use_state.freezed.dart';

@freezed
class AlcoholSubstanceUseState with _$AlcoholSubstanceUseState {
  factory AlcoholSubstanceUseState({
    @JsonKey(name: 'getScreeningToolQuestions')
        ScreeningQuestionsList? screeningQuestions,
    bool? errorFetchingQuestions,
    bool? timeoutFetchingQuestions,
    bool? errorAnsweringQuestions,
  }) = _AlcoholSubstanceUseState;

  factory AlcoholSubstanceUseState.fromJson(Map<String, dynamic> json) =>
      _$AlcoholSubstanceUseStateFromJson(json);

  factory AlcoholSubstanceUseState.initial() => AlcoholSubstanceUseState(
        screeningQuestions: ScreeningQuestionsList.initial(),
        errorFetchingQuestions: false,
        timeoutFetchingQuestions: false,
        errorAnsweringQuestions: false,
      );
}
