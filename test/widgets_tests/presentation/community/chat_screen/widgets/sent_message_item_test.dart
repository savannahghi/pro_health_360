// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/quoted_message_widget.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/sent_message_item.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('SentMessageItem', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const SentMessageItem(
          message: 'Don\'t miss your appointment tomorrow',
          time: '12:00pm',
          isAwaitingModeration: true,
          highlightedMessage: QuotedMessageWidget(
            senderName: 'senderName',
            message:
                'Don\'t miss your appointment tomorrow Don\'t miss your appointment tomorrow',
          ),
        ),
      );

      expect(
        find.text('Don\'t miss your appointment tomorrow'),
        findsOneWidget,
      );
      expect(find.text('12:00pm'), findsOneWidget);
      expect(find.byType(QuotedMessageWidget), findsOneWidget);
    });
  });
}
