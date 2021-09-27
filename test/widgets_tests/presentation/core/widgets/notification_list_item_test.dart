import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
                listItemColor: Colors.black,
                description:
                    'You have a tele consult with doctor WellMan. Click ',
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
                listItemColor: Colors.black,
                description:
                    'You have a tele consult with doctor WellMan. Click ',
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
