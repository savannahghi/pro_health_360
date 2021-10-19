// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/icon_details.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_actions.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/widgets/notification_list_item.dart';

void main() {
  group('NotificationListItem', () {
    testWidgets('should render NotificationListItem without calendar',
        (WidgetTester tester) async {
      final Widget testWidget = MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: NotificationListItem(
                icon: IconDetails(
                  iconUrlSvgPath: teleConsultVideoNotificationIcon,
                ),
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
            return Scaffold(
              body: NotificationListItem(
                icon: IconDetails(
                  iconUrlSvgPath: teleConsultVideoNotificationIcon,
                ),
                description:
                    'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
                date: 'July 12 2021',
                actions: <NotificationActions>[
                  NotificationActions(
                    icon: IconDetails(iconUrlSvgPath: calendarIcon),
                    name: 'Add to Calendar',
                    route: '',
                  )
                ],
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
