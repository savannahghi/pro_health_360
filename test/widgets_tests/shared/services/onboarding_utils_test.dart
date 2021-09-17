import 'dart:convert';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';

import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/help_center/widgets/circular_background_icons.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/phone_number_login_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';
import '../../../test_utils.dart';
import './onboarding_utils_2_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('OnboardingUtils', () {
    late MockGraphQlClient mockGraphQlClient;
    late MockShortGraphQlClient mockShortGraphQlClient;
    MockDateTimeParser? dateTimeParser;
    MockSILFCM? fcm;

    const MethodChannel('plugins.flutter.io/url_launcher')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'launch') {
        return Future<bool>.value(true); // set initial values here if desired
      }
      return null;
    });

    setUp(() {
      mockGraphQlClient = MockGraphQlClient();
      mockShortGraphQlClient = MockShortGraphQlClient();
      dateTimeParser = MockDateTimeParser();
      fcm = MockSILFCM();
      when(dateTimeParser!.parsedExpireAt(int.parse('3600')))
          .thenReturn('2021-05-11T21:34:25.150');

      when(fcm!.resetToken())
          .thenAnswer((Invocation realInvocation) => Future<void>.value());

      when(fcm!.getDeviceToken()).thenAnswer(
          (Invocation realInvocation) => Future<String>.value('test-token'));
    });

    testWidgets('should return homepage route', (WidgetTester tester) async {
      // setup
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final Map<String, dynamic> expectedOnboardingRouteConfigs =
          <String, dynamic>{'route': BWRoutes.home, 'args': null};

      late Map<String, dynamic> actualOnboardingRouteConfigs;

      // call the function
      // implementation/call the function
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch<AppState>(
              context,
              UpdateUserProfileAction(
                userBioData: BioData(
                  dateOfBirth: '12-12-12',
                  firstName: Name.withValue('Test'),
                  lastName: Name.withValue('Coverage'),
                  gender: Gender.male,
                ),
              ),
            );
            return SILPrimaryButton(
              buttonKey: const Key('check-onboarding-path-key'),
              onPressed: () {
                // call our check token status function
                actualOnboardingRouteConfigs = onboardingPath(store.state);
              },
              text: 'Test',
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      final Finder checkTokenStatusButton =
          find.byKey(const Key('check-onboarding-path-key'));
      await tester.tap(checkTokenStatusButton);

      await tester.pumpAndSettle();

      // verify functionality
      expect(actualOnboardingRouteConfigs, expectedOnboardingRouteConfigs);
    });

    group('should update user pin', () {
      testWidgets('should update user pin', (WidgetTester tester) async {
        const Key updateUserPinButtonKey = Key('update_user_pin_button');
        final Store<AppState> store =
            Store<AppState>(initialState: AppState.initial());
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return Material(
              child: Scaffold(
                body: SILPrimaryButton(
                  buttonKey: updateUserPinButtonKey,
                  onPressed: () async {
                    EndPointsContextSubject().contexts.add(prodAppContexts);
                    await updateUserPin(
                        context: context,
                        pin: testPin,
                        phoneNumber: testPhoneNumber,
                        otp: testOTP);
                  },
                ),
              ),
            );
          }),
        );
        await fireEvent(tester);
        expect(find.byType(SILPrimaryButton), findsOneWidget);
        expect(find.byKey(updateUserPinButtonKey), findsOneWidget);

        // trigger the bottom sheet
        await tester.tap(find.byKey(updateUserPinButtonKey));
        await tester.pumpAndSettle();

        expect(find.byKey(feedbackBottomSheet), findsOneWidget);
        expect(find.byKey(feedbackBottomSheetCloseIconKey), findsOneWidget);

        await tester.tap(find.byKey(feedbackBottomSheetCloseIconKey));
        await tester.pumpAndSettle();

        expect(find.byKey(feedbackBottomSheet), findsNothing);
        expect(find.byType(PhoneNumberLoginPage), findsOneWidget);
      });

      testWidgets('should update user pin and navigate',
          (WidgetTester tester) async {
        const Key updateUserPinButtonKey = Key('update_user_pin_button');
        final Store<AppState> store =
            Store<AppState>(initialState: AppState.initial());
        when(baseGraphQlClientMock.callRESTAPI(
                endpoint: kTestUpdateUserPinEndpoint,
                variables: <String, String>{
                  'phoneNumber': testPhoneNumber,
                  'OTP': testOTP,
                  'PIN': testPin,
                },
                method: 'POST'))
            .thenAnswer(
          (_) => Future<http.Response>.value(
            http.Response(
              json.encode(true),
              201,
            ),
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            return Material(
              child: Scaffold(
                body: SILPrimaryButton(
                  buttonKey: updateUserPinButtonKey,
                  onPressed: () async {
                    EndPointsContextSubject().contexts.add(testAppContexts);
                    await updateUserPin(
                        context: context,
                        pin: testPin,
                        phoneNumber: testPhoneNumber,
                        otp: testOTP);
                  },
                ),
              ),
            );
          }),
        );
        await fireEvent(tester);
        expect(find.byType(SILPrimaryButton), findsOneWidget);
        expect(find.byKey(updateUserPinButtonKey), findsOneWidget);

        // trigger the bottom sheet
        await tester.tap(find.byKey(updateUserPinButtonKey));
        await tester.pumpAndSettle();

        expect(find.byKey(feedbackBottomSheet), findsOneWidget);
      });

      testWidgets('should show bottom sheet when fails to update pin',
          (WidgetTester tester) async {
        const Key updateUserPinButtonKey = Key('update_user_pin_button');
        final Store<AppState> store =
            Store<AppState>(initialState: AppState.initial());
        when(baseGraphQlClientMock.callRESTAPI(
                endpoint: kTestUpdateUserPinEndpoint,
                variables: <String, String>{
                  'phoneNumber': testPhoneNumber,
                  'OTP': testOTP,
                  'PIN': testPin,
                },
                method: 'POST'))
            .thenAnswer(
          (_) => Future<http.Response>.value(
            http.Response(
              json.encode(false),
              201,
            ),
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            return Material(
              child: Scaffold(
                body: SILPrimaryButton(
                  buttonKey: updateUserPinButtonKey,
                  onPressed: () async {
                    EndPointsContextSubject().contexts.add(testAppContexts);
                    await updateUserPin(
                        context: context,
                        pin: testPin,
                        phoneNumber: testPhoneNumber,
                        otp: testOTP);
                  },
                ),
              ),
            );
          }),
        );
        await fireEvent(tester);
        expect(find.byType(SILPrimaryButton), findsOneWidget);
        expect(find.byKey(updateUserPinButtonKey), findsOneWidget);

        // trigger the bottom sheet
        await tester.tap(find.byKey(updateUserPinButtonKey));
        await tester.pumpAndSettle();

        expect(find.byKey(feedbackBottomSheet), findsOneWidget);
      });
    });

    group('Onboarding path', () {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      testWidgets('should return homepage for anonymous users',
          (WidgetTester tester) async {
        late Map<String, dynamic> _onboardingPath;
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await StoreProvider.dispatch<AppState>(
                    context, AuthStatusAction(isAnonymous: true));
                _onboardingPath = onboardingPath(store.state);
              },
            );
          }),
        );
        await tester.pumpAndSettle();

        // trigger the bottom sheet
        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(_onboardingPath['route'], BWRoutes.basicDetails);
        expect(_onboardingPath['args'], null);
      });

      testWidgets(
          'should return basic details for normal users '
          'that have not filled their user profile',
          (WidgetTester tester) async {
        late Map<String, dynamic> _onboardingPath;
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await StoreProvider.dispatch<AppState>(
                    context,
                    AuthStatusAction(
                      isAnonymous: false,
                    ));
                _onboardingPath = onboardingPath(store.state);
              },
            );
          }),
        );
        await tester.pumpAndSettle();
        // trigger the bottom sheet
        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(_onboardingPath['route'], BWRoutes.basicDetails);
        expect(_onboardingPath['args'], null);
      });

      testWidgets(
          'should return homepage for users who have filled in their user profile',
          (WidgetTester tester) async {
        late Map<String, dynamic> _onboardingPath;
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await StoreProvider.dispatch<AppState>(
                  context,
                  UpdateUserProfileAction(
                    userBioData: BioData(
                        dateOfBirth: '12-12-12',
                        firstName: Name.withValue('Test'),
                        lastName: Name.withValue('Coverage'),
                        gender: Gender.male),
                  ),
                );
                _onboardingPath = onboardingPath(store.state);
              },
            );
          }),
        );
        await tester.pumpAndSettle();

        // trigger the bottom sheet
        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(_onboardingPath['route'], BWRoutes.home);
        expect(_onboardingPath['args'], null);
      });
    });

    group('Login tests: process response', () {
      late Store<AppState> store;
      setUpAll(() {
        store = Store<AppState>(initialState: AppState.initial());
      });
      testWidgets('Onboarding utils should process response with a 200',
          (WidgetTester tester) async {
        final http.Response expectedResponse = http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'addTester': true}
            }),
            201);
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: Center(
              child: SILPrimaryButton(
                onPressed: () {
                  actualResponse = processHttpResponse(expectedResponse);
                },
                text: processBtnText,
              ),
            ),
          ),
        ));

        expect(find.text(processBtnText), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(actualResponse.ok, true);
        expect(actualResponse.response, expectedResponse);
      });

      testWidgets(
          'Onboarding utils should process response with a 400 and a status code of 4',
          (WidgetTester tester) async {
        final http.Response expectedErrorResponse = http.Response(
            json.encode(<String, dynamic>{
              'error': <String, dynamic>{
                'code': 4,
                'message': 'coverage is still not 100%'
              },
              'code': 4,
            }),
            400);
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: Center(
              child: SILPrimaryButton(
                onPressed: () {
                  actualResponse = processHttpResponse(expectedErrorResponse);
                },
                text: processBtnText,
              ),
            ),
          ),
        ));

        expect(find.text(processBtnText), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(actualResponse.ok, false);
        expect(actualResponse.response, expectedErrorResponse);
        // expect a default error msg because context was not passed in
        expect(actualResponse.message, userWithThatPhoneExists);
      });

      testWidgets(
          'Onboarding utils should show that a user exists if a 400 '
          ' is returned and a status code of 4', (WidgetTester tester) async {
        final http.Response expectedErrorResponse = http.Response(
            json.encode(<String, dynamic>{
              'code': 4,
              'message': 'coverage is still not 100%'
            }),
            400);

        late ProcessedResponse actualResponse;
        final Store<AppState> store =
            Store<AppState>(initialState: AppState.initial());

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () {
                actualResponse =
                    processHttpResponse(expectedErrorResponse, context);
              },
              text: 'process response',
            );
          }),
        );
        await tester.pump();
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(actualResponse.ok, false);
        expect(actualResponse.response, expectedErrorResponse);
        // expect a default error msg because context was not passed in
        expect(actualResponse.message, userWithThatPhoneExists);

        expect(store.state.miscState!.phoneSignUp!.accountExists, true);
      });

      testWidgets(
          'Onboarding utils should process response '
          'with a 400 and a status code of 8', (WidgetTester tester) async {
        final http.Response expectedErrorResponse = http.Response(
            json.encode(<String, dynamic>{
              'code': 8,
              'message': 'coverage is still not 100%'
            }),
            400);
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return Center(
              child: SILPrimaryButton(
                onPressed: () {
                  actualResponse =
                      processHttpResponse(expectedErrorResponse, context);
                },
                text: processBtnText,
              ),
            );
          }),
        );
        await tester.pump();
        expect(find.text(processBtnText), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(actualResponse.ok, false);
        expect(actualResponse.response, expectedErrorResponse);
        // expect a default error msg because context was not passed in
        expect(actualResponse.message, wrongLoginCredentials);

        expect(store.state.miscState!.phoneLogin!.invalidCredentials, true);
      });

      testWidgets(
          'Onboarding utils should process response '
          'with a 500 and a status code of 8', (WidgetTester tester) async {
        final http.Response expectedErrorResponse = http.Response(
            json.encode(<String, dynamic>{
              'code': 11,
              'message': 'coverage is still not 100%'
            }),
            400);
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return Center(
              child: SILPrimaryButton(
                onPressed: () {
                  actualResponse =
                      processHttpResponse(expectedErrorResponse, context);
                },
                text: processBtnText,
              ),
            );
          }),
        );
        await tester.pump();
        expect(find.text(processBtnText), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(actualResponse.ok, false);
        expect(actualResponse.response, expectedErrorResponse);
        // expect a default error msg because context was not passed in
        expect(actualResponse.message, defaultUserFriendlyMessage);
      });

      testWidgets('Onboarding utils should process response with a 500',
          (WidgetTester tester) async {
        final http.Response expectedErrorResponse = http.Response(
            json.encode(<String, dynamic>{
              'code': 11,
              'message': 'coverage is still not 100%'
            }),
            500);
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return Center(
              child: SILPrimaryButton(
                onPressed: () {
                  actualResponse =
                      processHttpResponse(expectedErrorResponse, context);
                },
                text: processBtnText,
              ),
            );
          }),
        );
        await tester.pump();
        expect(find.text(processBtnText), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(actualResponse.ok, false);
        expect(actualResponse.response, expectedErrorResponse);
        // expect a default error msg because context was not passed in
        expect(actualResponse.response, isA<http.Response>());
      });

      testWidgets('Onboarding utils should process response with a 408',
          (WidgetTester tester) async {
        final http.Response expectedErrorResponse = http.Response(
            json.encode(<String, dynamic>{'error': 'timeout'}), 408);
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(builder: (BuildContext context) {
              return Center(
                child: SILPrimaryButton(
                  onPressed: () {
                    actualResponse =
                        processHttpResponse(expectedErrorResponse, context);
                  },
                  text: processBtnText,
                ),
              );
            }));
        await tester.pump();

        expect(find.text(processBtnText), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(actualResponse.ok, true);
        expect(actualResponse.response, expectedErrorResponse);
        expect(actualResponse.message, slowInternet);
      });

      testWidgets('Onboarding utils should process response with a 522',
          (WidgetTester tester) async {
        final http.Response expectedErrorResponse = http.Response(
            json.encode(<String, dynamic>{'error': 'timeout'}), 522);
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return Center(
              child: SILPrimaryButton(
                onPressed: () {
                  actualResponse =
                      processHttpResponse(expectedErrorResponse, context);
                },
                text: processBtnText,
              ),
            );
          }),
        );
        await tester.pump();

        expect(find.text(processBtnText), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(actualResponse.ok, false);
        expect(actualResponse.response, expectedErrorResponse);
        expect(actualResponse.message, UserFeedBackTexts.getErrorMessage());
      });

      testWidgets('should toggle loading indicator with true',
          (WidgetTester tester) async {
        const String processBtnText = 'process response';
        const String testFlag = 'test_flag';

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return Center(
              child: SILPrimaryButton(
                onPressed: () {
                  toggleLoadingIndicator(context: context, flag: testFlag);
                },
                text: processBtnText,
              ),
            );
          }),
        );
        await tester.pump();
        expect(find.text(processBtnText), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(store.state.wait!.isWaitingFor(testFlag), true);
      });

      testWidgets('should toggle loading indicator with true',
          (WidgetTester tester) async {
        const String processBtnText = 'process response';
        const String testFlag = 'test_flag';

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(builder: (BuildContext context) {
            return Center(
              child: SILPrimaryButton(
                onPressed: () {
                  toggleLoadingIndicator(
                      context: context, flag: testFlag, show: false);
                },
                text: processBtnText,
              ),
            );
          }),
        );
        await tester.pump();
        expect(find.text(processBtnText), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(store.state.wait!.isWaitingFor(testFlag), false);
      });
    });

    testWidgets('should return home route for a user with a valid token',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      late String initialRoute;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          StoreProvider.dispatch(
            context,
            AuthStatusAction(
              signedIn: true,
              idToken: 'oldAuthToken',
              refreshToken: 'oldRefreshToken',
              expiresAt: DateTime.now()
                  .add(const Duration(seconds: 2))
                  .toIso8601String(),
            ),
          );
          return SILPrimaryButton(
            onPressed: () async {
              initialRoute = await getInitialRoute(
                context,
                store.state,
                <AppContext>[AppContext.BewellCONSUMER, AppContext.AppTest],
              );
            },
          );
        }),
      );
      await tester.pump();
      // trigger the bottom sheet
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(initialRoute, BWRoutes.basicDetails);
    });

    testWidgets(
        'should return landing page for a user who is not signed in and '
        'has not completed the onboarding tour ', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      // ignore: unused_local_variable
      late String initialRoute;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          StoreProvider.dispatch(
              context, UpdateUserProfileAction(onboardingTourComplete: false));
          StoreProvider.dispatch(
            context,
            AuthStatusAction(
              signedIn: false,
              idToken: 'oldAuthToken',
              refreshToken: 'oldRefreshToken',
              expiresAt: DateTime.now()
                  .add(const Duration(seconds: 2))
                  .toIso8601String(),
            ),
          );
          return SILPrimaryButton(
            onPressed: () async {
              initialRoute = await getInitialRoute(
                context,
                store.state,
                <AppContext>[AppContext.BewellCONSUMER, AppContext.AppTest],
              );
            },
          );
        }),
      );
      await tester.pump();
      // trigger the bottom sheet
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle(const Duration(seconds: 3));
    });

    testWidgets(
        'should return resume with PIN page for a user who is signed in',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      late String initialRoute;

      // mocked response
      final http.Response response = http.Response(
        json.encode(
          <String, dynamic>{
            'id_token': 'newAuthToken',
            'refresh_token': 'newRefreshToken',
            'expires_in': '2'
          },
        ),
        201,
      );

      callRESTAPIWhenThenAnswer(
        endpoint: 'https://profile-testing.healthcloud.co.ke/refresh_token',
        variables: <String, dynamic>{
          'refreshToken': 'oldRefreshToken',
          'appVersion': APPVERSION,
        },
        response: response,
      );

      loginResponse.remove('auth');

      final UserResponse userResp = UserResponse.fromJson(loginResponse);
      final UserProfile? userProfile = userResp.profile;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          StoreProvider.dispatch(context, AuthStatusAction(isAnonymous: true));
          StoreProvider.dispatch(
            context,
            AuthStatusAction(
              signedIn: true,
              idToken: 'oldAuthToken',
              refreshToken: 'oldRefreshToken',
              expiresAt: DateTime.now()
                  .add(const Duration(hours: 2))
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
              initialRoute = await getInitialRoute(
                context,
                store.state,
                <AppContext>[AppContext.BewellCONSUMER, AppContext.AppTest],
              );
            },
          );
        }),
      );
      await tester.pump();
      // trigger the bottom sheet
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(initialRoute, BWRoutes.resumeWithPin);
    });

    testWidgets('should save profile details successfully',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      final Map<String, String> variables = <String, String>{
        'firstName': testFirstName,
        'lastName': testLastName,
        'gender': 'Male',
        'dateOfBirth': testDOB
      };

      when(baseGraphQlClientMock.query(
        updateUserProfileMutation,
        <String, dynamic>{
          // ignore: always_specify_types
          'input': variables,
        },
      )).thenAnswer((_) => Future<http.Response>.value(
            http.Response(
              json.encode(<String, dynamic>{
                'data': <String, dynamic>{
                  'updateUserProfile': <String, dynamic>{
                    'userBioData': variables
                  },
                }
              }),
              201,
            ),
          ));

      when(baseGraphQlClientMock.toMap(any)).thenReturn(<String, dynamic>{
        'data': <String, dynamic>{
          'updateUserProfile': <String, dynamic>{'userBioData': variables},
        }
      });

      when(baseGraphQlClientMock.parseError(<String, dynamic>{
        'data': <String, dynamic>{
          'updateUserProfile': <String, dynamic>{'userBioData': variables},
        }
      })).thenReturn(null);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              await saveProfileDetails(
                variables: variables,
                checkGender: 'Male',
                checkDisplayName: testFirstName,
                context: context,
              );
            },
          );
        }),
      );
      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump(const Duration(seconds: 1));

      // verify(mockNavigatorObserver.didPush(sampleRoute, any));
      final BioData bioData =
          store.state.userProfileState!.userProfile!.userBioData!;
      expect(bioData.gender, Gender.male);
      expect(bioData.firstName!.getValue(), testFirstName);
      expect(bioData.lastName!.getValue(), testLastName);
      expect(bioData.dateOfBirth, testDOB);
    });

    testWidgets('should show error showSnackBar when save profile fails',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      final Map<String, String> variables = <String, String>{
        'firstName': testFirstName,
        'lastName': testLastName,
        'gender': 'Male',
        'dateOfBirth': testDOB
      };

      when(baseGraphQlClientMock.query(
        updateUserProfileMutation,
        <String, dynamic>{
          // ignore: always_specify_types
          'input': variables,
        },
      )).thenAnswer((_) => Future<http.Response>.value(
            http.Response(
              json.encode(<String, dynamic>{'data': null}),
              201,
            ),
          ));

      when(baseGraphQlClientMock.toMap(any))
          .thenReturn(<String, dynamic>{'data': null});

      when(baseGraphQlClientMock.parseError(<String, dynamic>{'data': null}))
          .thenReturn(null);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              await saveProfileDetails(
                variables: variables,
                checkGender: 'Male',
                checkDisplayName: testFirstName,
                context: context,
              );
            },
          );
        }),
      );
      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('should return error when saving profile details',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      when(baseGraphQlClientMock.query(
        updateUserProfileMutation,
        <String, dynamic>{
          // ignore: always_specify_types
          'input': {'firstName': 'Test', 'lastName': 'Name', 'gender': 'Male'},
        },
      )).thenAnswer((_) => Future<http.Response>.value(
            http.Response(
              json.encode(<String, dynamic>{'error': 'An error occurred'}),
              401,
            ),
          ));

      when(baseGraphQlClientMock.toMap(any))
          .thenReturn(<String, dynamic>{'error': 'An error occurred'});

      when(baseGraphQlClientMock
              .parseError(<String, dynamic>{'error': 'An error occurred'}))
          .thenReturn('error');

      final Map<String, String> variables = <String, String>{
        'firstName': 'Test',
        'lastName': 'Name',
      };

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              await saveProfileDetails(
                variables: variables,
                checkGender: 'Male',
                checkDisplayName: 'Test Name',
                context: context,
              );
            },
          );
        }),
      );
      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump(const Duration(seconds: 1));

      // verify(mockNavigatorObserver.didPush(sampleRoute, any));
      final BioData bioData =
          store.state.userProfileState!.userProfile!.userBioData!;
      expect(bioData.gender, Gender.unknown);
      expect(bioData.firstName!.getValue(), UNKNOWN);
      expect(bioData.lastName!.getValue(), UNKNOWN);
    });

    testWidgets(
        'actionWrapError should return error if runtimeType is SILException',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              actionWrapError(
                  error: SILException(
                      cause: changePINActionError,
                      message: changePINActionException),
                  context: context);
            },
          );
        }),
      );
      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.text(changePINActionException), findsOneWidget);
    });

    testWidgets(
        'actionWrapError should return error if runtimeType is SILException and tap on retry button',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              actionWrapError(
                  error: SILException(
                      cause: changePINActionError,
                      message: changePINActionException),
                  context: context);
            },
          );
        }),
      );
      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump();
      await tester.pump(const Duration(seconds: 10));

      expect(find.text(changePINActionException), findsOneWidget);
      expect(find.text(retryButtonText), findsOneWidget);

      await tester.tap(find.text(retryButtonText));
      await tester.pumpAndSettle();
    });

    testWidgets(
        'actionWrapError should return error if runtimeType is SILException '
        'for no user found', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              actionWrapError(
                  error: SILException(
                      cause: noUserFound, message: changePINActionException),
                  context: context);
            },
          );
        }),
      );
      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.text(noUserFoundString), findsOneWidget);
      await tester.tap(find.text(createAccountButtonText));
      await tester.pumpAndSettle();
    });

    testWidgets(
        'actionWrapError should return error if runtimeType is not SILException',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              actionWrapError(
                  error: const UserException('Error'), context: context);
            },
          );
        }),
      );
      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.text(UserFeedBackTexts.getErrorMessage()), findsOneWidget);
    });

    testWidgets('showPhoneNoUsage should show phoneNumberUsageBottomSheet',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletPortrait;

      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      bool isDoneCallbackCalled = false;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () {
              showPhoneNoUsage(context, () => isDoneCallbackCalled = true)();
            },
          );
        }),
      );
      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(CircularBackGroundIcons), findsWidgets);
      expect(find.text(infoVerificationTitle), findsOneWidget);

      await tester.tap(find.byKey(enterSignUpNumberButtonKey));
      expect(isDoneCallbackCalled, true);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('checkWaitingForFunc should show loading indicator',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      const String flag = 'get_users';

      bool isWaitingFor = false;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
            onPressed: () async {
              await store.dispatch(
                WaitAction<AppState>.add(
                  flag,
                  ref: '${flag}_ref',
                ),
              );
              isWaitingFor = checkWaitingForFunc(context)(flag: flag) as bool;
            },
          );
        }),
      );

      await tester.pump();
      expect(isWaitingFor, false);

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(isWaitingFor, true);
    });

    testWidgets('clearAllFlags should clear all flags',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      const String flag = 'create_account';
      await store.dispatch(
        WaitAction<AppState>.add(
          flag,
          ref: '${flag}_ref',
        ),
      );

      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                clearAllFlags(context);
                await Future<void>.delayed(const Duration(seconds: 5));
              },
            );
          }),
        );

        await tester.pump();

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(store.state.wait!.isWaitingFor(flag), false);
      });
    });

    testWidgets('refreshTokenAndUpdateState should get a new token',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      const String refreshToken = 'hjshdkjf8knmskdj-sujhjhs89j';

      // mocked response
      final http.Response response = http.Response(
        json.encode(
          <String, dynamic>{
            'id_token': 'newAuthToken',
            'refresh_token': refreshToken,
            'expires_in': '2'
          },
        ),
        201,
      );

      callRESTAPIWhenThenAnswer(
        endpoint: 'https://profile-testing.healthcloud.co.ke/refresh_token',
        variables: <String, dynamic>{
          'refreshToken': refreshToken,
          'appVersion': APPVERSION,
        },
        response: response,
      );

      loginResponse.remove('auth');

      final UserResponse userResp = UserResponse.fromJson(loginResponse);
      final UserProfile? userProfile = userResp.profile;

      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            StoreProvider.dispatch(
              context,
              UpdateUserProfileAction(
                profile: userProfile,
                userBioData: userProfile?.userBioData,
              ),
            );

            return SILPrimaryButton(
              onPressed: () async {
                refreshTokenAndUpdateState(
                  context: context,
                  signedIn: true,
                  value: true,
                  refreshToken: refreshToken,
                  appContexts: testAppContexts,
                );
              },
            );
          }),
        );

        await tester.pump();

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();
        expect(store.state.userProfileState!.auth!.refreshToken, refreshToken);
      });
    });

    testWidgets('refreshTokenAndUpdateState should not get a new token',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      const String refreshToken = 'hjshdkjf8knmskdj-sujhjhs89j';

      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                refreshTokenAndUpdateState(
                  context: context,
                  signedIn: true,
                  value: false,
                  refreshToken: refreshToken,
                  appContexts: testAppContexts,
                );
              },
            );
          }),
        );

        await tester.pump();

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();
        expect(store.state.userProfileState!.auth!.refreshToken, UNKNOWN);
      });
    });

    testWidgets('refreshTokenAndUpdateState should fail to get a new token',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      const String refreshToken = 'hjshdkjf8knmskdj-sujhjhs89j';

      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                refreshTokenAndUpdateState(
                  context: context,
                  signedIn: false,
                  value: true,
                  refreshToken: refreshToken,
                  appContexts: testAppContexts,
                );
              },
            );
          }),
        );

        await tester.pump();

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();
        expect(store.state.userProfileState!.auth!.refreshToken, UNKNOWN);
      });
    });

    test('should test callSupport function', () async {
      callSupport();
      expect(callSupport, isA<Function>());
    });
    test('should test chatOnWhatsApp function', () async {
      chatOnWhatsApp();
      expect(chatOnWhatsApp, isA<Function>());
    });

    test(
        'should test listenForConnectivityChanges and show no internet connection',
        () async {
      listenForConnectivityChanges(ConnectivityResult.none);
      expect(
          InternetConnectivitySubject().connectivitySubject.valueOrNull, false);
    });

    test('should test listenForConnectivityChanges show internet connection',
        () async {
      listenForConnectivityChanges(ConnectivityResult.wifi);
      expect(
          InternetConnectivitySubject().connectivitySubject.valueOrNull, true);
    });
  });
}
