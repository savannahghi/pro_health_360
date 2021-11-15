// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart' show AppContext;
import 'package:async_redux/async_redux.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:domain_objects/entities.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/refresh_token_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';
import '../../../mock_utils.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';
import './onboarding_utils_2_test.mocks.dart';

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
                signedIn: true,
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
                  profileState: store.state.userProfileState!,
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
      final UserProfileState state = store.state.userProfileState!;
      // verify current state
      expect(state.isSignedIn, true);
      expect(state.auth!.refreshToken, oldRefreshToken);
      expect(state.auth!.idToken, oldAuthToken);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify functionality
      // state should remain the same
      expect(state.isSignedIn, true);
      expect(state.auth!.refreshToken, oldRefreshToken);
      expect(state.auth!.idToken, oldAuthToken);
      expect(actualTokenStatus, AuthTokenStatus.okay);
    });

    testWidgets('should return false when fails to updateStateAuth',
        (WidgetTester tester) async {
      // setup
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      bool? updateStateAuthStatus;

      loginResponse.remove('auth');

      final http.Response response = http.Response(
        json.encode(loginResponse),
        201,
      );

      final UserResponse userResp = UserResponse.fromJson(loginResponse);
      final UserProfile? userProfile = userResp.profile;

      // implementation/call the function
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch(
              context,
              UpdateUserProfileAction(
                profile: userProfile,
                userBioData: userProfile?.userBioData,
              ),
            );

            return SILPrimaryButton(
              onPressed: () async {
                // call our check token status function
                updateStateAuthStatus = await updateStateAuth(
                  processedResponse:
                      ProcessedResponse(ok: true, response: response),
                  context: context,
                );
              },
              text: 'Test',
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      final UserProfileState state = store.state.userProfileState!;
      // verify current state
      expect(state.userProfile!.primaryPhoneNumber!.getValue(), isNotNull);
      expect(state.userProfile!.userBioData!.firstName!.getValue(), isNotNull);
      expect(state.userProfile!.userBioData!.lastName!.getValue(), isNotNull);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(updateStateAuthStatus, isNotNull);
      expect(updateStateAuthStatus, false);
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
                signedIn: true,
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
                  profileState: store.state.userProfileState!,
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
      final UserProfileState state = store.state.userProfileState!;
      // verify current state
      expect(state.isSignedIn, true);
      expect(state.auth!.refreshToken, oldRefreshToken);
      expect(state.auth!.idToken, oldAuthToken);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      // verify functionality
      // state should remain the same
      expect(state.isSignedIn, true);
      expect(state.auth!.refreshToken, oldRefreshToken);
      expect(state.auth!.idToken, oldAuthToken);
      expect(actualTokenStatus, AuthTokenStatus.okay);
    });

    testWidgets('for a token whose expiry is more than 12 hrs',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        // setup
        final Store<AppState> store =
            Store<AppState>(initialState: AppState.initial());

        AuthTokenStatus? actualTokenStatus;

        loginResponse.remove('auth');

        final UserResponse userResp = UserResponse.fromJson(loginResponse);
        final UserProfile? userProfile = userResp.profile;

        final http.Response response = http.Response(
          json.encode(<String, dynamic>{
            'can_experiment': true,
            'customToken': 'some-custom-token',
            'expires_in': '3600',
            'id_token': 'some-id-token',
            'is_admin': false,
            'is_anonymous': false,
            'refresh_token': 'Some-refresh-token',
            'uid': 'some-uid'
          }),
          201,
        );

        const String refreshTokenEndpoint = kTestRefreshTokenEndpoint;

        callRESTAPIWhenThenAnswer(
          endpoint: refreshTokenEndpoint,
          variables: <String, dynamic>{
            'refreshToken': 'oldRefreshToken',
            'appVersion': APPVERSION,
          },
          response: response,
        );

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
                  signedIn: true,
                  idToken: 'oldIdToken',
                  refreshToken: 'oldRefreshToken',
                  expiresAt: DateTime.now()
                      .add(const Duration(days: 2))
                      .toIso8601String(),
                ),
              );

              StoreProvider.dispatch(
                context,
                UpdateUserProfileAction(
                  profile: userProfile,
                  userBioData: userProfile?.userBioData,
                ),
              );

              return SILPrimaryButton(
                onPressed: () async {
                  // call our check token status function
                  actualTokenStatus = await checkTokenStatus(
                    context: context,
                    profileState: store.state.userProfileState!,
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
        final UserProfileState state = store.state.userProfileState!;
        // verify current state
        expect(state.isSignedIn, true);
        expect(state.auth!.refreshToken, 'oldRefreshToken');
        expect(state.auth!.idToken, 'oldIdToken');

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(store.state.userProfileState!.isSignedIn, true);
        expect(
          store.state.userProfileState!.auth!.refreshToken,
          'Some-refresh-token',
        );
        expect(
          store.state.userProfileState!.auth!.idToken,
          'some-id-token',
        );
        expect(actualTokenStatus, AuthTokenStatus.requiresPin);
      });
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
  });
}
