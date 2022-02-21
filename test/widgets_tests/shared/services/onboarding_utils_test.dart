// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/onboarding/set_nickname/pages/congratulations_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';
import './onboarding_utils_2_test.mocks.dart';

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

    group('should update user pin', () {});

    group('Login tests: process response', () {
      late Store<AppState> store;
      setUp(() {
        store = Store<AppState>(initialState: AppState.initial());
      });

      group('OnboardingPath', () {
        testWidgets('should navigate to security questions page',
            (WidgetTester tester) async {
          store.dispatch(UpdateCredentialsAction(isSignedIn: true));
          store.dispatch(
            UpdateUserProfileAction(
              termsAccepted: true,
              isPhoneVerified: true,
            ),
          );

          store.dispatch(
            UpdateOnboardingStateAction(
              isPhoneVerified: true,
              hasSetSecurityQuestions: false,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return SILPrimaryButton(
                  onPressed: () {
                    path = onboardingPath(appState: store.state).route;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(SILPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.securityQuestionsPage);
        });

        testWidgets('should navigate to terms and conditions page',
            (WidgetTester tester) async {
          store.dispatch(UpdateCredentialsAction(isSignedIn: true));
          store.dispatch(
            UpdateUserProfileAction(
              pinChangeRequired: true,
              termsAccepted: false,
              isPhoneVerified: true,
            ),
          );

          store.dispatch(
            UpdateOnboardingStateAction(
              isPhoneVerified: true,
              hasSetSecurityQuestions: false,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return SILPrimaryButton(
                  onPressed: () {
                    path = onboardingPath(appState: store.state).route;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(SILPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.termsAndConditions);
        });

        testWidgets('should navigate to set pin page',
            (WidgetTester tester) async {
          store.dispatch(UpdateCredentialsAction(isSignedIn: true));
          store.dispatch(
            UpdateUserProfileAction(
              pinChangeRequired: true,
              termsAccepted: true,
              isPhoneVerified: true,
            ),
          );

          store.dispatch(
            UpdateOnboardingStateAction(
              isPhoneVerified: true,
              hasSetSecurityQuestions: true,
              hasSetPin: false,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return SILPrimaryButton(
                  onPressed: () {
                    path = onboardingPath(appState: store.state).route;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(SILPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.createPin);
        });

        testWidgets('should navigate to congratulations page',
            (WidgetTester tester) async {
          store.dispatch(UpdateCredentialsAction(isSignedIn: true));
          store.dispatch(
            UpdateUserProfileAction(
              pinChangeRequired: true,
              termsAccepted: true,
              isPhoneVerified: true,
            ),
          );

          store.dispatch(
            UpdateOnboardingStateAction(
              isPhoneVerified: true,
              hasSetSecurityQuestions: true,
              hasSetPin: true,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return SILPrimaryButton(
                  onPressed: () {
                    path = onboardingPath(appState: store.state).route;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(SILPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.congratulationsPage);
        });

        testWidgets('should navigate to verify otp page',
            (WidgetTester tester) async {
          store.dispatch(UpdateCredentialsAction(isSignedIn: true));
          store.dispatch(
            UpdateUserProfileAction(
              pinChangeRequired: true,
              isPhoneVerified: false,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return SILPrimaryButton(
                  onPressed: () {
                    path = onboardingPath(appState: store.state).route;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(SILPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.verifySignUpOTP);
        });

        testWidgets('should navigate to login page page',
            (WidgetTester tester) async {
          store.dispatch(UpdateCredentialsAction(isSignedIn: false));

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return SILPrimaryButton(
                  onPressed: () {
                    path = onboardingPath(appState: store.state).route;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(SILPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.phoneLogin);
        });
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
                  flavour: Flavour.consumer.name,
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.byType(SetNickNamePage), findsOneWidget);
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
                  flavour: Flavour.consumer.name,
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
  });
}
