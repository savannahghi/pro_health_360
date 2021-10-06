// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/entities/core/request_pin_reset_behavior_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/forgot_pin_otp_widget.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/request_pin_reset.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';
import '../../../test_utils.dart';

void main() {
  late Store<AppState> store;

  setUp(() {
    store = Store<AppState>(initialState: AppState.initial());
  });

  group('RequestPinReset', () {
    testWidgets(
      'should render correctly',
      (WidgetTester tester) async {
        await buildTestWidget(
            tester: tester,
            store: store,
            client: baseGraphQlClientMock,
            widget: RequestPinReset());

        await tester.pump();
        final Finder requestPinResetKey = find.byKey(requestPinResetWidgetKey);
        expect(requestPinResetKey, findsOneWidget);

        expect(find.byType(SILPhoneInput), findsOneWidget);
        expect(find.byType(SILPrimaryButton), findsOneWidget);
      },
    );

    testWidgets(
      'should show an error when user has no account',
      (WidgetTester tester) async {
        final RequestPinResetBehaviorObject requestPinResetBehaviorObject =
            RequestPinResetBehaviorObject();
        requestPinResetBehaviorObject.processing.add(true);
        requestPinResetBehaviorObject.userHasNoAccount.add(true);
        await buildTestWidget(
            tester: tester,
            store: store,
            client: baseGraphQlClientMock,
            widget: RequestPinReset());
        await tester.pump();
        final Finder requestPinResetKey = find.byKey(requestPinResetWidgetKey);
        expect(requestPinResetKey, findsOneWidget);
        expect(find.byType(SILPhoneInput), findsOneWidget);
        expect(find.text('No account with that phone number'), findsOneWidget);
      },
    );

    testWidgets(
      'should test tap the login and start the login process',
      (WidgetTester tester) async {
        final RequestPinResetBehaviorObject requestPinResetBehaviorObject =
            RequestPinResetBehaviorObject();
        requestPinResetBehaviorObject.processing.add(false);

        when(baseGraphQlClientMock.callRESTAPI(
                endpoint: kTestPinResetEndpoint,
                variables: anyNamed('variables'),
                method: 'POST'))
            .thenAnswer(
          (_) => Future<http.Response>.value(
            http.Response(
              json.encode(resetPINMock()),
              200,
            ),
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              EndPointsContextSubject().contexts.add(testAppContexts);
              return RequestPinReset();
            },
          ),
        );

        await tester.pump();

        final Finder enterSignupNumberButton = find.byKey(startLoginButtonKey);
        final Finder phoneInput = find.byType(SILPhoneInput);
        expect(phoneInput, findsOneWidget);
        expect(enterSignupNumberButton, findsOneWidget);

        await tester.enterText(phoneInput, testPhoneNumber);
        await tester.pumpAndSettle();
        expect(find.text(testPhoneNumber), findsOneWidget);

        await tester.tap(enterSignupNumberButton);
        await tester.pumpAndSettle();

        expect(find.byType(ForgotPinOtpWidget), findsOneWidget);
      },
    );

    testWidgets('should render SILPlatformLoader', (WidgetTester tester) async {
      BuildContext? ctx;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            ctx = context;
            toggleLoadingIndicator(context: context, flag: 'resume_with_pin');
            return RequestPinReset();
          },
        ),
      );

      await tester.pumpAndSettle();
      toggleLoadingIndicator(context: ctx!, flag: 'request_reset_pin');
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
