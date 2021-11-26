import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/update_connectivity_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/infrastructure/connecitivity/mobile_connectivity_status.dart';

class CheckAndUpdateConnectivityAction extends ReduxAction<AppState> {
  final Future<bool> Function()? checkInternetCallback;

  CheckAndUpdateConnectivityAction({this.checkInternetCallback});

  @override
  Future<AppState?> reduce() async {
    final bool hasConnection = await MobileConnectivityStatus(
      checkInternetCallback: checkInternetCallback,
    ).checkConnection();

    dispatch(UpdateConnectivityAction(hasConnection: hasConnection));

    return null;
  }
}
