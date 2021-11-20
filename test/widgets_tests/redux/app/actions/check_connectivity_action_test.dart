// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/check_connectivity_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

void main() {
  test('CheckConnectivityAction', () async {
    final StoreTester<AppState> storeTester =
        StoreTester<AppState>(initialState: AppState.initial());

    expect(storeTester.state.connectivityState?.isConnected, false);

    storeTester.dispatch(CheckConnectivityAction(hasConnection: true));
    final TestInfo<AppState> info =
        await storeTester.wait(CheckConnectivityAction);
    expect(info.state.connectivityState?.isConnected, true);
  });
}
