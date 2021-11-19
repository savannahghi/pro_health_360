// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:app_wrapper/app_wrapper.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
// Project imports:
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
import 'package:myafyahub/infrastructure/endpoints.dart' as endpoints;
import 'package:myafyahub/presentation/onboarding/login/pages/congratulations_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:user_feed/user_feed.dart';

import './onboarding_utils_2_test.mocks.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';
import '../../../test_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('OnboardingUtils', () {
    late MockGraphQlClient mockGraphQlClient;
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
      dateTimeParser = MockDateTimeParser();
      fcm = MockSILFCM();
      when(dateTimeParser!.parsedExpireAt(int.parse('3600')))
          .thenReturn('2021-05-11T21:34:25.150');

      when(fcm!.resetToken())
          .thenAnswer((Invocation realInvocation) => Future<void>.value());

      when(fcm!.getDeviceToken()).thenAnswer(
        (Invocation realInvocation) => Future<String>.value('test-token'),
      );
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
          widget: Builder(
            builder: (BuildContext context) {
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
                        otp: testOTP,
                      );
                    },
                  ),
                ),
              );
            },
          ),
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
      });

      testWidgets('should update user pin and navigate',
          (WidgetTester tester) async {
        const Key updateUserPinButtonKey = Key('update_user_pin_button');
        final Store<AppState> store =
            Store<AppState>(initialState: AppState.initial());
        when(
          baseGraphQlClientMock.callRESTAPI(
            endpoint: endpoints.kTestUpdateUserPinEndpoint,
            variables: <String, String>{
              'phoneNumber': testPhoneNumber,
              'OTP': testOTP,
              'PIN': testPin,
            },
            method: 'POST',
          ),
        ).thenAnswer(
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
          widget: Builder(
            builder: (BuildContext context) {
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
                        otp: testOTP,
                      );
                    },
                  ),
                ),
              );
            },
          ),
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
        when(
          baseGraphQlClientMock.callRESTAPI(
            endpoint: kTestUpdateUserPinEndpoint,
            variables: <String, String>{
              'phoneNumber': testPhoneNumber,
              'OTP': testOTP,
              'PIN': testPin,
            },
            method: 'POST',
          ),
        ).thenAnswer(
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
          widget: Builder(
            builder: (BuildContext context) {
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
                        otp: testOTP,
                      );
                    },
                  ),
                ),
              );
            },
          ),
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
          201,
        );
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await tester.pumpWidget(
          MaterialApp(
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
          ),
        );

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
        store.dispatch(
          UpdateUserProfileAction(
            firstName: 'Test',
            lastName: 'Name',
          ),
        );

        final http.Response expectedErrorResponse = http.Response(
          json.encode(<String, dynamic>{
            'error': <String, dynamic>{
              'code': 4,
              'message': 'coverage is still not 100%'
            },
            'code': 4,
          }),
          400,
        );
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: SILPrimaryButton(
                      onPressed: () {
                        actualResponse =
                            processHttpResponse(expectedErrorResponse, context);
                      },
                      text: processBtnText,
                    ),
                  ),
                ),
              );
            },
          ),
        );

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
          'Onboarding utils should process response '
          'with a 400 and a status code of 8', (WidgetTester tester) async {
        final http.Response expectedErrorResponse = http.Response(
          json.encode(<String, dynamic>{
            'code': 8,
            'message': 'coverage is still not 100%'
          }),
          400,
        );
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return Center(
                child: SILPrimaryButton(
                  onPressed: () {
                    actualResponse =
                        processHttpResponse(expectedErrorResponse, context);
                  },
                  text: processBtnText,
                ),
              );
            },
          ),
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

        expect(
          store.state.onboardingState!.phoneLogin!.invalidCredentials,
          true,
        );
      });

      testWidgets(
          'Onboarding utils should process response '
          'with a 500 and a status code of 8', (WidgetTester tester) async {
        final http.Response expectedErrorResponse = http.Response(
          json.encode(<String, dynamic>{
            'code': 11,
            'message': 'coverage is still not 100%'
          }),
          400,
        );
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return Center(
                child: SILPrimaryButton(
                  onPressed: () {
                    actualResponse =
                        processHttpResponse(expectedErrorResponse, context);
                  },
                  text: processBtnText,
                ),
              );
            },
          ),
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
          500,
        );
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return Center(
                child: SILPrimaryButton(
                  onPressed: () {
                    actualResponse =
                        processHttpResponse(expectedErrorResponse, context);
                  },
                  text: processBtnText,
                ),
              );
            },
          ),
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
          json.encode(<String, dynamic>{'error': 'timeout'}),
          408,
        );
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return Center(
                child: SILPrimaryButton(
                  onPressed: () {
                    actualResponse =
                        processHttpResponse(expectedErrorResponse, context);
                  },
                  text: processBtnText,
                ),
              );
            },
          ),
        );
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
          json.encode(<String, dynamic>{'error': 'timeout'}),
          522,
        );
        const String processBtnText = 'process response';
        late ProcessedResponse actualResponse;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return Center(
                child: SILPrimaryButton(
                  onPressed: () {
                    actualResponse =
                        processHttpResponse(expectedErrorResponse, context);
                  },
                  text: processBtnText,
                ),
              );
            },
          ),
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
          widget: Builder(
            builder: (BuildContext context) {
              return Center(
                child: SILPrimaryButton(
                  onPressed: () {
                    toggleLoadingIndicator(context: context, flag: testFlag);
                  },
                  text: processBtnText,
                ),
              );
            },
          ),
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
          widget: Builder(
            builder: (BuildContext context) {
              return Center(
                child: SILPrimaryButton(
                  onPressed: () {
                    toggleLoadingIndicator(
                      context: context,
                      flag: testFlag,
                      show: false,
                    );
                  },
                  text: processBtnText,
                ),
              );
            },
          ),
        );
        await tester.pump();
        expect(find.text(processBtnText), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(store.state.wait!.isWaitingFor(testFlag), false);
      });
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
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                actionWrapError(
                  error: SILException(
                    cause: changePINActionError,
                    message: changePINActionException,
                  ),
                  context: context,
                );
              },
            );
          },
        ),
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
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                actionWrapError(
                  error: SILException(
                    cause: changePINActionError,
                    message: changePINActionException,
                  ),
                  context: context,
                );
              },
            );
          },
        ),
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
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                actionWrapError(
                  error: SILException(
                    cause: noUserFound,
                    message: changePINActionException,
                  ),
                  context: context,
                );
              },
            );
          },
        ),
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
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                actionWrapError(
                  error: const UserException('Error'),
                  context: context,
                );
              },
            );
          },
        ),
      );
      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.text(UserFeedBackTexts.getErrorMessage()), findsOneWidget);
    });

    testWidgets(
        'actionWrapError should navigate to login page when exit CTA is tapped',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                actionWrapError(
                  error: SILException(
                    cause: 'some-other-cause',
                    message: 'some message',
                  ),
                  context: context,
                );
              },
            );
          },
        ),
      );
      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byKey(primaryBottomSheetButtonKey), findsOneWidget);

      await tester.tap(find.byKey(primaryBottomSheetButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
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
        widget: Builder(
          builder: (BuildContext context) {
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
          },
        ),
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
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                onPressed: () async {
                  clearAllFlags(context);
                  await Future<void>.delayed(const Duration(seconds: 5));
                },
              );
            },
          ),
        );

        await tester.pump();

        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(store.state.wait!.isWaitingFor(flag), false);
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
        InternetConnectivitySubject().connectivitySubject.valueOrNull,
        false,
      );
    });

    test('should test listenForConnectivityChanges show internet connection',
        () async {
      listenForConnectivityChanges(ConnectivityResult.wifi);
      expect(
        InternetConnectivitySubject().connectivitySubject.valueOrNull,
        true,
      );
    });
  });
  group('setUserPIN', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = null;
    });
    testWidgets('Navigates to Congratulations page if PINs are valid  ',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await setUserPIN(
                  confirmPIN: '0000',
                  context: context,
                  newPIN: '0000',
                  flavour: Flavour.CONSUMER.name,
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.byType(CongratulationsPage), findsOneWidget);
    });
    testWidgets('Shows snackbar when pins do not match',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await setUserPIN(
                  confirmPIN: '0001',
                  context: context,
                  newPIN: '0000',
                  flavour: Flavour.CONSUMER.name,
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pump(const Duration(seconds: 1));
      expect(find.text(pinMustMatchString), findsOneWidget);
    });

    testWidgets('should return home route for a user with a valid token',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      late String initialRoute;
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch(
              context,
              AuthStatusAction(
                isSignedIn: true,
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
          },
        ),
      );
      await tester.pump();
      // trigger the bottom sheet
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(initialRoute, BWRoutes.home);
    });
  });
}
