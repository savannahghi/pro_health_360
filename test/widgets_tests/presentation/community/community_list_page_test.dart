// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/communities/chat_screen/pages/community_chat_screen_page.dart';
import 'package:myafyahub/presentation/communities/community_list_page.dart';
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
        widget: const CommunityListViewPage(),
      );

      expect(find.byKey(communityListViewKey), findsOneWidget);
      expect(find.byKey(communityListGestureDetectorKey), findsWidgets);

      await tester.tap(find.byKey(communityListGestureDetectorKey).first);
      await tester.pumpAndSettle();

      expect(find.byType(CommunityChatScreenPage), findsOneWidget);
    });
  });
}
