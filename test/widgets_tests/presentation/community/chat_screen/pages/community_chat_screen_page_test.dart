import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/community/chat_screen/pages/community_chat_screen_page.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/message_input.dart';

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
        widget: const CommunityChatScreenPage(),
      );

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(MessageInput), findsOneWidget);

      await tester.tap(find.byKey(backAppBarKey));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsWidgets);

      await tester.tap(find.byKey(moreAppBarKey));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsWidgets);

      final Finder textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await tester.showKeyboard(textField);
      await tester.enterText(textField, 'text');
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsWidgets);
    });
  });
}
