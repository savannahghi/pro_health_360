// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/auth_status_action.dart';
import 'package:pro_health_360/application/redux/actions/update_pin_input_details_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/home/widgets/bottom_nav_bar.dart';
import 'package:pro_health_360/presentation/onboarding/login/pages/pin_input_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  setUp(() async {
    setupFirebaseAnalyticsMocks();
    await Firebase.initializeApp();
  });

  group('myAfyaHub bottom navigation bar', () {
    final MockGraphQlClient GraphQlClient = MockGraphQlClient();
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    testWidgets('should render widget', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: GraphQlClient,
        widget: const BottomNavBar(bottomNavIndex: 0),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(bottomNavKey), findsOneWidget);
    });

    testWidgets(
        'renders all bottom navigation items correctly '
        'and navigates to at least one of the bottom navigation items',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: GraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: Container(),
              bottomNavigationBar: const BottomNavBar(
                bottomNavIndex: 0,
              ),
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      // verify the bottom navigation bar exists
      expect(find.byKey(bottomNavKey), findsOneWidget);
      expect(find.text('Home'), findsWidgets);
      await tester.tap(find.text('Home').first);
      await tester.pumpAndSettle();
      expect(find.text('Feed'), findsWidgets);
    });

    testWidgets('should navigate to the different tabs',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortGraphQlClient mockShortSILGraphQlClient =
            MockShortGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'getContent': <String, dynamic>{
                  'items': <dynamic>[
                    mockContent,
                    mockContent,
                  ]
                },
                'fetchSuggestedGroups': <dynamic>[mockGroup],
                'listContentCategories': categoriesMock,
              }
            }),
            201,
          ),
        );

        store.dispatch(
          AuthStatusAction(
            signedInTime:
                DateTime.now().subtract(const Duration(minutes: 30)).toString(),
          ),
        );
        store.dispatch(
          UpdatePINInputDetailsAction(
            healthPagePINInputTime:
                DateTime.now().subtract(const Duration(minutes: 30)).toString(),
          ),
        );
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: Scaffold(
            body: Container(),
            bottomNavigationBar: const BottomNavBar(
              bottomNavIndex: 0,
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byKey(bottomNavKey), findsOneWidget);
        expect(find.text('Home'), findsWidgets);
        await tester.tap(find.text('Home').first);
        await tester.pumpAndSettle();

        expect(store.state.bottomNavigationState!.currentBottomNavIndex, 0);

        expect(find.text('Feed'), findsWidgets);
        await tester.tap(find.text('Feed').first);
        await tester.pumpAndSettle();

        expect(store.state.bottomNavigationState!.currentBottomNavIndex, 1);

        expect(find.text('My Health'), findsWidgets);
        await tester.tap(find.text('My Health').first);
        await tester.pumpAndSettle();

        expect(store.state.bottomNavigationState!.currentBottomNavIndex, 3);
        expect(find.byType(PINInputPage), findsOneWidget);

        await tester.tap(find.byKey(pinInputPageBackKey));
        expect(store.state.bottomNavigationState!.currentBottomNavIndex, 0);
      });
    });
  });
}
