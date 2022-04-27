// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/notifications/notification_list_item.dart'
    as local;

void main() {
  group('NotificationListItem', () {
    testWidgets('should render NotificationListItem without actions',
        (WidgetTester tester) async {
      final Widget testWidget = MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: local.NotificationListItem(
                notificationDetails: NotificationDetails(
                  body: 'Your Teleconsult with Dr Tibu for 11am has been set. '
                      'Click this link to join ',
                  createdAt: 'July 12 2021',
                ),
              ),
            );
          },
        ),
      );
      await tester.pumpWidget(testWidget);

      await tester.pumpAndSettle();

      // verify Notification List Item renders correctly
      expect(find.byType(local.NotificationListItem), findsOneWidget);

      expect(find.text('Add to Calendar'), findsNothing);
    });

    testWidgets('should render NotificationListItem with actions',
        (WidgetTester tester) async {
      final Widget testWidget = MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: local.NotificationListItem(
                notificationDetails: NotificationDetails(
                  body: 'Your Teleconsult with Dr Tibu for 11am has been set. '
                      'Click this link to join ',
                  createdAt: 'July 12 2021',
                  actions: <NotificationActions>[
                    NotificationActions(
                      icon: IconDetails(iconUrlSvgPath: calendarIcon),
                      name: 'Add to Calendar',
                      route: '',
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
      await tester.pumpWidget(testWidget);

      await tester.pumpAndSettle();

      // verify Notification List Item renders correctly
      expect(find.byType(local.NotificationListItem), findsOneWidget);

      expect(find.text('Add to Calendar'), findsOneWidget);
    });
  });
}
