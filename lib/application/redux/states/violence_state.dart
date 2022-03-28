import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/screening_question.dart';

part 'violence_state.g.dart';
part 'violence_state.freezed.dart';

@freezed
class ViolenceState with _$ViolenceState {
  factory ViolenceState({
    @JsonKey(name: 'screeningQuestions')
        List<ScreeningQuestion>? screeningQuestions,
    bool? errorFetchingContent,
    bool? timeoutFetchingContent,
  }) = _ViolenceState;

  factory ViolenceState.fromJson(Map<String, dynamic> json) =>
      _$ViolenceStateFromJson(json);

  factory ViolenceState.initial() => ViolenceState(
        screeningQuestions: <ScreeningQuestion>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
      );
}
