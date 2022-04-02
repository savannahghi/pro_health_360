// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';

class HealthDiaryViewModel extends Vm {
  HealthDiaryViewModel({
    this.wait,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
    this.diaryEntries,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingContent,
            timeoutFetchingContent,
            diaryEntries,
          ],
        );

  factory HealthDiaryViewModel.fromStore(AppState state) {
    return HealthDiaryViewModel(
      wait: state.wait,
      errorFetchingContent:
          state.clientState!.healthDiaryState?.errorFetchingDiaryEntries ??
              false,
      timeoutFetchingContent:
          state.clientState!.healthDiaryState?.timeoutFetchingDiaryEntries ??
              false,
      diaryEntries:
          state.clientState!.healthDiaryState?.entries ?? <HealthDiaryEntry>[],
    );
  }

  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;
  final List<HealthDiaryEntry?>? diaryEntries;
  final Wait? wait;
}
