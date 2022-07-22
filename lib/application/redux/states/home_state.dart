// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    bool? canRecordMood,
    bool? createHealthDiaryEntry,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);

  factory HomeState.initial() => HomeState(
        canRecordMood: true,
        createHealthDiaryEntry: false,

        ///   - RecentContentState
        ///   - SuggestedGroupsState
      );
}
