// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:myafyahub/application/redux/actions/update_client_profile_action.dart';
// Project imports:
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('TermsAndConditionsPage', () {
    late Store<AppState> store;

    setUp(() async {
      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'getCurrentTerms': termsMock}
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const TermsAndConditionsPage(),
      );

      expect(find.text(portalTermsText), findsNWidgets(2));
      expect(find.text(readAndAcceptText), findsOneWidget);
      expect(find.text(acceptTermsText), findsOneWidget);
    });

    testWidgets('renders correctly if terms have already been accepted',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'getCurrentTerms': termsMock}
          }),
          201,
        ),
      );
      store.dispatch(
        UpdateClientStateAction(
          clientState: ClientState.initial().copyWith(
            user: User.initial().copyWith(termsAccepted: true),
          ),
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return MyAfyaHubPrimaryButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(AppRoutes.termsAndConditions),
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(okThanksButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(TermsAndConditionsPage), findsNothing);
    });

    testWidgets('Accepts terms and conditions', (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getCurrentTerms': termsMock,
              'acceptTerms': true,
              'fetchRecentContent': contentMock,
              'fetchSuggestedGroups': mockSuggestions,
              'getSecurityQuestions': securityQuestionsMock,
            },
          }),
          201,
        ),
      );
      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const TermsAndConditionsPage(),
        );

        await tester.pumpAndSettle();
        final Finder checkBox = find.byType(Checkbox);
        final Finder proceedButton = find.byType(MyAfyaHubPrimaryButton);
        await tester.tap(checkBox);
        await tester.pumpAndSettle();
        await tester.tap(proceedButton);
        await tester.pumpAndSettle();

        expect(find.byType(TermsAndConditionsPage), findsNothing);
      });
    });

    testWidgets('Accepts terms and conditions navigates back to consent page',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getCurrentTerms': termsMock,
              'acceptTerms': true,
              'fetchRecentContent': contentMock,
              'fetchSuggestedGroups': mockSuggestions,
              'getSecurityQuestions': securityQuestionsMock,
            },
          }),
          201,
        ),
      );

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: const TermsAndConditionsPage(
            shouldPop: true,
          ),
        );

        await tester.pumpAndSettle();
        final Finder checkBox = find.byType(Checkbox);
        final Finder proceedButton = find.byType(MyAfyaHubPrimaryButton);
        await tester.tap(checkBox);
        await tester.pumpAndSettle();
        await tester.tap(proceedButton);
        await tester.pumpAndSettle();

        expect(find.byType(TermsAndConditionsPage), findsNothing);
      });
    });

    testWidgets('Shows loading indicator when fetching terms',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getCurrentTerms': termsMock,
              'acceptTerms': true
            },
          }),
          201,
        ),
      );

      store.dispatch(WaitAction<AppState>.add(getTermsFlag));
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const TermsAndConditionsPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
