// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class BottomNavAction extends ReduxAction<MainAppState> {
  BottomNavAction({required this.currentBottomNavIndex});

  final int currentBottomNavIndex;

  @override
  MainAppState reduce() {
    final MainAppState newState = state.copyWith.bottomNavigationState!
        .call(currentBottomNavIndex: currentBottomNavIndex);

    return newState;
  }
}
