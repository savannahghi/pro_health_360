// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:shared_ui_components/src/inputs.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:myafyahub/presentation/onboarding/signup/create_pin_page.dart';
import '../../../../mock_utils.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';
import '../../../../test_utils.dart';

void main() {
  group('CreatePinPage', () {
    late Store<AppState> store;

    // initial set up
    setupFirebaseAuthMocks();

    setUp(() async {
      await Firebase.initializeApp();
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('should render correctly and show error snackbar',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const CreatePinPage(),
      );

      await tester.pump();

      final Finder continueButton = find.byKey(continueKey);

      expect(find.byType(Scaffold), findsWidgets);

      expect(continueButton, findsOneWidget);

      await tester.tap(continueButton);
      await tester.pumpAndSettle();
    });

    testWidgets(
        'should render correctly and navigate to confirm create pin page',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const CreatePinPage(),
      );

      await tester.pump();

      final Finder continueButton = find.byKey(continueKey);
      final Finder enterCodeInputField = find.byWidgetPredicate(
          (Widget w) => w is SILFormTextField && w.key == enterPinKey);
      final Finder confirmCodeInputField = find.byWidgetPredicate(
          (Widget w) => w is SILFormTextField && w.key == confirmPinKey);

      expect(find.byType(Scaffold), findsWidgets);
      expect(continueButton, findsOneWidget);

      expect(enterCodeInputField, findsOneWidget);
      await tester.tap(enterCodeInputField);
      await tester.enterText(enterCodeInputField, '123');
      await tester.tap(confirmCodeInputField);
      await tester.enterText(confirmCodeInputField, '123');
      expect(confirmCodeInputField, findsOneWidget);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      // verify(mockObserver.didPush(sampleRoute, any));
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'Create pin page renders correctly and navigates to confirm PIN match',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              EndPointsContextSubject().contexts.add(testAppContexts);

              StoreProvider.dispatch(
                context,
                PhoneSignUpStateAction(
                    phoneNumber: testPhoneNumber,
                    otp: testOTP,
                    invalidCredentials: true),
              );

              return const CreatePinPage();
            },
          ));

      await tester.pump();

      final Finder continueButton = find.byKey(continueKey);
      final Finder enterCodeInputField = find.byWidgetPredicate(
          (Widget w) => w is SILFormTextField && w.key == enterPinKey);
      final Finder confirmCodeInputField = find.byWidgetPredicate(
          (Widget w) => w is SILFormTextField && w.key == confirmPinKey);

      expect(find.byType(Scaffold), findsWidgets);
      expect(continueButton, findsOneWidget);

      expect(enterCodeInputField, findsOneWidget);
      await tester.tap(enterCodeInputField);
      await tester.enterText(enterCodeInputField, '1234');
      await tester.pumpAndSettle();

      expect(confirmCodeInputField, findsOneWidget);
      await tester.tap(confirmCodeInputField);
      await tester.enterText(confirmCodeInputField, '9090');
      await tester.pumpAndSettle();

      expect(find.byType(ErrorAlertBox), findsOneWidget);
      await tester.pumpAndSettle();

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('should signup with phone number', (WidgetTester tester) async {
      final http.Response response = http.Response(
        json.encode(createUserMock()),
        200,
      );

      when(baseGraphQlClientMock.callRESTAPI(
              endpoint:
                  'https://onboarding-testing.savannahghi.org/create_user_by_phone',
              variables: <String, dynamic>{
                'phoneNumber': '0710000000',
                'pin': '1234',
                'flavour': 'CONSUMER',
                'otp': '123456',
                'appVersion': APPVERSION
              },
              method: 'POST'))
          .thenAnswer(
        (_) => Future<http.Response>.value(
          response,
        ),
      );

      when(baseGraphQlClientMock.toMap(response)).thenReturn(createUserMock());

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              EndPointsContextSubject().contexts.add(testAppContexts);

              StoreProvider.dispatch(
                context,
                PhoneSignUpStateAction(
                    phoneNumber: testPhoneNumber, otp: testOTP),
              );

              return const CreatePinPage();
            },
          ));

      await tester.pump();

      expect(find.byType(Scaffold), findsWidgets);

      final Finder enterCodeInputField = find.byWidgetPredicate(
          (Widget w) => w is SILFormTextField && w.key == enterPinKey);
      final Finder confirmCodeInputField = find.byWidgetPredicate(
          (Widget w) => w is SILFormTextField && w.key == confirmPinKey);

      expect(enterCodeInputField, findsOneWidget);
      await tester.tap(enterCodeInputField);
      await tester.enterText(enterCodeInputField, testPin);

      expect(confirmCodeInputField, findsOneWidget);
      await tester.tap(confirmCodeInputField);
      await tester.enterText(confirmCodeInputField, testPin);

      expect(find.byKey(continueKey), findsOneWidget);
      await tester.tap(find.byKey(continueKey));
      await tester.pump(const Duration(minutes: 35));

      expect(store.state.userProfileState!.auth!.refreshToken, isNotNull);
      expect(store.state.userProfileState!.auth!.refreshToken,
          createUserMock()['auth']['refresh_token']);
    });

    testWidgets('should change pin', (WidgetTester tester) async {
      when(baseGraphQlClientMock
          .query(updateUserPinMutation, <String, dynamic>{})).thenAnswer(
        (_) => Future<http.Response>.value(
            http.Response(json.encode(changePINMock()), 201)),
      );

      when(baseGraphQlClientMock.toMap(any)).thenReturn(changePINMock());

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            EndPointsContextSubject().contexts.add(testAppContexts);

            StoreProvider.dispatch(
              context,
              PhoneSignUpStateAction(
                  phoneNumber: testPhoneNumber, otp: testOTP),
            );

            StoreProvider.dispatch(
              context,
              UpdatePinStatusAction(isChangingPin: true),
            );

            return const CreatePinPage();
          },
        ),
      );

      await tester.pump();

      expect(find.byType(Scaffold), findsWidgets);

      final Finder enterCodeInputField = find.byWidgetPredicate(
          (Widget w) => w is SILFormTextField && w.key == enterPinKey);
      final Finder confirmCodeInputField = find.byWidgetPredicate(
          (Widget w) => w is SILFormTextField && w.key == confirmPinKey);

      expect(enterCodeInputField, findsOneWidget);
      await tester.tap(enterCodeInputField);
      await tester.enterText(enterCodeInputField, testPin);

      expect(confirmCodeInputField, findsOneWidget);
      await tester.tap(confirmCodeInputField);
      await tester.enterText(confirmCodeInputField, testPin);

      expect(find.byKey(continueKey), findsOneWidget);
    });

    testWidgets('should reset pin', (WidgetTester tester) async {
      when(baseGraphQlClientMock
          .query(updateUserPinMutation, <String, dynamic>{})).thenAnswer(
        (_) => Future<http.Response>.value(
          http.Response(
            json.encode(changePINMock()),
            201,
          ),
        ),
      );

      when(baseGraphQlClientMock.toMap(any)).thenReturn(changePINMock());

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              EndPointsContextSubject().contexts.add(testAppContexts);

              StoreProvider.dispatch(
                context,
                PhoneSignUpStateAction(
                    phoneNumber: testPhoneNumber, otp: testOTP),
              );

              StoreProvider.dispatch(
                context,
                UpdatePinStatusAction(forgotPIN: true),
              );

              return const CreatePinPage();
            },
          ));

      await tester.pump();

      expect(find.byType(Scaffold), findsWidgets);

      final Finder enterCodeInputField = find.byWidgetPredicate(
          (Widget w) => w is SILFormTextField && w.key == enterPinKey);
      final Finder confirmCodeInputField = find.byWidgetPredicate(
          (Widget w) => w is SILFormTextField && w.key == confirmPinKey);

      expect(enterCodeInputField, findsOneWidget);
      await tester.tap(enterCodeInputField);
      await tester.enterText(enterCodeInputField, testPin);

      expect(confirmCodeInputField, findsOneWidget);
      await tester.tap(confirmCodeInputField);
      await tester.enterText(confirmCodeInputField, testPin);

      expect(find.byKey(continueKey), findsOneWidget);
    });

    testWidgets('should render SILPlatformLoader', (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              EndPointsContextSubject().contexts.add(testAppContexts);
              toggleLoadingIndicator(context: context, flag: createPinFlag);
              StoreProvider.dispatch(
                context,
                PhoneSignUpStateAction(
                    phoneNumber: testPhoneNumber,
                    otp: testOTP,
                    invalidCredentials: false),
              );

              return const CreatePinPage();
            },
          ));

      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsNothing);
    });
  });
}
