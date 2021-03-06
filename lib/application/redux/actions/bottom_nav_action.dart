// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';

class BottomNavAction extends ReduxAction<AppState> {
  BottomNavAction({required this.currentBottomNavIndex});

  final int currentBottomNavIndex;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      bottomNavigationState: state.bottomNavigationState
          ?.copyWith(currentBottomNavIndex: currentBottomNavIndex),
    );

    return newState;
  }
}
