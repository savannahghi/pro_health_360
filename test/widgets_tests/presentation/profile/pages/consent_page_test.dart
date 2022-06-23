// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/onboarding/consent_confirmation/consent_confirmation_page.dart';
import 'package:pro_health_360/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:pro_health_360/presentation/profile/consent/consent_page.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('ConsentPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ConsentPage(),
      );

      expect(find.text(portalTermsText), findsOneWidget);
      expect(find.text(viewTermsText), findsOneWidget);
    });

    testWidgets('terms page navigates correctly', (WidgetTester tester) async {
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
        widget: const ConsentPage(),
      );

      final Finder termsTileFinder = find.byKey(termsAndConditionsKey);
      expect(termsTileFinder, findsOneWidget);

      await tester.tap(termsTileFinder);
      await tester.pumpAndSettle();

      expect(find.byType(TermsAndConditionsPage), findsOneWidget);
    });

    testWidgets('opt out navigates correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: const ConsentPage(),
      );

      expect(find.text(portalTermsText), findsOneWidget);
      expect(find.text(viewTermsText), findsOneWidget);
      expect(find.text(optOutOfMyCareHubString), findsOneWidget);

      await tester.tap(find.text(optOutOfMyCareHubString));
      await tester.pumpAndSettle();

      expect(find.byType(ConsentConfirmationPage), findsOneWidget);
    });
  });
}
