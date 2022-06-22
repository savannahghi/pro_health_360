// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/custom_client.dart';
import 'package:pro_health_360/application/redux/actions/onboarding/check_token_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/auth_credentials.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

import '../../../mocks.dart';

void main() {
  group('CheckTokenAction', () {
    testWidgets(
        'should set initial route to resume with pin if token has not expired',
        (WidgetTester tester) async {
      final DateTime now = DateTime.now();
      final String futureTime =
          now.add(const Duration(minutes: 15)).toIso8601String();

      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials.initial()
              .copyWith(isSignedIn: true, tokenExpiryTimestamp: futureTime),
        ),
      );

      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = MockCustomClient(
                '',
                '',
                refreshTokenEndpoint: '',
                userID: '',
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(
        CheckTokenAction(
          httpClient: customClient,
          refreshTokenEndpoint: 'refreshTokenEndpoint',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckTokenAction);
      expect(info.state.miscState?.initialRoute, AppRoutes.resumeWithPin);
    });

    testWidgets(
        'if token has expired should attempt to refresh token and set initial '
        'to resume with pin', (WidgetTester tester) async {
      final DateTime now = DateTime.now();
      final String futureTime =
          now.add(const Duration(minutes: 2)).toIso8601String();

      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials.initial()
              .copyWith(isSignedIn: true, tokenExpiryTimestamp: futureTime),
        ),
      );

      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = MockCustomClient(
                '',
                '',
                refreshTokenEndpoint: '',
                userID: '',
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(
        CheckTokenAction(
          httpClient: customClient,
          refreshTokenEndpoint: 'refreshTokenEndpoint',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckTokenAction);

      expect(info.state.miscState?.initialRoute, AppRoutes.resumeWithPin);
    });

    testWidgets(
        'if token has expired and refresh token fails, should set initial route '
        'to login page', (WidgetTester tester) async {
      final DateTime now = DateTime.now();
      final String futureTime =
          now.add(const Duration(minutes: 2)).toIso8601String();

      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
          credentials: AuthCredentials.initial()
              .copyWith(isSignedIn: true, tokenExpiryTimestamp: futureTime),
        ),
      );

      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = MockCustomClient(
                '',
                '',
                refreshTokenEndpoint: '',
                userID: '',
                context: context,
                authCredentials: <String, dynamic>{},
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(
        CheckTokenAction(
          httpClient: customClient,
          refreshTokenEndpoint: 'refreshTokenEndpoint',
        ),
      );

      final TestInfo<AppState> info =
          await storeTester.waitUntil(CheckTokenAction);
      expect(info.state.miscState?.initialRoute, AppRoutes.phoneLogin);
    });
  });
}

class MockCustomClient extends CustomClient {
  MockCustomClient(
    String idToken,
    String endpoint, {
    required BuildContext context,
    required String refreshTokenEndpoint,
    required String userID,
    this.authCredentials,
  }) : super(
          idToken,
          endpoint,
          context: context,
          userID: userID,
          refreshTokenEndpoint: refreshTokenEndpoint,
        );

  final Map<String, dynamic>? authCredentials;

  @override
  Future<AuthCredentials> refreshToken() async {
    return AuthCredentials.fromJson(authCredentials ?? mockAuthCredentials);
  }
}
