import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';
import 'package:myafyahub/presentation/onboarding/signup/widgets/create_account_page.dart';
import 'package:myafyahub/presentation/onboarding/widgets/scaffold_header.dart';

import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shared_ui_components/inputs.dart';

import '../../../../../mock_utils.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';
import '../../../../../test_utils.dart';

void main() {
  // initial set up
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('Phone signup page', () {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    testWidgets('should render correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return Scaffold(body: CreateAccountPage());
        }),
      );

      await tester.pump();

      expect(find.byType(SILPhoneInput), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);

      final State<StatefulWidget> _state = tester.allStates.singleWhere(
          (State<StatefulWidget> el) =>
              el.toString() == 'CreateAccountPageState');

      expect(_state, isNotNull);

      final CreateAccountPageState state = _state as CreateAccountPageState;

      expect(
          () => state.phoneNumberUsageBottomSheetCallback(), returnsNormally);
    });

    testWidgets('should attempt a back navigation from the phone signup page',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue = tabletLandscape;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return Scaffold(body: CreateAccountPage());
        }),
      );

      await tester.pump();

      expect(find.byType(SILPhoneInput), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
      expect(find.byType(ScaffoldHeader), findsOneWidget);

      await tester.tap(find.byKey(backButtonToLanding));
      await tester.pumpAndSettle();

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should not show an error alert box since state is reset upon mounting PhoneSignUp',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          StoreProvider.dispatch(
              context, PhoneSignUpStateAction(accountExists: true));
          return Scaffold(body: CreateAccountPage());
        }),
      );

      await tester.pump();

      expect(find.byType(SILPhoneInput), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
      expect(find.byType(ScaffoldHeader), findsOneWidget);
      expect(find.byKey(backButtonToLanding), findsOneWidget);
      expect(find.byType(ErrorAlertBox), findsNothing);
      expect(store.state.miscState!.phoneSignUp!.accountExists, false);
    });

    testWidgets('should fill in the phone signup page',
        (WidgetTester tester) async {
      final http.Response response =
          http.Response(json.encode(<String, dynamic>{'otp': testOTP}), 200);

      when(baseGraphQlClientMock.callRESTAPI(
              endpoint:
                  'https://profile-testing.healthcloud.co.ke/verify_phone',
              variables: <String, dynamic>{
                'phoneNumber': '+254710000000',
                'appId': testAppSignature
              },
              method: 'POST'))
          .thenAnswer((_) => Future<http.Response>.value(response));

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(<String, dynamic>{'otp': testOTP});

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: CreateAccountPage(),
      );

      await tester.pump();

      expect(find.byType(SILPhoneInput), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);

      await store.dispatch(PhoneSignUpStateAction(accountExists: true));

      await tester.tap(find.byType(SILPhoneInput));
      await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(enterSignUpNumberButtonKey));

      expect(
          store.state.miscState!.phoneSignUp!.acceptCommunicationTerms, true);
      expect(store.state.miscState!.phoneSignUp!.phoneNumber, '+254710000000');
    });

    testWidgets('user must accept to allow communication via phone',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: CreateAccountPage(),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(SILPhoneInput));
      await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(enterSignUpNumberButtonKey));

      await tester.pumpAndSettle();

      expect(
          find.text(
            'You have to allow communication to continue',
          ),
          findsOneWidget);
    });

    testWidgets('should show error when provided phone number is not new',
        (WidgetTester tester) async {
      final http.Response response =
          http.Response(json.encode(<String, dynamic>{'code': 4}), 400);

      when(baseGraphQlClientMock.callRESTAPI(
              endpoint:
                  'https://profile-testing.healthcloud.co.ke/verify_phone',
              variables: <String, dynamic>{'phoneNumber': '+254710000000'},
              method: 'POST'))
          .thenAnswer((_) => Future<http.Response>.value(response));

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(<String, dynamic>{'otp': testOTP});

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: CreateAccountPage(),
      );

      await tester.pump();

      expect(find.byType(SILPhoneInput), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);

      await tester.tap(find.byType(SILPhoneInput));
      await tester.enterText(find.byType(SILPhoneInput), testPhoneNumber);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(enterSignUpNumberButtonKey));

      await tester.pumpAndSettle();

      store.dispatch(PhoneSignUpStateAction(accountExists: true));

      await tester.pumpAndSettle();
    });

    testWidgets('should show error message when signUpPhoneNumber is null',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: CreateAccountPage(),
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(enterSignUpNumberButtonKey));
      await tester.pumpAndSettle();

      expect(
          find.text(
            'A valid phone number is required',
          ),
          findsOneWidget);
    });
  });
}
