import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/actions/send_content_engagement_time_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/connectivity_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_events.dart';

import '../../../../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SendContentEngagementTimeAction', () {
    final List<MethodCall> methodCallLog = <MethodCall>[];
    final Store<AppState> store = Store<AppState>(
      initialState: AppState.initial()
          .copyWith(connectivityState: ConnectivityState(isConnected: true)),
    );

    setUp(() async {
      setupFirebaseAnalyticsMocks(
        updateLogFunc: (MethodCall call) => methodCallLog.add(call),
      );

      await Firebase.initializeApp();
    });

    test('saves content interaction time', () async {
      await store.dispatch(SendContentEngagementTimeAction());

      expect(methodCallLog.first.method, 'Analytics#logEvent');
      expect(
        methodCallLog.first.arguments['eventName'],
        contentInteractionTimeEvent,
      );
      expect(
        methodCallLog.first.arguments['parameters'],
        isNotNull,
      );
    });
  });
}
