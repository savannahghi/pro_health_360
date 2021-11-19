// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Package imports:
import 'package:dart_fcm/dart_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/refresh_token_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:shared_ui_components/buttons.dart';

import './onboarding_utils_2_test.mocks.dart';
import '../../../mock_utils.dart';
import '../../../test_helpers.dart';

@GenerateMocks(<Type>[RefreshTokenManger, DateTimeParser, SILFCM])
void main() {
  // initial set up
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  const MethodChannel('plugins.flutter.io/firebase_messaging')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'Messaging#getToken') {
      return <String, String?>{
        'token': 'sampleToken'
      }; // set initial values here if desired
    }
    return null;
  });

  group('OnboardingUtils 2', () {
    MockRefreshTokenManger? refreshTimer;

    MockDateTimeParser? dateTimeParser;

    MockSILFCM? fcm;

    setUp(() async {
      refreshTimer = MockRefreshTokenManger();
      dateTimeParser = MockDateTimeParser();
      fcm = MockSILFCM();

      when(dateTimeParser!.parsedExpireAt(int.parse('3600')))
          .thenReturn('2021-05-11T21:34:25.150');
      when(refreshTimer!.updateExpireTime('2021-05-11T21:34:25.150'))
          .thenReturn(refreshTimer!);
      when(refreshTimer!.reset()).thenReturn(null);

      when(fcm!.resetToken())
          .thenAnswer((Invocation realInvocation) => Future<void>.value());

      when(fcm!.getDeviceToken()).thenAnswer(
        (Invocation realInvocation) => Future<String>.value('test-token'),
      );
    });

    test('should register device token', () async {
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'registerPushToken': true}),
        201,
      );

      queryWhenThenAnswer(
        queryString: registerDeviceTokenQuery,
        variables: <String, dynamic>{'token': 'sampleToken'},
        response: response,
      );

      await registerDeviceToken(client: baseGraphQlClientMock);

      expect(
        () async => registerDeviceToken(client: baseGraphQlClientMock),
        returnsNormally,
      );
    });

    testWidgets(
        'for a token whose expiry is less than 5 minutes with custom client',
        (WidgetTester tester) async {
      // setup
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      const String oldAuthToken = 'an-old-auth-token';
      const String oldRefreshToken = 'a-old-refresh-token';

      AuthTokenStatus? actualTokenStatus;

      // implementation/call the function
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch(
              context,
              AuthStatusAction(
                isSignedIn: true,
                idToken: oldAuthToken,
                refreshToken: oldRefreshToken,
                expiresAt: DateTime.now()
                    .add(const Duration(seconds: 5))
                    .toIso8601String(),
              ),
            );

            return SILPrimaryButton(
              onPressed: () async {
                // call our check token status function
                actualTokenStatus = await checkTokenStatus(
                  context: context,
                  credentials: store.state.credentials,
                  thisAppContexts: <AppContext>[
                    AppContext.BewellCONSUMER,
                    AppContext.AppTest
                  ],
                );
              },
              text: 'Test',
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      final AuthCredentials state = store.state.credentials!;
      // verify current state
      expect(state.isSignedIn, true);
      expect(state.refreshToken, oldRefreshToken);
      expect(state.idToken, oldAuthToken);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify functionality
      // state should remain the same
      expect(state.isSignedIn, true);
      expect(state.refreshToken, oldRefreshToken);
      expect(state.idToken, oldAuthToken);
      expect(actualTokenStatus, AuthTokenStatus.okay);
    });

    testWidgets('for a token whose expiry is less than 5 minutes',
        (WidgetTester tester) async {
      // setup
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      const String oldAuthToken = 'an-old-auth-token';
      const String oldRefreshToken = 'a-old-refresh-token';

      AuthTokenStatus? actualTokenStatus;

      // implementation/call the function
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch(
              context,
              AuthStatusAction(
                isSignedIn: true,
                idToken: oldAuthToken,
                refreshToken: oldRefreshToken,
                expiresAt: DateTime.now()
                    .add(const Duration(seconds: 5))
                    .toIso8601String(),
              ),
            );

            return SILPrimaryButton(
              onPressed: () async {
                // call our check token status function
                actualTokenStatus = await checkTokenStatus(
                  context: context,
                  thisAppContexts: <AppContext>[
                    AppContext.BewellCONSUMER,
                    AppContext.AppTest
                  ],
                  credentials: store.state.credentials,
                );
              },
              text: 'Test',
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      final AuthCredentials state = store.state.credentials!;
      // verify current state
      expect(state.isSignedIn, true);
      expect(state.refreshToken, oldRefreshToken);
      expect(state.idToken, oldAuthToken);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify functionality
      // state should remain the same
      expect(state.isSignedIn, true);
      expect(state.refreshToken, oldRefreshToken);
      expect(state.idToken, oldAuthToken);
      expect(actualTokenStatus, AuthTokenStatus.okay);
    });
  });
}
