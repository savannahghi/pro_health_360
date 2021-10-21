// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/congratulations_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';

void main() {
  group('LoginPage', () {
    testWidgets('PIN field validates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CreateNewPINPage(),
        ),
      );
      await tester.pumpAndSettle();

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
      await tester.pumpWidget(
        MaterialApp(
          home: CreateNewPINPage(),
        ),
      );
      await tester.pumpAndSettle();
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
      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          home: CreateNewPINPage(),
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder confirmPinInputField = find.byKey(confirmPinInputKey);
      final Finder saveAndContinueButton =
          find.byKey(createPINContinueButtonKey);

      expect(confirmPinInputField, findsOneWidget);

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1234');
      await tester.showKeyboard(confirmPinInputField);
      await tester.enterText(confirmPinInputField, '1234');
      await tester.ensureVisible(saveAndContinueButton);
      await tester.tap(saveAndContinueButton);
      await tester.pumpAndSettle();
      expect(find.byType(CongratulationsPage), findsOneWidget);
    });
  });
}
