// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/widgets/notification_list_item.dart';

void main() {
  group('NotificationListItem', () {
    testWidgets('should render NotificationListItem without calendar',
        (WidgetTester tester) async {
      final Widget testWidget = MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return const Scaffold(
              body: NotificationListItem(
                svgPath: helpCenterButtonImageUrl,
                description:
                    'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
                date: 'July 12 2021',
              ),
            );
          },
        ),
      );
      await tester.pumpWidget(testWidget);

      await tester.pumpAndSettle();

      // verify Notification List Item renders correctly
      expect(find.byType(NotificationListItem), findsOneWidget);

      expect(find.text('Add to Calendar'), findsNothing);
    });

    testWidgets('should render NotificationListItem with calendar',
        (WidgetTester tester) async {
      final Widget testWidget = MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return const Scaffold(
              body: NotificationListItem(
                svgPath: helpCenterButtonImageUrl,
                isAlternateNotification: true,
                description:
                    'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
                date: 'July 12 2021',
                calendarDate: true,
              ),
            );
          },
        ),
      );
      await tester.pumpWidget(testWidget);

      await tester.pumpAndSettle();

      // verify Notification List Item renders correctly
      expect(find.byType(NotificationListItem), findsOneWidget);

      expect(find.text('Add to Calendar'), findsOneWidget);
    });
  });
}
