// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

// Project imports:
import 'package:myafyahub/presentation/core/widgets/pin_input_field_widget.dart';

void main() {
  testWidgets('PINInputField should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PINInputField(
            maxLength: null,
            onDone: (String val) {},
            onTextChanged: (String val) {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.showKeyboard(find.byType(PINInputField));
    await tester.enterText(find.byType(PINInputField), '1234');
    await tester.pumpAndSettle();

    final Finder pinCodeTextField = find.byType(PinCodeTextField);
    expect(pinCodeTextField, findsOneWidget);
  });
}
