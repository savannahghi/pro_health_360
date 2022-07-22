// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/quote.dart';

class HealthDiaryViewModel extends Vm {
  HealthDiaryViewModel({
    this.wait,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
    this.diaryEntries,
    required this.quotes,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingContent,
            timeoutFetchingContent,
            diaryEntries,
            quotes,
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
      quotes:
          state.clientState!.healthDiaryState?.quoteState?.quotes ?? <Quote>[],
    );
  }

  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;
  final List<HealthDiaryEntry?>? diaryEntries;
  final List<Quote> quotes;
  final Wait? wait;
}
