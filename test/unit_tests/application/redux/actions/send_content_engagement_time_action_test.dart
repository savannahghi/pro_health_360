import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/actions/send_content_engagement_time_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';

import '../../../../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseAnalyticsMocks();

  group('SendContentEngagementTimeAction', () {
    final Store<AppState> store = Store<AppState>(
      initialState: AppState.initial()
          .copyWith(connectivityState: ConnectivityState(isConnected: true)),
    );

    setUpAll(() async {
      await Firebase.initializeApp();
    });

    setUp(() async {
      methodCallLog.clear();
    });

    tearDown(methodCallLog.clear);

    test('saves content interaction time', () async {
      await store.dispatch(SendContentEngagementTimeAction());

      expect(methodCallLog.first.method, 'Analytics#logEvent');
      expect(
        // ignore: avoid_dynamic_calls
        methodCallLog.first.arguments['eventName'],
        contentInteractionTimeEvent,
      );
      expect(
        // ignore: avoid_dynamic_calls
        methodCallLog.first.arguments['parameters'],
        isNotNull,
      );
    });
  });
}
