// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:myafyahub/application/core/services/login_utils.dart';
import 'package:myafyahub/application/redux/actions/update_connectivity_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/terms/terms_and_conditions_page.dart';
import '../../mocks.dart';
import '../../test_helpers.dart';

void main() {
  final MockGraphQlClient graphQlClient = MockGraphQlClient();

  testWidgets('should show bottom sheet when phone number is invalid',
      (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    await buildTestWidget(
      tester: tester,
      store: store,
      client: graphQlClient,
      widget: Material(
        child: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
              onPressed: () => signInUser(
                hasConnection: false,
                context: context,
                phoneNumber: 'some-wrong-number',
                pin: '1111',
              ),
            );
          },
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(find.byKey(feedbackBottomSheet), findsOneWidget);
  });

  testWidgets('should sign in and go to terms page user if valid',
      (WidgetTester tester) async {
    mockLoginResponse.addAll(<String, dynamic>{
      'getCurrentTerms': termsMock,
    });
    final MockShortSILGraphQlClient mockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{'data': mockLoginResponse}),
        200,
      ),
    );

    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    final User? user = store.state.clientState?.user;

    store.dispatch(UpdateConnectivityAction(hasConnection: true));

    store.dispatch(
      UpdateUserAction(
        user: user?.copyWith(
          termsAccepted: true,
          pinChangeRequired: false,
          hasSetNickname: true,
          hasSetPin: true,
          hasSetSecurityQuestions: true,
        ),
      ),
    );

    store.dispatch(
      UpdateOnboardingStateAction(
        isPhoneVerified: true,
        hasSetSecurityQuestions: true,
        hasSetPin: true,
        hasSetNickName: true,
      ),
    );

    await mockNetworkImages(() async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: Material(
          child: Builder(
            builder: (BuildContext context) {
              return RawMaterialButton(
                onPressed: () => signInUser(
                  hasConnection: true,
                  context: context,
                  phoneNumber: '0712345678',
                  pin: '1111',
                ),
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byType(RawMaterialButton));
      await tester.pumpAndSettle();

      expect(find.byKey(feedbackBottomSheet), findsNothing);
      expect(
        store.state.onboardingState!.phoneLogin!.phoneNumber,
        '0712345678',
      );
      expect(find.byType(TermsAndConditionsPage), findsOneWidget);
    });
  });
}
