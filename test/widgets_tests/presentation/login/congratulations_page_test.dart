// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/congratulations_page.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('CongratulationsPage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = null;
    });
    testWidgets('should validate the input', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: CongratulationsPage(),
      );

      final Finder nameInputField = find.byKey(
        nameInputKey,
      );
      final Finder continueButton = find.byKey(continueKey);

      expect(continueButton, findsOneWidget);
      expect(nameInputField, findsOneWidget);

      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text(nameInputValidateString), findsOneWidget);
    });

    testWidgets('Navigates to Home page if input is valid  ',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'setNickName': true,
              'fetchRecentContent': contentMock,
            }
          }),
          201,
        ),
      );

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: CongratulationsPage(),
        );
        await tester.pumpAndSettle();

        final Finder nameInputField = find.byKey(
          nameInputKey,
        );
        final Finder continueButton = find.byKey(continueKey);

        expect(continueButton, findsOneWidget);
        expect(nameInputField, findsOneWidget);

        await tester.showKeyboard(nameInputField);
        await tester.enterText(nameInputField, 'test');

        await tester.ensureVisible(continueButton);
        await tester.tap(continueButton);
        await tester.pumpAndSettle();
        expect(find.byType(HomePage), findsOneWidget);
      });
    });

    testWidgets('should show No Internet text when there is no connectivity',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: CongratulationsPage(),
      );
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      final Finder nameInputField = find.byKey(
        nameInputKey,
      );
      final Finder continueButton = find.byKey(continueKey);

      expect(continueButton, findsOneWidget);
      expect(nameInputField, findsOneWidget);

      await tester.showKeyboard(nameInputField);
      await tester.enterText(nameInputField, 'test');
      listenForConnectivityChanges(ConnectivityResult.none);
      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pump(const Duration(seconds: 2));
      expect(find.text(noInternetConnection), findsOneWidget);
    });

    testWidgets('should render SILPlatformLoader', (WidgetTester tester) async {
      BuildContext? ctx;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            ctx = context;
            toggleLoadingIndicator(context: context, flag: 'resume_with_pin');
            return CongratulationsPage();
          },
        ),
      );

      await tester.pumpAndSettle();
      toggleLoadingIndicator(context: ctx!, flag: setNickNameFlag);
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
