// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/feed/feed_item_widget.dart';
import 'package:myafyahub/presentation/feed/pages/my_afya_hub_feed_page.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('CommunityChatScreenPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const MyAfyaHubFeedPage(),
      );

      await tester.tap(find.text('All'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Recommended'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Exercise'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Diet'));
      await tester.pumpAndSettle();

      expect(find.byType(FeedItem), findsWidgets);
    });
  });
}
