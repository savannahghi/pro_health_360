// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/my_afya_hub_phone_login_page.dart';

void main() {
  group('MyAfyaHubLoginPage', () {
    testWidgets('MyAfyaHubCountryPicker should render a list of countries',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPhoneLoginPage();
              },
            ),
            // body:
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder phoneInputField = find.byKey(textFormFieldKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);

      expect(phoneInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '0725999999');
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(selectCountryKey));
      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsNWidgets(6));
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('+254'), findsOneWidget);
    });
    testWidgets('should validate Phone Number', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPhoneLoginPage();
              },
            ),
            // body:
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder phoneInputField = find.byKey(textFormFieldKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);
      expect(phoneInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('Phone number is required'), findsOneWidget);
      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '123456');
      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '1234567890');
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('Phone number is required'), findsNothing);
    });
    testWidgets('should validate PIN', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return MyAfyaHubPhoneLoginPage();
              },
            ),
            // body:
          ),
        ),
      );
      await tester.pumpAndSettle();
      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);
      expect(pinInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('A PIN is required'), findsOneWidget);
      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '123');
      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      await tester.showKeyboard(pinInputField);
      await tester.enterText(pinInputField, '1234');
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('A PIN is required'), findsNothing);
    });
  });
}
