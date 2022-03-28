import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/screening_questions_list.dart';

part 'violence_state.g.dart';
part 'violence_state.freezed.dart';

@freezed
class ViolenceState with _$ViolenceState {
  factory ViolenceState({
    @JsonKey(name: 'getScreeningToolQuestions')
        ScreeningQuestionsList? screeningQuestions,
    bool? errorFetchingQuestions,
    bool? timeoutFetchingQuestions,
  }) = _ViolenceState;

  factory ViolenceState.fromJson(Map<String, dynamic> json) =>
      _$ViolenceStateFromJson(json);

  factory ViolenceState.initial() => ViolenceState(
        screeningQuestions: ScreeningQuestionsList.initial(),
        errorFetchingQuestions: false,
        timeoutFetchingQuestions: false,
      );
}
