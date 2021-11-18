// Dart imports:
import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
// Project imports:
// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/forgot_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/pin_input_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/key_pad_widget.dart';

import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('PinInputPage renders correctly', () {
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

    testWidgets('7, 8, 9, 0 and backSpace buttons work correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return MaterialApp(
              home: MaterialApp(
                home: PINInputPage(),
              ),
            );
          },
        ),
      );
      expect(find.text(forgotPINString), findsOneWidget);
      final Finder numberSevenButton = find.text('7');
      final Finder numberEightButton = find.text('8');
      final Finder numberNineButton = find.text('9');
      final Finder numberZeroButton = find.text('0');
      final Finder backSpaceButton = find.byKey(keyPadBackSpaceButtonKey);

      expect(numberNineButton, findsOneWidget);
      expect(numberZeroButton, findsOneWidget);
      expect(backSpaceButton, findsOneWidget);
      expect(numberSevenButton, findsOneWidget);
      expect(numberEightButton, findsOneWidget);

      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(backSpaceButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);

      expect(find.text('978'), findsOneWidget);

      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberEightButton);
      await tester.tap(numberNineButton);
      await tester.tap(numberZeroButton);
      await tester.tap(numberSevenButton);

      await tester.pumpAndSettle(const Duration(minutes: 6));

      expect(find.text(wrongPINString), findsNothing);
    });

    testWidgets('1, 2, 3 and 4 buttons are tappable',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return MaterialApp(
              home: PINInputPage(),
            );
          },
        ),
      );

      expect(find.byType(KeyPadWidget), findsOneWidget);
      final Finder numberOneButton = find.text('1');
      final Finder numberTwoButton = find.text('2');
      final Finder numberThreeButton = find.text('3');
      final Finder numberFourButton = find.text('4');

      expect(numberOneButton, findsOneWidget);
      expect(numberTwoButton, findsOneWidget);
      expect(numberThreeButton, findsOneWidget);

      await tester.tap(numberOneButton);
      await tester.tap(numberTwoButton);
      await tester.tap(numberThreeButton);
      await tester.tap(numberFourButton);
      await tester.pumpAndSettle();
      expect(numberFourButton, findsNothing);
    });
    testWidgets('4, 5,  and 6,  buttons are tappable',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return MaterialApp(
              home: PINInputPage(),
            );
          },
        ),
      );
      expect(find.text(enterChatPINString), findsOneWidget);
      final Finder numberFourButton = find.text('4');
      final Finder numberFiveButton = find.text('5');
      final Finder numberSixButton = find.text('6');

      expect(numberFiveButton, findsOneWidget);
      expect(numberSixButton, findsOneWidget);
      expect(numberFourButton, findsOneWidget);

      await tester.tap(numberFiveButton);
      await tester.tap(numberSixButton);
      await tester.tap(numberFourButton);
      expect(find.text('564'), findsOneWidget);

      await tester.tap(numberFiveButton);
      await tester.tap(numberSixButton);
      await tester.tap(numberFourButton);
      await tester.tap(numberSixButton);

      expect(find.text('646'), findsOneWidget);
    });
    testWidgets('navigates to Forgot PIN Page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: PINInputPage(),
      );

      final Finder forgotPINButton = find.byKey(forgotPINButtonKey);
      expect(forgotPINButton, findsOneWidget);

      await tester.ensureVisible(forgotPINButton);
      await tester.tap(forgotPINButton);
      await tester.pumpAndSettle();

      expect(find.byType(ForgotPINPage), findsOneWidget);
    });

    testWidgets('pressing back button works', (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'fetchRecentContent': <dynamic>[],
              'fetchSuggestedGroups': <dynamic>[]
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: PINInputPage(),
      );

      await tester.pump();

      expect(find.byType(PINInputPage), findsWidgets);

      final dynamic widgetsCoreState = tester.state(find.byType(WidgetsApp));
      expect(await widgetsCoreState.didPopRoute(), isTrue);
      await tester.pump();

      expect(find.byType(HomePage), findsWidgets);
    });
  });
}
