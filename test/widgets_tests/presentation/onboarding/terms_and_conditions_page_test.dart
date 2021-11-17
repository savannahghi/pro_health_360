// Package imports:
import 'dart:convert';

import 'package:afya_moja_core/buttons.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:myafyahub/application/redux/flags/flags.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/onboarding/terms_and_conditions_page.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('TermsAndConditionsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
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

      expect(find.text(portalTermsText), findsOneWidget);
      expect(find.text(readAndAcceptText), findsOneWidget);
      expect(find.text(acceptTermsText), findsOneWidget);
    });

    testWidgets('Checks whether terms have been selected',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getCurrentTerms': termsMock,
              'acceptTerms': true,
              'getSecurityQuestions': securityQuestionsMock,
            },
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

      await tester.pumpAndSettle();
      final Finder checkBox = find.byType(Checkbox);
      final Finder proceedButton = find.byType(MyAfyaHubPrimaryButton);
      await tester.tap(checkBox);
      await tester.pumpAndSettle();
      await tester.tap(proceedButton);
      await tester.pumpAndSettle();

      expect(find.byType(TermsAndConditionsPage), findsNothing);
    });

    testWidgets('Shows loading indicator when fetching terms',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
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

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
