// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/logout_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_state.dart';
import '../../../../mock_utils.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';
import './logout_action_test.mocks.dart';

@GenerateMocks(<Type>[SILFCM])
void main() {
  // initial set up
  setupFirebaseAuthMocks();
  late Store<AppState> store;
  late MockGraphQlClient graphQlClient;

  setUpAll(() async {
    await Firebase.initializeApp();
    store = Store<AppState>(initialState: AppState.initial());
    graphQlClient = MockGraphQlClient();
  });

  group('OnboardingUtils 2', () {
    MockSILFCM? fcm;

    setUp(() async {
      fcm = MockSILFCM();

      when(fcm!.resetToken())
          .thenAnswer((Invocation realInvocation) => Future<void>.value());

      when(fcm!.getDeviceToken()).thenAnswer(
        (Invocation realInvocation) => Future<String>.value('test-token'),
      );
    });

    testWidgets('should logout user', (WidgetTester tester) async {
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
                        const SnackBar(
                          content: Text('Testing'),
                        ),
                      );
                    },
                    context: context,
                    fcm: fcm!,
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
  });
}
