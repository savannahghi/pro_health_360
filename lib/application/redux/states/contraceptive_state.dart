import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_questions_list.dart';

part 'contraceptive_state.g.dart';
part 'contraceptive_state.freezed.dart';

@freezed
class ContraceptiveState with _$ContraceptiveState {
  factory ContraceptiveState({
    @JsonKey(name: 'getScreeningToolQuestions')
        ScreeningQuestionsList? screeningQuestions,
    bool? errorFetchingQuestions,
    bool? errorAnsweringQuestions,
    bool? timeoutFetchingQuestions,
  }) = _ContraceptiveState;

  factory ContraceptiveState.fromJson(Map<String, dynamic> json) =>
      _$ContraceptiveStateFromJson(json);

  factory ContraceptiveState.initial() => ContraceptiveState(
        screeningQuestions: ScreeningQuestionsList.initial(),
        errorFetchingQuestions: false,
        timeoutFetchingQuestions: false,
        errorAnsweringQuestions: false,
      );
}
