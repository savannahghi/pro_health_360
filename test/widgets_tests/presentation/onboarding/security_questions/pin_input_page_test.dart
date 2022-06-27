// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:pro_health_360/application/redux/actions/update_connectivity_action.dart';
import 'package:pro_health_360/application/redux/actions/update_pin_input_details_action.dart';

// Project imports:
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/infrastructure/connectivity/mobile_connectivity_status.dart';
import 'package:pro_health_360/presentation/home/pages/home_page.dart';
import 'package:pro_health_360/presentation/onboarding/forgot_pin/pages/forgot_pin_page.dart';
import 'package:pro_health_360/presentation/onboarding/login/pages/pin_input_page.dart';
import 'package:pro_health_360/presentation/onboarding/login/widgets/key_pad_widget.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('PinInputPage renders correctly', () {
    late Store<AppState> store;
    late MobileConnectivityChecker connectivityStatus;

    setUp(() async {
      setupFirebaseMessagingMocks();
      await Firebase.initializeApp();
      final String dir = Directory.current.path;
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(UpdateConnectivityAction(hasConnection: true));

      final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform();
      ConnectivityPlatform.instance = fakePlatform;

      connectivityStatus = MobileConnectivityChecker(
        checkInternetCallback: () async => true,
      );
      HttpOverrides.global = TestHttpOverrides();
      store.dispatch(
        UpdateUserProfileAction(
          avatar: '$dir/test/tests_resources/test_file.png',
          firstName: 'Test',
          lastName: 'Name',
        ),
      );
    });

    final MockShortGraphQlClient mockShortSILGraphQlClient =
        MockShortGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      http.Response(
        json.encode(<String, dynamic>{
          'errors': <Object>[
            <String, dynamic>{
              'message': '8: wrong PIN credentials supplied',
            }
          ],
        }),
        401,
      ),
    );

    testWidgets('7, 8, 9, 0 and backSpace buttons work correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: PINInputPage(connectivityStatus: connectivityStatus),
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
      store.dispatch(
        UpdatePINInputDetailsAction(pinInputTries: 4),
      );
      await tester.pumpAndSettle();

      await tester.tap(numberZeroButton);

      await tester.tap(numberSevenButton);

      await tester.tap(numberEightButton);

      await tester.tap(numberNineButton);

      await tester.pump(const Duration(minutes: 2));

      expect(find.text(wrongPINString), findsNothing);

      await tester.pumpAndSettle(const Duration(minutes: 6));
      expect(find.text('7890'), findsNothing);
    });

    testWidgets('1, 2, 3 and 4 buttons are tappable',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'verifyPIN': true}
          }),
          201,
        ),
      );
      store.dispatch(
        UpdatePINInputDetailsAction(
          pinVerified: true,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: PINInputPage(connectivityStatus: connectivityStatus),
      );

      await tester.pumpAndSettle();
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

      expect(find.byType(KeyPadWidget), findsNothing);
    });
    testWidgets('4, 5,  and 6,  buttons are tappable',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: PINInputPage(
          connectivityStatus: connectivityStatus,
        ),
      );

      expect(find.text(enterPINToAccessHealthInfoString), findsOneWidget);
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
      store.dispatch(
        UpdatePINInputDetailsAction(
          pinInputTries: 4,
          maxTryTime:
              DateTime.now().subtract(const Duration(minutes: 6)).toString(),
        ),
      );
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
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
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
      // ignore: avoid_dynamic_calls
      expect(await widgetsCoreState.didPopRoute(), isTrue);
      await tester.pump();

      expect(find.byType(HomePage), findsWidgets);
    });
    testWidgets('shows a loading indicator when fetching data',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortGraphQlClient client =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'loading': true}
            }),
            201,
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: PINInputPage(
            connectivityStatus: connectivityStatus,
          ),
        );

        store.dispatch(WaitAction<AppState>.add(verifyPINFlag));
        await tester.pump();

        expect(find.byType(PlatformLoader), findsOneWidget);
      });
    });
    testWidgets(
        'should show snackbar if continue tapped and no internet connection',
        (WidgetTester tester) async {
      store.dispatch(UpdateConnectivityAction(hasConnection: false));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: PINInputPage(
          connectivityStatus: MobileConnectivityChecker(
            checkInternetCallback: () async => false,
          ),
        ),
      );
      await tester.pump();
      final Finder numberFourButton = find.text('4');
      final Finder numberFiveButton = find.text('5');
      final Finder numberSixButton = find.text('6');

      await tester.tap(numberFiveButton);
      await tester.tap(numberSixButton);
      await tester.tap(numberFourButton);
      await tester.tap(numberFiveButton);
      await tester.pump();

      expect(find.text(checkInternetText), findsOneWidget);
    });
    testWidgets('should resume timer', (WidgetTester tester) async {
      store.dispatch(
        UpdatePINInputDetailsAction(
          pinInputTries: 4,
          maxTryTime:
              DateTime.now().subtract(const Duration(seconds: 100)).toString(),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: PINInputPage(
          connectivityStatus: connectivityStatus,
        ),
      );
      await tester.pump(const Duration(seconds: 100));

      expect(find.text(wrongPINString), findsNothing);
      await tester.pumpAndSettle(const Duration(minutes: 6));
      expect(find.byType(Timer), findsNothing);
    });
  });
}
