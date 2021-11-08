// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart' show AppContext, AppWrapperBase;
import 'package:async_redux/async_redux.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:domain_objects/entities.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/refresh_token_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import '../../../mock_feed_response.dart';
import '../../../mock_utils.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';
import './onboarding_utils_2_test.mocks.dart';

@GenerateMocks(<Type>[RefreshTokenManger, DateTimeParser, SILFCM])
void main() {
  // initial set up
  setupFirebaseAuthMocks();

  final DeepLinkSubject deepLink = DeepLinkSubject();

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

    testWidgets('afterLoginOrCreateAccount should pass with a deep link',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        deepLink.hasLink.add(true);
        deepLink.link.add('home');
        final Store<AppState> store =
            Store<AppState>(initialState: AppState.initial());
        final http.Response response = http.Response(
          json.encode(loginResponse),
          201,
        );

        final Map<String, dynamic> responseData =
            mockFeedResponse(hasItems: false);
        // mocked response
        final http.Response _response = http.Response(
          json.encode(responseData),
          200,
        );

        loginResponse.remove('auth');

        final UserResponse userResp = UserResponse.fromJson(loginResponse);
        final UserProfile? userProfile = userResp.profile;

        queryWhenThenAnswer(
          queryString: getFeedQuery,
          variables: <String, dynamic>{
            'flavour': Flavour.CONSUMER.name,
            'persistent': 'BOTH',
            'visibility': 'SHOW',
            'isAnonymous': false,
            'status': null,
          },
          response: _response,
        );

        queryWhenThenAnswer(
          queryString: registerDeviceTokenQuery,
          variables: <String, dynamic>{'token': 'sampleToken'},
          response: _response,
        );

        when(baseGraphQlClientMock.toMap(_response))
            .thenReturn(json.decode(_response.body) as Map<String, dynamic>);

        when(baseGraphQlClientMock.parseError(responseData)).thenReturn(null);

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                onPressed: () async {
                  StoreProvider.dispatch(
                    context,
                    AuthStatusAction(
                      signedIn: true,
                      idToken: 'ajskdhbskjbdjhaskdbkash',
                      refreshToken: 'ajskdhbskjbdjhaskdbkash',
                      expiresAt: DateTime.now()
                          .add(const Duration(seconds: 5))
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

                  // call our check token status function
                  await processSignIn(
                    context: context,
                    dateTimeParser: dateTimeParser!,
                    processedResponse: processHttpResponse(response),
                    store: store,
                    refreshTokenManger: refreshTimer!,
                    graphQlClient: AppWrapperBase.of(context)!.graphQLClient,
                  );
                },
                text: 'Test',
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
      });
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
          'customToken': 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9',
          'expires_in': '3600',
          'id_token': 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjRlMDBlO',
          'is_admin': false,
          'is_anonymous': false,
          'refresh_token': 'AOvuKvSUUOtClp53pQ3x0Jf31cV4nUtXf2G',
          'uid': 'tGeoFDacVxOaXNoBZhqqhbXINZr1'
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
                RefreshTokenManger().timer.cancel();
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
        'AOvuKvSUUOtClp53pQ3x0Jf31cV4nUtXf2G',
      );
      expect(
        store.state.userProfileState!.auth!.idToken,
        'eyJhbGciOiJSUzI1NiIsImtpZCI6IjRlMDBlO',
      );
      expect(actualTokenStatus, AuthTokenStatus.requiresPin);
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

    testWidgets('should show bottomshet when afterLoginOrCreateAccount',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final http.Response response = http.Response(
        json.encode(null),
        201,
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                // call our check token status function
                await processSignIn(
                  context: context,
                  dateTimeParser: dateTimeParser!,
                  processedResponse: processHttpResponse(response),
                  store: store,
                  refreshTokenManger: refreshTimer!,
                  graphQlClient: AppWrapperBase.of(context)!.graphQLClient,
                );
              },
              text: 'Test',
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byKey(feedbackBottomSheet), findsOneWidget);
    });

    testWidgets('afterLoginOrCreateAccount should pass 1',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final http.Response response = http.Response(
        json.encode(loginResponse),
        201,
      );

      final Map<String, dynamic> responseData =
          mockFeedResponse(hasItems: false);
      // mocked response
      final http.Response _response = http.Response(
        json.encode(responseData),
        200,
      );

      loginResponse.remove('auth');

      final UserResponse userResp = UserResponse.fromJson(loginResponse);
      final UserProfile? userProfile = userResp.profile;

      queryWhenThenAnswer(
        queryString: getFeedQuery,
        variables: <String, dynamic>{
          'flavour': Flavour.CONSUMER.name,
          'persistent': 'BOTH',
          'visibility': 'SHOW',
          'isAnonymous': false,
          'status': null,
        },
        response: _response,
      );

      when(baseGraphQlClientMock.toMap(_response))
          .thenReturn(json.decode(_response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock.parseError(responseData)).thenReturn(null);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                StoreProvider.dispatch(
                  context,
                  AuthStatusAction(
                    signedIn: true,
                    idToken: 'ajskdhbskjbdjhaskdbkash',
                    refreshToken: 'ajskdhbskjbdjhaskdbkash',
                    expiresAt: DateTime.now()
                        .add(const Duration(seconds: 5))
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
                // call our check token status function
                await processSignIn(
                  context: context,
                  dateTimeParser: dateTimeParser!,
                  processedResponse: processHttpResponse(response),
                  store: store,
                  refreshTokenManger: refreshTimer!,
                  graphQlClient: AppWrapperBase.of(context)!.graphQLClient,
                );
              },
              text: 'Test',
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byKey(feedbackBottomSheet), findsOneWidget);
    });
  });
}
