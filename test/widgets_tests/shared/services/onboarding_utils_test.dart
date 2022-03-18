// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/onboarding/set_nickname/pages/set_nickname_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('OnboardingUtils', () {
    late MockGraphQlClient mockGraphQlClient;

    const MethodChannel('plugins.flutter.io/url_launcher')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'launch') {
        return Future<bool>.value(true); // set initial values here if desired
      }
      return null;
    });

    setUp(() {
      mockGraphQlClient = MockGraphQlClient();
    });

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
              currentOnboardingStage: CurrentOnboardingStage.Signup,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    path = navPathConfig(appState: store.state).nextRoute;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(MyAfyaHubPrimaryButton));
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
              currentOnboardingStage: CurrentOnboardingStage.Signup,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    path = navPathConfig(appState: store.state).nextRoute;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(MyAfyaHubPrimaryButton));
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
              currentOnboardingStage: CurrentOnboardingStage.Signup,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    path = navPathConfig(appState: store.state).nextRoute;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(MyAfyaHubPrimaryButton));
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
              currentOnboardingStage: CurrentOnboardingStage.Signup,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    path = navPathConfig(appState: store.state).nextRoute;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(MyAfyaHubPrimaryButton));
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

          store.dispatch(
            UpdateOnboardingStateAction(
              currentOnboardingStage: CurrentOnboardingStage.Signup,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    path = navPathConfig(appState: store.state).nextRoute;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(MyAfyaHubPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.verifySignUpOTP);
        });

        testWidgets('should navigate to home page upon successful sign up',
            (WidgetTester tester) async {
          final MockShortGraphQlClient mockShortSILGraphQlClient =
              MockShortGraphQlClient.withResponse(
            'idToken',
            'endpoint',
            Response(
              json.encode(<String, dynamic>{
                'data': <String, dynamic>{
                  'fetchRecentContent': <dynamic>[],
                  'fetchSuggestedGroups': <dynamic>[]
                }
              }),
              201,
            ),
          );

          store.dispatch(
            UpdateUserProfileAction(
              pinChangeRequired: true,
              isPhoneVerified: true,
              termsAccepted: true,
            ),
          );

          store.dispatch(
            UpdateOnboardingStateAction(
              currentOnboardingStage: CurrentOnboardingStage.Signup,
              isPhoneVerified: true,
              hasSetSecurityQuestions: true,
              isPINChanged: true,
              hasSetNickName: true,
              hasSetPin: true,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockShortSILGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    path = navPathConfig(appState: store.state).nextRoute;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(MyAfyaHubPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.home);
        });

        testWidgets('should navigate to resume with PIN page when app resumes',
            (WidgetTester tester) async {
          store.dispatch(UpdateCredentialsAction(isSignedIn: true));
          store.dispatch(
            UpdateUserProfileAction(
              pinChangeRequired: true,
              isPhoneVerified: false,
            ),
          );

          store.dispatch(
            UpdateOnboardingStateAction(
              currentOnboardingStage: CurrentOnboardingStage.Login,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    path = navPathConfig(
                      appState: store.state,
                      calledOnResume: true,
                    ).nextRoute;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(MyAfyaHubPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.resumeWithPin);
        });

        testWidgets(
            'should navigate to login page after successful PIN change '
            'after expiry', (WidgetTester tester) async {
          store.dispatch(
            UpdateOnboardingStateAction(
              currentOnboardingStage: CurrentOnboardingStage.PINExpired,
              isPINChanged: true,
              isPhoneVerified: true,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    path = navPathConfig(appState: store.state).nextRoute;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(MyAfyaHubPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.phoneLogin);
        });

        testWidgets(
            'should navigate to login page after successful PIN change '
            'after PIN reset', (WidgetTester tester) async {
          store.dispatch(
            UpdateOnboardingStateAction(
              currentOnboardingStage: CurrentOnboardingStage.ChangePIN,
              isPINChanged: true,
              isPhoneVerified: true,
            ),
          );

          String path = '';

          await buildTestWidget(
            tester: tester,
            store: store,
            client: mockGraphQlClient,
            widget: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    path = navPathConfig(appState: store.state).nextRoute;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(MyAfyaHubPrimaryButton));
          await tester.pumpAndSettle();

          expect(path, AppRoutes.phoneLogin);
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
                return MyAfyaHubPrimaryButton(
                  onPressed: () {
                    path = navPathConfig(appState: store.state).nextRoute;
                  },
                );
              },
            ),
          );

          await tester.tap(find.byType(MyAfyaHubPrimaryButton));
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
            return MyAfyaHubPrimaryButton(
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

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
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
              return MyAfyaHubPrimaryButton(
                onPressed: () async {
                  clearAllFlags(context);
                  await Future<void>.delayed(const Duration(seconds: 5));
                },
              );
            },
          ),
        );

        await tester.pump();

        await tester.tap(find.byType(MyAfyaHubPrimaryButton));
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
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                await setUserPIN(
                  confirmPIN: '0000',
                  context: context,
                  newPIN: '0000',
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
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
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                await setUserPIN(
                  confirmPIN: '0001',
                  context: context,
                  newPIN: '0000',
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pump(const Duration(seconds: 1));
      expect(find.text(pinMustMatchString), findsOneWidget);
    });
  });
}
