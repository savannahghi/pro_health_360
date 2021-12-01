import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';

part 'health_diary_state.freezed.dart';
part 'health_diary_state.g.dart';

@freezed
class HealthDiaryState with _$HealthDiaryState {
  factory HealthDiaryState({
    @JsonKey(name: 'getClientHealthDiaryEntries')
        List<HealthDiaryEntry?>? entries,
    bool? errorFetchingDiaryEntries,
    bool? timeoutFetchingDiaryEntries,
  }) = _HealthDiaryState;

  factory HealthDiaryState.fromJson(Map<String, dynamic> json) =>
      _$HealthDiaryStateFromJson(json);

  factory HealthDiaryState.initial() => HealthDiaryState(
        entries: <HealthDiaryEntry>[],
        errorFetchingDiaryEntries: false,
        timeoutFetchingDiaryEntries: false,
      );
}
