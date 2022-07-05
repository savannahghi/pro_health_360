// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/my_health/pages/appointments_page.dart';
import 'package:pro_health_360/presentation/notifications/notification_list_item.dart'
    as local;

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  late Store<AppState> store;

  group('NotificationListItem', () {
    setUp(() async {
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      store = Store<AppState>(
        initialState: AppState.initial(),
      );
    });
    testWidgets('should render NotificationListItem without actions',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: local.NotificationListItem(
          notificationDetails: NotificationDetails(
            body: 'Your Teleconsult with Dr Tibu for 11am has been set. '
                'Click this link to join ',
            createdAt: 'July 12 2021',
            type: NotificationType.COMMUNITIES,
          ),
        ),
      );

      // verify Notification List Item renders correctly
      expect(find.byType(local.NotificationListItem), findsOneWidget);

      expect(find.text('Add to Calendar'), findsNothing);
    });

    testWidgets('should render NotificationListItem with actions',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: local.NotificationListItem(
          notificationDetails: NotificationDetails(
            body: 'Your Teleconsult with Dr Tibu for 11am has been set. '
                'Click this link to join ',
            createdAt: 'July 12 2021',
            type: NotificationType.APPOINTMENT,
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
      // verify Notification List Item renders correctly
      expect(find.byType(local.NotificationListItem), findsOneWidget);

      await tester.tap(find.byKey(notificationItemActionKey));
      await tester.pumpAndSettle();
      expect(find.byType(AppointmentsPage), findsOneWidget);
    });
  });
}
