// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/communities/chat_screen/widgets/more_menu_drop_down.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('MoreMenuDropDown', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should open & display group info & exit group option',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const MoreMenuDropDown(),
      );
      expect(find.byKey(popupMenuButtonKey), findsOneWidget);

      await tester.tap(find.byKey(popupMenuButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(groupInfoMenuItemKeyKey), findsOneWidget);
      expect(find.byKey(exitGroupMenuItemKeyKey), findsOneWidget);
    });

    testWidgets('exit group button works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const MoreMenuDropDown(),
      );
      expect(find.byKey(popupMenuButtonKey), findsOneWidget);

      // open dropdown
      await tester.tap(find.byKey(popupMenuButtonKey));
      await tester.pumpAndSettle();

      // verify dropdown options are displayed
      expect(find.byKey(groupInfoMenuItemKeyKey), findsOneWidget);
      expect(find.byKey(exitGroupMenuItemKeyKey), findsOneWidget);

      // tap exit menuItem
      await tester.tap(find.byKey(exitGroupMenuItemKeyKey));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('group info button works correctly',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: const MoreMenuDropDown(),
        );
        expect(find.byKey(popupMenuButtonKey), findsOneWidget);

        // open dropdown
        await tester.tap(find.byKey(popupMenuButtonKey));
        await tester.pumpAndSettle();

        // verify dropdown options are displayed
        expect(find.byKey(groupInfoMenuItemKeyKey), findsOneWidget);
        expect(find.byKey(exitGroupMenuItemKeyKey), findsOneWidget);

        // tap group info menuItem
        await tester.tap(find.byKey(groupInfoMenuItemKeyKey));
        await tester.pumpAndSettle();

        expect(find.byType(ScaffoldMessenger), findsOneWidget);
      });
    });
  });
}
