import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/presentation/core/widgets/feed_item_widget.dart';
import 'package:myafyahub/presentation/core/widgets/new_content.dart';

import '../../../../mocks.dart';

void main() {
  group('NewContent', () {
    testWidgets('should render feed items', (WidgetTester tester) async {
      final Widget testWidget = MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
                body: NewContent(
              feedItems: mockFeed,
            ));
          },
        ),
      );
      await tester.pumpWidget(testWidget);

      // feed items renders correctly
      expect(find.byType(FeedItem), findsWidgets);
    });
  });
}
