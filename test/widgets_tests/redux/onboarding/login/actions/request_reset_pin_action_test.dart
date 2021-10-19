// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/request_reset_pin_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/forgot_pin_otp_widget.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('RequestResetPinAction', () {
    late Store<AppState> store;
    const String endpoint = kTestPinResetEndpoint;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets(
        'should dispatch action and catch error when phone number is UNKNOWN',
        (WidgetTester tester) async {
      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                try {
                  await store.dispatch(
                    RequestResetPinAction(
                      context: context,
                      flag: 'pin_reset',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets(
        'should dispatch action and catch error when request to reset pin fails',
        (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'statusCode': 408}),
        500,
      );

      callRESTAPIWhenThenAnswer(
        endpoint: endpoint,
        variables: <String, dynamic>{
          'phoneNumber': '+254728101710',
        },
        response: response,
      );

      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
          ),
        ),
      );

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                EndPointsContextSubject().contexts.add(testAppContexts);
                try {
                  await store.dispatch(
                    RequestResetPinAction(
                      context: context,
                      flag: 'pin_reset',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should dispatch action and catch error when otp is null',
        (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'statusCode': 200}),
        200,
      );

      callRESTAPIWhenThenAnswer(
        endpoint: endpoint,
        variables: <String, dynamic>{
          'phoneNumber': '+254728101710',
        },
        response: response,
      );

      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
          ),
        ),
      );

      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                EndPointsContextSubject().contexts.add(testAppContexts);
                try {
                  await store.dispatch(
                    RequestResetPinAction(
                      context: context,
                      flag: 'pin_reset',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should dispatch action and catch error when otp is not null',
        (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'otp': '123456'}),
        200,
      );

      callRESTAPIWhenThenAnswer(
        endpoint: endpoint,
        variables: <String, dynamic>{
          'phoneNumber': '+254728101710',
        },
        response: response,
      );

      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
          ),
        ),
      );

      dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                EndPointsContextSubject().contexts.add(testAppContexts);
                try {
                  await store.dispatch(
                    RequestResetPinAction(
                      context: context,
                      flag: 'pin_reset',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isNull);
      expect(find.byType(ForgotPinOtpWidget), findsOneWidget);
      expect(store.state.miscState!.userPin!.recoveryOtp, equals('123456'));
    });
  });
}
