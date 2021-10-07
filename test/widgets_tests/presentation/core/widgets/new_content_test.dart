// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/presentation/core/widgets/new_content.dart';
import 'package:myafyahub/presentation/feed/feed_details.dart';
import 'package:myafyahub/presentation/feed/feed_item_widget.dart';
import '../../../../mocks.dart';

void main() {
  group('NewContent', () {
    testWidgets('should render feed items', (WidgetTester tester) async {
      final List<FeedDetails> mockListFeed = <FeedDetails>[];

      for (final Map<String, dynamic> element in mockFeed) {
        mockListFeed.add(FeedDetails.fromJson(element));
      }

      final Widget testWidget = MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
                body: NewContent(
              feedItems: mockListFeed,
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
