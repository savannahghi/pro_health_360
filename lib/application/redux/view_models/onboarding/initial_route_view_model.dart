import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

class InitialRouteViewModel extends Vm {
  InitialRouteViewModel({this.initialRoute})
      : super(equals: <Object?>[initialRoute]);

  final String? initialRoute;

  factory InitialRouteViewModel.fromStore(AppState state) {
    return InitialRouteViewModel(initialRoute: state.miscState?.initalRoute);
  }
}
