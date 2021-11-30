import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/actions/onboarding/check_token_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import '../../../../mocks.dart';

void main() {
  group('CheckTokenAction', () {
    test('should set initial route to home if token has not expired', () async {
      final DateTime now = DateTime.now();
      final String futureTime =
          now.add(const Duration(minutes: 15)).toIso8601String();

      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials.initial()
              .copyWith(isSignedIn: true, tokenExpiryTimestamp: futureTime),
        ),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(
        CheckTokenAction(
          httpClient: MockGraphQlClient(),
          refreshTokenEndpoint: 'refreshTokenEndpoint',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckTokenAction);
      expect(info.state.miscState?.initialRoute, BWRoutes.home);
    });

    test('should set initial route to login page if token has expired',
        () async {
      final DateTime now = DateTime.now();
      final String futureTime =
          now.add(const Duration(minutes: 2)).toIso8601String();

      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials.initial()
              .copyWith(isSignedIn: true, tokenExpiryTimestamp: futureTime),
        ),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(
        CheckTokenAction(
          httpClient: MockGraphQlClient(),
          refreshTokenEndpoint: 'refreshTokenEndpoint',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckTokenAction);
      expect(info.state.miscState?.initialRoute, BWRoutes.phoneLogin);
    });
  });
}
