// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/infrastructure/connectivity/mobile_connectivity_status.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/onboarding/set_new_pin/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/set_nickname/pages/congratulations_page.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('CreateNewPINPage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = null;
    });

    testWidgets('PIN field validates correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: CreateNewPINPage(
          connectivityStatus: MobileConnectivityStatus(
            checkInternetCallback: () async => true,
          ),
          phoneNumber: '+254712345678',
        ),
      );

      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(pinInputField, findsOneWidget);
      expect(saveAndContinueButton, findsOneWidget);

      await tester.ensureVisible(saveAndContinueButton);
      await tester.tap(saveAndContinueButton);
      await tester.pumpAndSettle();
      expect(find.text('A PIN is required'), findsNWidgets(2));
    });

    testWidgets('confirm PIN validates correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: CreateNewPINPage(
          connectivityStatus: MobileConnectivityStatus(
            checkInternetCallback: () async => true,
          ),
          phoneNumber: '+254712345678',
        ),
      );
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder confirmPinInputField = find.byKey(confirmPinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(confirmPinInputField, findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1234');
      await tester.showKeyboard(confirmPinInputField);
      await tester.enterText(confirmPinInputField, '1243');
      await tester.ensureVisible(saveAndContinueButton);

      await tester.tap(saveAndContinueButton);
      await tester.pump(const Duration(seconds: 1));
      expect(find.text(pinMustMatchString), findsOneWidget);
    });

    testWidgets('Navigates to Congratulations page if PINs are valid  ',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: CreateNewPINPage(
          connectivityStatus: MobileConnectivityStatus(
            checkInternetCallback: () async => true,
          ),
          phoneNumber: '+254712345678',
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder confirmPinInputField = find.byKey(confirmPinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(confirmPinInputField, findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '0000');
      await tester.showKeyboard(confirmPinInputField);
      await tester.enterText(confirmPinInputField, '0000');
      await tester.ensureVisible(saveAndContinueButton);
      await tester.tap(saveAndContinueButton);
      await tester.pumpAndSettle();
      expect(find.byType(SetNickNamePage), findsOneWidget);
    });

    testWidgets('Navigates to Login page if PINs are valid for reset pin  ',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'resetPIN': true}
          }),
          200,
        ),
      );

      final Store<AppState> customStore =
          Store<AppState>(initialState: AppState.initial());
      customStore.dispatch(UpdateOnboardingStateAction(isResetPin: true));
      await buildTestWidget(
        tester: tester,
        store: customStore,
        client: mockShortSILGraphQlClient,
        widget: CreateNewPINPage(
          connectivityStatus: MobileConnectivityStatus(
            checkInternetCallback: () async => true,
          ),
          phoneNumber: '+254712345678',
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder confirmPinInputField = find.byKey(confirmPinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(confirmPinInputField, findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '0000');
      await tester.showKeyboard(confirmPinInputField);
      await tester.enterText(confirmPinInputField, '0000');
      await tester.ensureVisible(saveAndContinueButton);
      await tester.tap(saveAndContinueButton);
      await tester.pumpAndSettle();
      expect(find.byType(LoginPage), findsWidgets);
    });
    testWidgets('should show No Internet text when there is no connectivity',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: CreateNewPINPage(
          connectivityStatus: MobileConnectivityStatus(
            checkInternetCallback: () async => false,
          ),
          phoneNumber: '+254712345678',
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder confirmPinInputField = find.byKey(confirmPinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(confirmPinInputField, findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '0000');
      await tester.showKeyboard(confirmPinInputField);
      await tester.enterText(confirmPinInputField, '0000');
      await tester.ensureVisible(saveAndContinueButton);
      await tester.tap(saveAndContinueButton);
      await tester.pump(const Duration(seconds: 2));
      expect(find.text(noInternetConnection), findsOneWidget);
    });

    testWidgets('should render SILPlatformLoader', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            store.dispatch(WaitAction<AppState>.add('resume_with_pin'));
            return CreateNewPINPage(
              phoneNumber: '+254712345678',
            );
          },
        ),
      );

      await tester.pumpAndSettle();
      store.dispatch(WaitAction<AppState>.add(createPinFlag));
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
