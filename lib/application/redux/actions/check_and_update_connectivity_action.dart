// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_connectivity_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/infrastructure/connectivity/connectivity_interface.dart';

class CheckAndUpdateConnectivityAction extends ReduxAction<AppState> {
  CheckAndUpdateConnectivityAction({required this.connectivityChecker});

  final ConnectivityChecker connectivityChecker;

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = await connectivityChecker.checkConnection();

    dispatch(UpdateConnectivityAction(hasConnection: hasConnection));

    return null;
  }
}
