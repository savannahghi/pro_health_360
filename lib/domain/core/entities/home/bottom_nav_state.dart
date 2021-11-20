// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_nav_state.g.dart';
part 'bottom_nav_state.freezed.dart';

@freezed
class BottomNavigationState with _$BottomNavigationState {
  factory BottomNavigationState({int? currentBottomNavIndex}) =
      _BottomNavigationState;

  factory BottomNavigationState.fromJson(Map<String, dynamic> json) =>
      _$BottomNavigationStateFromJson(json);

  factory BottomNavigationState.initial() =>
      BottomNavigationState(currentBottomNavIndex: 0);
}
