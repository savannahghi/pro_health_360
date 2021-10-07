// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/error_alert_box.dart';

void main() {
  testWidgets('error container should be rendered properly',
      (WidgetTester tester) async {
    const String errorMsgText = 'some error message ';
    const String actionSpanText = 'or some other error message';

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ErrorAlertBox(
          message: errorMsgText,
          actionSpan: TextSpan(text: actionSpanText),
        ),
      ),
    ));

    expect(find.byKey(errorAlertBoxKey), findsOneWidget);
    expect(find.byType(RichText), findsOneWidget);

    final Finder widgetFinder = find.byKey(errorAlertBoxKey);
    final Finder richTextFinder =
        find.descendant(of: widgetFinder, matching: find.byType(RichText));
    final RichText errorSpanTextWidget =
        richTextFinder.evaluate().first.widget as RichText;
    final String errorSpanText = errorSpanTextWidget.text.toPlainText();
    expect(errorSpanText, errorMsgText + actionSpanText);
  });
}
