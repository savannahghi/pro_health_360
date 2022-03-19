import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/consent_confirmation/consent_confirmation_page.dart';
import 'package:myafyahub/presentation/onboarding/consent_confirmation/widgets/consent_confirmation_dialog.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ConsentConfirmation Page', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    final Finder continueButtonKeyFinder = find.byKey(continueConsentButtonKey);
    final Finder abortButtonKeyFinder = find.byKey(abortConsentButtonKey);

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ConsentConfirmationPage(),
      );

      await tester.pumpAndSettle();
      expect(find.text(optOutOfMyCareHubTitleString), findsOneWidget);
      expect(continueButtonKeyFinder, findsOneWidget);
      expect(abortButtonKeyFinder, findsOneWidget);
    });
    testWidgets('continue button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const ConsentConfirmationPage(),
      );

      await tester.pumpAndSettle();
      expect(continueButtonKeyFinder, findsOneWidget);

      await tester.tap(continueButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
      await tester.tap(find.text(yesIam));
      await tester.pumpAndSettle();
      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('abort button works correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: MyAfyaHubPrimaryButton(
                text: 'tap',
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.consentConfirmationPage);
                },
              ),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('tap'));

      await tester.pumpAndSettle();
      expect(abortButtonKeyFinder, findsOneWidget);

      await tester.tap(abortButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.text('tap'), findsOneWidget);
    });
     testWidgets('should show snackbar with error message when optOut status is not true', (WidgetTester tester) async {
       final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'optOut': null}
          }),
          201,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: const ConsentConfirmationPage(),
      );

      await tester.pumpAndSettle();
      expect(continueButtonKeyFinder, findsOneWidget);

      await tester.tap(continueButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
      await tester.tap(find.text(yesIam));
      await tester.pump(const Duration(seconds: 3));
      expect(
        find.text(
          getErrorMessage(
            optingOutString,
          ),
        ),
        findsOneWidget,
      );
    });
    testWidgets('should show a loading indicator on ConsentConfirmationPage',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
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
      store.dispatch(WaitAction<AppState>.add(optOutFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: const ConsentConfirmationPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
    testWidgets('should show snackbar with error message when an error occurs',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some error occurred'}),
          400,
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: const ConsentConfirmationPage(),
      );

      await tester.pumpAndSettle();
      expect(continueButtonKeyFinder, findsOneWidget);

      await tester.tap(continueButtonKeyFinder);
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
      await tester.tap(find.text(yesIam));
      await tester.pump(const Duration(seconds: 3));
      expect(
        find.text(
          getErrorMessage(
            optingOutString,
          ),
        ),
        findsOneWidget,
      );
    });
    testWidgets('should show a loading indicator on ConsentConfirmationDialog', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortGraphQlClient =
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
      store.dispatch(WaitAction<AppState>.add(optOutFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: MyAfyaHubPrimaryButton(
                text: 'tap',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConsentConfirmationDialog();
                    },
                  );
                },
              ),
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('tap'));

      await tester.pump();

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
