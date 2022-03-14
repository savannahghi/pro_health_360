// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/infrastructure/connectivity/mobile_connectivity_status.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/onboarding/set_new_pin/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/set_nickname/pages/set_nickname_page.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('CreateNewPINPage', () {
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
        widget: CreateNewPINPage(
          connectivityStatus: MobileConnectivityChecker(
            checkInternetCallback: () async => true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byType(CustomTextField).first;
      final Finder confirmPinInputField = find.byType(CustomTextField).last;
      final Finder saveAndContinueButton =
          find.byType(MyAfyaHubPrimaryButton);

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
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
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
          connectivityStatus: MobileConnectivityChecker(
            checkInternetCallback: () async => true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byType(CustomTextField).first;
      final Finder confirmPinInputField = find.byType(CustomTextField).last;
      final Finder saveAndContinueButton = find.byType(MyAfyaHubPrimaryButton);

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
          connectivityStatus: MobileConnectivityChecker(
            checkInternetCallback: () async => false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byType(CustomTextField).first;
      final Finder confirmPinInputField = find.byType(CustomTextField).last;
      final Finder saveAndContinueButton = find.byType(MyAfyaHubPrimaryButton);

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

  });
}
