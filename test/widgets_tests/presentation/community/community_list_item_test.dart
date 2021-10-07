// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/community/community_list_item.dart';
import '../../../test_helpers.dart';

void main() {
  group('CommunityListItem', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const CommunityListItem(
          title: 'Ruaka Questions Group',
          message: 'Don\'t miss your appointment tommorow',
          date: '12/03/2012',
          unreadNotificationCount: 5,
          isGroup: true,
        ),
      );

      expect(find.text('Ruaka Questions Group'), findsOneWidget);
      expect(
          find.text('Don\'t miss your appointment tommorow'), findsOneWidget);
      expect(find.text('12/03/2012'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.text('Group'), findsOneWidget);
      expect(find.byIcon(UniconsLine.user_square), findsOneWidget);
    });

    testWidgets('should show avatar image', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const CommunityListItem(
          title: 'Ruaka Questions Group',
          message: 'Don\'t miss your appointment tommorow',
          date: '12/03/2012',
          unreadNotificationCount: 5,
          isGroup: true,
          avatarImage: AssetImage('assets/images/wellness2.jpeg'),
        ),
      );

      expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is CircleAvatar &&
                widget.backgroundImage ==
                    const AssetImage('assets/images/wellness2.jpeg'),
          ),
          findsOneWidget);
    });

    testWidgets('should throw error if wrong params',
        (WidgetTester tester) async {
      expect(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: CommunityListItem(
            title: 'Ruaka Questions Group',
            message: 'Don\'t miss your appointment tommorow',
            date: '12/03/2012',
            unreadNotificationCount: -1,
          ),
        );
      }, throwsAssertionError);
    });
  });
}
