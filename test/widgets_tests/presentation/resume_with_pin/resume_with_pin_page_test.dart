import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/presentation/resume_with_pin/resume_with_pin_page.dart';

void main() {
  group('ResumeWithPinPage', () {
    testWidgets('description', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: ResumeWithPinPage())),
      );

      await tester.enterText(
        find.byKey(const Key('pin_input_field')),
        '123456',
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('logout_button')));
      await tester.pumpAndSettle();

      expect(find.byType(PINInputField), findsOneWidget);
    });
  });
}
