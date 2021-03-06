// Dart imports:
import 'dart:io';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/notifications/notifications_page.dart';

import '../../../../../mock_image_http_client.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

// Flutter imports:

void main() {
  group('AppBarNotification', () {
    const String title = 'Community';

    late Store<AppState> store;

    setUp(() async {
      final String dir = Directory.current.path;
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
      store.dispatch(
        UpdateUserProfileAction(
          avatar: '$dir/test/tests_resources/test_file.png',
          firstName: 'Test',
          lastName: 'Name',
        ),
      );
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
    });

    testWidgets(
        'should navigate to notifications page when notification icon '
        'is tapped', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const CustomAppBar(title: title),
      );

      await tester.tap(find.byKey(appBarNotificationKey));
      await tester.pumpAndSettle();

      expect(find.byType(NotificationsPage), findsOneWidget);
    });
  });
}
