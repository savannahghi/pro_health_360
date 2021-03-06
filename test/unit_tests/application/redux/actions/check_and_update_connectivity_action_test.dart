// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/application/redux/actions/check_and_update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/infrastructure/connectivity/mobile_connectivity_status.dart';
import '../../../../mocks.dart';

void main() {
  group('CheckAndUpdateConnectivityAction', () {
    test('description', () async {
      final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform();
      ConnectivityPlatform.instance = fakePlatform;

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>(initialState: AppState.initial());

      storeTester.dispatch(
        CheckAndUpdateConnectivityAction(
          connectivityChecker: MobileConnectivityChecker(
            checkInternetCallback: () async => true,
          ),
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckAndUpdateConnectivityAction);

      expect(info.state.connectivityState?.isConnected, true);
    });
  });
}
