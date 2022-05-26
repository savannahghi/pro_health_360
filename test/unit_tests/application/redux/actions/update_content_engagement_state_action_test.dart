import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/actions/update_content_engagement_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/connectivity_state.dart';

void main() {
  group('UpdateContentEngagementStateAction', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial()
            .copyWith(connectivityState: ConnectivityState(isConnected: true)),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('should update state correctly', () async {
      storeTester.dispatch(
        UpdateContentEngagementStateAction(contentId: 1),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(UpdateContentEngagementStateAction);

      expect(info.state.contentState!.contentEngagementState!.contentId, 1);
    });
  });
}
