// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class InitialRouteViewModel extends Vm {
  InitialRouteViewModel({this.initialRoute, this.currentIndex})
      : super(equals: <Object?>[initialRoute, currentIndex]);

  final String? initialRoute;
  final int? currentIndex;

  factory InitialRouteViewModel.fromStore(AppState state) {
    return InitialRouteViewModel(
      initialRoute: state.miscState?.initialRoute,
      currentIndex: state.bottomNavigationState?.currentBottomNavIndex,
    );
  }
}
