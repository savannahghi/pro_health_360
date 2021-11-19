// Flutter imports:
import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/check_connectivity_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:user_feed/user_feed.dart';

import '../../../mock_utils.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';
import '../../shared/services/onboarding_utils_2_test.mocks.dart';

void main() {
  group('LoginPage', () {
    setupFirebaseAuthMocks();

    setUpAll(() async {
      await Firebase.initializeApp();
    });

    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
      store.dispatch(CheckConnectivityAction(hasConnection: true));
    });

    testWidgets('MyAfyaHubCountryPicker should render a list of countries',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return LoginPage();
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final Finder phoneInputField = find.byKey(textFormFieldKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);

      expect(phoneInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      await tester.showKeyboard(phoneInputField);
      await tester.enterText(phoneInputField, '0725999999');
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(selectCountryKey));
      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsNWidgets(6));
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();
      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('+254'), findsOneWidget);
    });

    testWidgets('should validate Phone Number', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return LoginPage();
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder phoneInputField = find.byKey(textFormFieldKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);
      expect(phoneInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      expect(find.text('A PIN is required'), findsNothing);

      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('A PIN is required'), findsOneWidget);
    });

    testWidgets('should validate PIN', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                return LoginPage();
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder pinInputField = find.byKey(pinInputKey);
      final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);
      expect(pinInputField, findsOneWidget);
      expect(continueButton, findsOneWidget);

      expect(find.text('A PIN is required'), findsNothing);

      await tester.ensureVisible(continueButton);
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      expect(find.text('A PIN is required'), findsOneWidget);
    });

    testWidgets('should navigate to home if login request is successful',
        (WidgetTester tester) async {
      final MockRefreshTokenManger refreshTimer = MockRefreshTokenManger();

      final Response loginResponse = Response(
        json.encode(mockLoginResponse),
        200,
      );

      final Response contentResponse = Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'fetchRecentContent': contentMock,
          }
        }),
        200,
      );

      final Response suggestedGroupsResponse = Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'fetchSuggestedGroups': mockSuggestions}
        }),
        200,
      );

      final Map<String, dynamic> queryVariables = <String, dynamic>{
        'phoneNumber': '+254723456789',
        'pin': '1234',
        'flavour': Flavour.CONSUMER.name,
      };

      when(baseGraphQlClientMock.query(loginQuery, queryVariables))
          .thenAnswer((_) async => Future<Response>.value(loginResponse));

      when(
        baseGraphQlClientMock
            .query(fetchSuggestedGroupsQuery, <String, dynamic>{}),
      ).thenAnswer(
        (_) async => Future<Response>.value(suggestedGroupsResponse),
      );

      when(
        baseGraphQlClientMock
            .query(fetchRecentContentQuery, <String, dynamic>{}),
      ).thenAnswer((_) async => Future<Response>.value(contentResponse));

      when(refreshTimer.updateExpireTime('2021-05-18T00:50:00.000'))
          .thenReturn(refreshTimer);

      when(refreshTimer.reset()).thenReturn(null);

      when(baseGraphQlClientMock.toMap(contentResponse)).thenReturn(
        json.decode(contentResponse.body) as Map<String, dynamic>,
      );

      when(baseGraphQlClientMock.toMap(suggestedGroupsResponse)).thenReturn(
        json.decode(contentResponse.body) as Map<String, dynamic>,
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: MaterialApp(
            onGenerateRoute: RouteGenerator.generateRoute,
            home: Scaffold(
              body: LoginPage(),
            ),
          ),
        );
        await tester.pump();

        final Finder phoneInputField = find.byKey(textFormFieldKey);
        final Finder pinInputField = find.byKey(pinInputKey);
        final Finder continueButton = find.byKey(phoneLoginContinueButtonKey);

        await tester.showKeyboard(phoneInputField);
        await tester.enterText(phoneInputField, '723456789');
        await tester.pumpAndSettle();

        await tester.showKeyboard(pinInputField);
        await tester.enterText(pinInputField, '1234');
        await tester.pumpAndSettle();

        await tester.ensureVisible(continueButton);
        await tester.tap(continueButton);
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
      });
    });
  });
}
