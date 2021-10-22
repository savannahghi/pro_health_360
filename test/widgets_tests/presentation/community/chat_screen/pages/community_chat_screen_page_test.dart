// Flutter imports:
import 'package:afya_moja_core/community_list_item.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/community/chat_screen/pages/community_chat_screen_page.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/message_input.dart';
import 'package:myafyahub/presentation/community/community_list_page.dart';
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
        widget: const CommunityChatScreenPage(
          communityChatData: CommunityListItem(
            title: 'Some title',
            message: 'some message',
            lastMessageDate: '21 Oct, 2021',
          ),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(MessageInput), findsOneWidget);

      await tester.tap(find.byKey(moreAppBarKey));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsWidgets);

      final Finder textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await tester.showKeyboard(textField);
      await tester.enterText(textField, 'text');
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsWidgets);

      await tester.tap(find.byKey(appBarBackButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(CommunityListViewPage), findsNothing);
    });
  });
}
