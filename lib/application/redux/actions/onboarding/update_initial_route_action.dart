// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/misc_state.dart';

class UpdateInitialRouteAction extends ReduxAction<AppState> {
  UpdateInitialRouteAction({required this.initialRoute});

  final String initialRoute;

  @override
  AppState reduce() {
    final MiscState? newMiscState =
        state.miscState?.copyWith(initialRoute: initialRoute);

    return state.copyWith(miscState: newMiscState ?? state.miscState);
  }
}
