// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:myafyahub/application/redux/actions/create_pin_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('CreatePINAction', () {
    late Store<AppState> store;

    setUp(() async {
      await setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should dispatch action and catch error',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{'message': '4: error'}
            ]
          }),
          401,
        ),
      );
      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                try {
                  store.dispatch(
                    UpdateOnboardingStateAction(
                      confirmPIN: '0000',
                      pin: '0000',
                    ),
                  );
                  await store.dispatch(CreatePINAction(context: context));
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should dispatch action and catch error when resetting a PIN',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{'message': '4: error'}
            ]
          }),
          401,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.PINExpired,
        ),
      );

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                try {
                  store.dispatch(
                    UpdateOnboardingStateAction(
                      confirmPIN: '0000',
                      pin: '0000',
                    ),
                  );
                  await store.dispatch(CreatePINAction(context: context));
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should create a new PIN and navigate to login page',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'resetPIN': true}
          }),
          200,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.PINExpired,
          isPhoneVerified: true,
          confirmPIN: '0000',
          pin: '0000',
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                store.dispatch(CreatePINAction(context: context));
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('should show an error if the PINs do not match in state',
        (WidgetTester tester) async {
      final MockShortGraphQlClient mockShortSILGraphQlClient =
          MockShortGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        http.Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{'resetPIN': true}
          }),
          200,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.PINExpired,
          isPhoneVerified: true,
          confirmPIN: '0000',
          pin: '1111',
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () async {
                store.dispatch(CreatePINAction(context: context));
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(pinMustMatchString), findsOneWidget);
    });
  });
}
