// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/app_bar_back_button.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/app_bar_notification.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/app_bar_user.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/notifications/notifications_page.dart';
import '../../../../../mock_image_http_client.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('CustomAppBar', () {
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

    testWidgets('should render correctly with profile initials',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return CustomAppBar(
              title: title,
              showBackButton: false,
              trailingWidget: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(comingSoonText)),
                  );
                },
              ),
            );
          },
        ),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.byType(AppbarUser), findsOneWidget);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('should show initials when profile picture is absent',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return CustomAppBar(
              title: title,
              showBackButton: false,
              trailingWidget: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(comingSoonText)),
                  );
                },
              ),
            );
          },
        ),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.byType(AppbarUser), findsOneWidget);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('should show profile picture', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return CustomAppBar(
              title: title,
              showBackButton: false,
              trailingWidget: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(comingSoonText)),
                  );
                },
              ),
            );
          },
        ),
      );

      expect(find.byType(AppbarUser), findsOneWidget);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('should show back button and pop when back button is tapped',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const CustomAppBar(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppBarBackButton), findsOneWidget);
      expect(find.byType(AppBarNotification), findsOneWidget);

      // navigate to notifications page and back
      await tester.tap(find.byKey(appBarNotificationKey, skipOffstage: false));
      await tester.pumpAndSettle();

      expect(find.byType(NotificationsPage), findsOneWidget);

      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(AppBarBackButton), findsOneWidget);
      expect(find.byType(AppBarNotification), findsOneWidget);
    });
  });
}
