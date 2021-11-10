// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class BottomNavViewModel extends Vm {
  final int currentIndex;

  BottomNavViewModel({required this.currentIndex})
      : super(
          equals: <Object?>[
            currentIndex,
          ],
        );

  static BottomNavViewModel fromStore(Store<AppState> store) {
    return BottomNavViewModel(
      currentIndex:
          store.state.miscState?.bottomNavObj?.currentBottomNavIndex ?? 0,
    );
  }
}
