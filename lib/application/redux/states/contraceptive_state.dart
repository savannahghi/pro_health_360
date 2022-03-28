import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/screening_question.dart';

part 'contraceptive_state.g.dart';
part 'contraceptive_state.freezed.dart';

@freezed
class ContraceptiveState with _$ContraceptiveState {
  factory ContraceptiveState({
    @JsonKey(name: 'screeningQuestions')
        List<ScreeningQuestion>? screeningQuestions,
    bool? errorFetchingContent,
    bool? timeoutFetchingContent,
  }) = _ContraceptiveState;

  factory ContraceptiveState.fromJson(Map<String, dynamic> json) =>
      _$ContraceptiveStateFromJson(json);

  factory ContraceptiveState.initial() => ContraceptiveState(
        screeningQuestions: <ScreeningQuestion>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
      );
}
