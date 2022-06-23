// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/application/redux/actions/logout_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/onboarding_state.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import 'package:pro_health_360/domain/core/entities/home/bottom_nav_state.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  late Store<AppState> store;
  late MockGraphQlClient graphQlClient;

  setUp(() async {
    setupFirebaseAnalyticsMocks();
    await Firebase.initializeApp();
    store = Store<AppState>(initialState: AppState.initial());
    graphQlClient = MockGraphQlClient();
  });

  testWidgets('Logout action should logout user', (WidgetTester tester) async {
    await buildTestWidget(
      tester: tester,
      store: store,
      client: graphQlClient,
      widget: Builder(
        builder: (BuildContext context) {
          return MyAfyaHubPrimaryButton(
            onPressed: () async {
              StoreProvider.dispatch(
                context,
                LogoutAction(
                  navigationCallback: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Testing')),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );

    await tester.tap(find.byType(MyAfyaHubPrimaryButton));
    await tester.pumpAndSettle();
    expect(find.text('Testing'), findsOneWidget);
    expect(store.state.clientState, ClientState.initial());
    expect(
      store.state.bottomNavigationState,
      BottomNavigationState.initial(),
    );
    expect(store.state.onboardingState, OnboardingState.initial());
  });
}
