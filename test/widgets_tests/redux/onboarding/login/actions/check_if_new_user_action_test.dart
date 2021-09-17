import 'dart:convert';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/actions/check_if_new_user_action.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/phone_number_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:http/http.dart' as http;

import '../../../../../mock_image_httpclient.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('CheckIfNewUserAction', () {
    late Store<AppState> store;
    late StoreTester<AppState> storeTester;

    const String endpoint =
        'https://profile-testing.healthcloud.co.ke/verify_phone';

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        shouldThrowUserExceptions: true,
      );
      HttpOverrides.global = BWTestHttpOverrides();
    });

    testWidgets('should dispatch action and catch error',
        (WidgetTester tester) async {
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'statusCode': 408}),
        408,
      );

      callRESTAPIWhenThenAnswer(
          endpoint: endpoint,
          variables: <String, dynamic>{
            'phoneNumber': '+254728101710',
            'appId': 'test'
          },
          response: response);

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock
              .parseError(<String, dynamic>{'error': 'An error occurred'}))
          .thenReturn(null);

      storeTester.dispatch(PhoneSignUpStateAction(
        phoneNumber: '+254728101710',
        acceptCommunicationTerms: true,
      ));

      late dynamic err;
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                try {
                  await storeTester.dispatch(
                    CheckIfNewUserAction(
                        context: context,
                        flag: 'check_new_user',
                        appSignature: 'test'),
                  );
                } catch (e) {
                  err = e;
                }
              });
            },
          ));

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      expect(err, isA<Future<dynamic>>());
      await tester.pump(); // bottom sheet show animation starts
      await tester.pump(const Duration(seconds: 1)); // animation done
      expect(find.byKey(genericBottomSheetWidgetKey), findsOneWidget);
    });

    testWidgets('should return correct state if run successfully',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        storeTester.dispatch(
          PhoneSignUpStateAction(
            phoneNumber: '+254728101710',
            acceptCommunicationTerms: true,
          ),
        );

        final http.Response response = http.Response(
          json.encode(<String, dynamic>{'statusCode': 200, 'otp': '1234'}),
          200,
        );

        callRESTAPIWhenThenAnswer(
          endpoint: endpoint,
          variables: <String, dynamic>{
            'phoneNumber': '+254728101710',
            'appId': 'test'
          },
          response: response,
        );

        const Widget widget = MaterialApp(
          home: Material(
            child: Center(
              child: ElevatedButton(
                onPressed: null,
                child: Text('Go'),
              ),
            ),
          ),
        );

        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: widget,
        );

        final BuildContext context = tester.element(find.text('Go'));

        storeTester.dispatch(
          CheckIfNewUserAction(
              context: context, flag: 'check_new_user', appSignature: 'test'),
        );

        final TestInfo<AppState> info =
            await storeTester.waitUntil(CheckIfNewUserAction);

        expect(info.state.miscState?.phoneSignUp?.otp, '1234');
      });
    });

    testWidgets(
        'should dispatch action and catch error when processHttpResponse is '
        'not ok with code 10', (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'code': 10}),
        400,
      );

      callRESTAPIWhenThenAnswer(
          endpoint: endpoint,
          variables: <String, dynamic>{
            'phoneNumber': '+254728101710',
            'appId': 'test'
          },
          response: response);

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock
              .parseError(<String, dynamic>{'error': 'An error occurred'}))
          .thenReturn(null);

      storeTester.dispatch(PhoneSignUpStateAction(
        phoneNumber: '+254728101710',
        acceptCommunicationTerms: true,
      ));

      late dynamic err;
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                try {
                  await storeTester.dispatch(
                    CheckIfNewUserAction(
                        context: context,
                        flag: 'check_new_user',
                        appSignature: 'test'),
                  );
                } catch (e) {
                  err = e;
                }
              });
            },
          ));

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      expect(err, isA<Future<dynamic>>());
      await tester.pump(); // bottom sheet show animation starts
      await tester.pump(const Duration(seconds: 1)); // animation done
      expect(find.byKey(genericBottomSheetWidgetKey), findsOneWidget);
    });

    testWidgets(
        'should dispatch action and catch error when processHttpResponse is '
        'not ok with code 4 then navigate to login screen',
        (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'code': 4}),
        400,
      );

      callRESTAPIWhenThenAnswer(
          endpoint: endpoint,
          variables: <String, dynamic>{
            'phoneNumber': '+254728101710',
            'appId': 'test'
          },
          response: response);

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock
              .parseError(<String, dynamic>{'error': 'An error occurred'}))
          .thenReturn(null);

      storeTester.dispatch(PhoneSignUpStateAction(
        phoneNumber: '+254728101710',
        acceptCommunicationTerms: true,
      ));

      late dynamic err;
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                try {
                  await storeTester.dispatch(
                    CheckIfNewUserAction(
                        context: context,
                        flag: 'check_new_user',
                        appSignature: 'test'),
                  );
                } catch (e) {
                  err = e;
                }
              });
            },
          ));

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      expect(err, isA<Future<dynamic>>());
      await tester.pump(); // bottom sheet show animation starts
      await tester.pump(const Duration(seconds: 1)); // animation done
      expect(find.byKey(genericBottomSheetWidgetKey), findsOneWidget);
      await tester.tap(find.byKey(primaryBottomSheetButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(PhoneNumberLoginPage), findsOneWidget);
    });
  });
}
