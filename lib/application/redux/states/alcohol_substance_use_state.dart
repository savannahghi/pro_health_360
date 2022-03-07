import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/screening_question.dart';

part 'alcohol_substance_use_state.g.dart';
part 'alcohol_substance_use_state.freezed.dart';

@freezed
class AlcoholSubstanceUseState with _$AlcoholSubstanceUseState {
  factory AlcoholSubstanceUseState({
    @JsonKey(name: 'screeningQuestions')
        List<ScreeningQuestion>? screeningQuestions,
    bool? errorFetchingContent,
    bool? timeoutFetchingContent,
  }) = _AlcoholSubstanceUseState;

  factory AlcoholSubstanceUseState.fromJson(Map<String, dynamic> json) =>
      _$AlcoholSubstanceUseStateFromJson(json);

  factory AlcoholSubstanceUseState.initial() => AlcoholSubstanceUseState(
        screeningQuestions: <ScreeningQuestion>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
      );
}
