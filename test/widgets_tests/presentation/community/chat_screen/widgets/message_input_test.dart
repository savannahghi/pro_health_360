import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misc_utilities/misc.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/message_input.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('MessageInput', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      String message = messageText;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) => MessageInput(
            onChanged: (String value) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackbar(content: value));
            },
            onTap: () {
              message = 'hello there';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsWidgets);
      await tester.tap(find.byKey(messageInputAttachFileKey));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);

      await tester.tap(find.byKey(messageInputSendMessageKey));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);

      final Finder textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await tester.showKeyboard(textField);
      await tester.enterText(textField, 'text');
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsWidgets);
    });
  });
}
