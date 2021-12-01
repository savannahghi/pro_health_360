// Flutter imports:

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';

class UpdateHealthDiaryStateActon extends ReduxAction<AppState> {
  UpdateHealthDiaryStateActon({
    this.diaryEntries,
    this.errorFetchingDiaryEntries,
    this.timeoutFetchingEntries,
  });

  final List<HealthDiaryEntry?>? diaryEntries;
  final bool? errorFetchingDiaryEntries;
  final bool? timeoutFetchingEntries;

  @override
  Future<AppState> reduce() async {
    final AppState newState =
        state.copyWith.clientState!.healthDiaryState!.call(
      entries: diaryEntries ?? state.clientState!.healthDiaryState!.entries,
      errorFetchingDiaryEntries: errorFetchingDiaryEntries ??
          state.clientState!.healthDiaryState!.errorFetchingDiaryEntries,
      timeoutFetchingDiaryEntries: timeoutFetchingEntries ??
          state.clientState!.healthDiaryState!.timeoutFetchingDiaryEntries,
    );

    return newState;
  }
}
