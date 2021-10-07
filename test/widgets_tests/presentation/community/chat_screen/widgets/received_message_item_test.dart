// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/quoted_message_widget.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/received_message_item.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/sender_type_widget.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('ReceivedMessageItem', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ReceivedMessageItem(
          senderName: 'Wanjiku',
          message: 'Don\'t miss your appointment tomorrow',
          time: '12:00pm',
          senderType: SenderTypeWidget(
            senderTitle: 'Moderator',
            senderIcon: moderatorIcon,
          ),
          quotedMessageWidget: QuotedMessageWidget(
            senderName: 'senderName',
            message:
                'Don\'t miss your appointment tomorrow Don\'t miss your appointment tomorrow',
          ),
        ),
      );

      expect(find.text('Wanjiku'), findsOneWidget);
      expect(
          find.text('Don\'t miss your appointment tomorrow'), findsOneWidget);
      expect(find.text('12:00pm'), findsOneWidget);
      expect(find.byType(SenderTypeWidget), findsOneWidget);
      expect(find.byType(QuotedMessageWidget), findsOneWidget);
    });
  });
}
