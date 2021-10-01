import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/widgets/notification_list_item.dart';
import 'package:myafyahub/presentation/notifications/notifications_page.dart';

import '../../../test_helpers.dart';

void main() {
  group('NotificationsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should render notifications as a list',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: NotificationsPage(
            notifications: notifications,
          ));

      await tester.pumpAndSettle();

      expect(find.byType(NotificationListItem), findsNWidgets(3));
    });
  });
}
