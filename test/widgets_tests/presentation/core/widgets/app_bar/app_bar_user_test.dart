// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/app_bar_user.dart';
import '../../../../../mock_image_http_client.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';
import '../../../../../test_utils.dart';

void main() {
  group('AppbarUser', () {
    late Store<AppState> store;

    setUp(() {
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
    });

    testWidgets('should render AppBarUSer widget correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return const AppbarUser();
          },
        ),
      );

      await fireEvent(tester);

      final Finder silAppBarGestureString = find.byKey(appBarUserKey);
      expect(find.byType(AppbarUser), findsOneWidget);
      expect(silAppBarGestureString, findsOneWidget);

      await tester.tap(silAppBarGestureString);
      await tester.pumpAndSettle();
    });

    testWidgets('should render AppBarUSer widget with a photo URL',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return const AppbarUser();
          },
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppbarUser), findsOneWidget);
    });
  });
}
