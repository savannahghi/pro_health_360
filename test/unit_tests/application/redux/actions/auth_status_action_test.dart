// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

void main() {
  group('AuthStatusAction', () {
    test('should update credentials state', () async {
      final StoreTester<AppState> storeTester =
          StoreTester<AppState>(initialState: AppState.initial());

      storeTester.dispatch(AuthStatusAction(expiresIn: '3400'));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(AuthStatusAction);

      expect(info.state.credentials?.expiresIn, '3400');
    });

    test('should return null', () async {
      final StoreTester<AppState> storeTester =
          StoreTester<AppState>(initialState: AppState.initial());

      storeTester.dispatch(AuthStatusAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(AuthStatusAction);

      expect(info.state.credentials?.expiresIn, UNKNOWN);
    });
  });
}
