// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/home_state.dart';

class UpdateHomeStateAction extends ReduxAction<AppState> {
  UpdateHomeStateAction({
    this.canRecordMood,
    this.createHealthDiaryEntry,
  });

  bool? canRecordMood;
  bool? createHealthDiaryEntry;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      homeState: HomeState(
        canRecordMood: canRecordMood ?? state.homeState?.canRecordMood,
        createHealthDiaryEntry:
            createHealthDiaryEntry ?? state.homeState?.createHealthDiaryEntry,
      ),
    );

    return newState;
  }
}
