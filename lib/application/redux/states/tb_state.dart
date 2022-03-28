import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/screening_question.dart';

part 'tb_state.g.dart';
part 'tb_state.freezed.dart';

@freezed
class TBState with _$TBState {
  factory TBState({
    @JsonKey(name: 'screeningQuestions')
        List<ScreeningQuestion>? screeningQuestions,
         bool? errorFetchingContent,
    bool? timeoutFetchingContent,
  }) = _TBState;

  factory TBState.fromJson(Map<String, dynamic> json) =>
      _$TBStateFromJson(json);

  factory TBState.initial() => TBState(
        screeningQuestions: <ScreeningQuestion>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
      );
}
