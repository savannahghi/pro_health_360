// Flutter imports:

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/health_diary_state.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';

class UpdateHealthDiaryStateActon extends ReduxAction<AppState> {
  UpdateHealthDiaryStateActon({
    this.diaryEntries,
    this.errorFetchingDiaryEntries,
    this.timeoutFetchingEntries,
    this.shouldNotShareHealthRecord,
    this.shouldShareHealthRecord,
  });

  final List<HealthDiaryEntry?>? diaryEntries;
  final bool? errorFetchingDiaryEntries;
  final bool? timeoutFetchingEntries;
  final bool? shouldShareHealthRecord;
  final bool? shouldNotShareHealthRecord;

  @override
  Future<AppState> reduce() async {
    final HealthDiaryState? diaryState =
        state.clientState?.healthDiaryState?.copyWith.call(
      entries: diaryEntries ?? state.clientState?.healthDiaryState?.entries,
      errorFetchingDiaryEntries: errorFetchingDiaryEntries ??
          state.clientState?.healthDiaryState?.errorFetchingDiaryEntries,
      timeoutFetchingDiaryEntries: timeoutFetchingEntries ??
          state.clientState?.healthDiaryState?.timeoutFetchingDiaryEntries,
      shouldShareHealthRecord: shouldShareHealthRecord ??
          state.clientState?.healthDiaryState?.shouldShareHealthRecord,
      shouldNotShareHealthRecord: shouldNotShareHealthRecord ??
          state.clientState?.healthDiaryState?.shouldNotShareHealthRecord,
    );

    final AppState newState = state.copyWith.call(
      clientState:
          state.clientState?.copyWith.call(healthDiaryState: diaryState),
    );

    return newState;
  }
}
