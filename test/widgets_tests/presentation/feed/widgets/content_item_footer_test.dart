// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/presentation/feed/widgets/content_item_footer.dart';

void main() {
  group('ContentItemFooter', () {
    testWidgets(
      'shows the date published and the read time of an article correctly',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: ContentItemFooter(
                datePublished: '2021-08-23T06:42:05.085216Z',
                estimatedReadingTime: 180,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('23 August 2021'), findsOneWidget);
        expect(find.text('3 minutes read'), findsOneWidget);
      },
    );
  });
}
