// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_obj.dart';

class BottomNavAction extends ReduxAction<AppState> {
  BottomNavAction({required this.currentBottomNavIndex});

  final int currentBottomNavIndex;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.miscState!.call(
        bottomNavObj:
            BottomNavObj(currentBottomNavIndex: currentBottomNavIndex));
    return newState;
  }
}
