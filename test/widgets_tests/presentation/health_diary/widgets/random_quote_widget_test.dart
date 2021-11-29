import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/health_diary/widgets/random_quote_widget.dart';

void main() {
  testWidgets(
    'should show a random quote from the backend',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RandomQuoteWidget(),
          ),
        ),
      );

      expect(find.text(randomQuoteText), findsOneWidget);
      expect(find.text(randomQuoteAuthor), findsOneWidget);
    },
  );
}
