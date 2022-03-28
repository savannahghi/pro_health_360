import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/screening_questions_list.dart';

part 'tb_state.g.dart';
part 'tb_state.freezed.dart';

@freezed
class TBState with _$TBState {
  factory TBState({
    @JsonKey(name: 'getScreeningToolQuestions')
        ScreeningQuestionsList? screeningQuestions,
    bool? errorFetchingQuestions,
    bool? timeoutFetchingQuestions,
  }) = _TBState;

  factory TBState.fromJson(Map<String, dynamic> json) =>
      _$TBStateFromJson(json);

  factory TBState.initial() => TBState(
        screeningQuestions: ScreeningQuestionsList.initial(),
        errorFetchingQuestions: false,
        timeoutFetchingQuestions: false,
      );
}
