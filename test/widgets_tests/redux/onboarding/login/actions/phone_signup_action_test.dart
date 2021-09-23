import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_action.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:shared_ui_components/buttons.dart';

import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

import '../../../../shared/services/onboarding_utils_2_test.mocks.dart';

void main() {
  group('PhoneSignUpAction', () {
    late Store<AppState> store;

    final MockRefreshTokenManger refreshTimer = MockRefreshTokenManger();
    final MockSILFCM fcmMock = MockSILFCM();
    final DateTimeParser dateTimeParser = DateTimeParser(
        useCustomDateTime: true,
        customDateTime: DateTime.parse('2021-05-18 13:27:00'));

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should dispatch action and catch error when pins don\'t match',
        (WidgetTester tester) async {
      late dynamic err;
      store.dispatch(
        PhoneSignUpStateAction(
          createPin: '1234',
          confirmPin: '1212',
        ),
      );
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                try {
                  await store.dispatch(
                    PhoneSignUpAction(
                      context: context,
                      flag: 'sign_up',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              });
            },
          ));

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets(
        'should dispatch action and catch error when phone number is null',
        (WidgetTester tester) async {
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'code': 4}),
        400,
      );
      late dynamic err;
      store.dispatch(
        PhoneSignUpStateAction(
            createPin: '1234',
            confirmPin: '1234',
            phoneNumber: '+254728101710',
            otp: '123456'),
      );

      when(baseGraphQlClientMock.callRESTAPI(
              endpoint:
                  'https://onboarding-testing.savannahghi.org/create_user_by_phone',
              variables: <String, dynamic>{
                'phoneNumber': '+254728101710',
                'pin': '1234',
                'flavour': 'CONSUMER',
                'otp': '123456',
                'appVersion': APPVERSION,
              },
              method: 'POST'))
          .thenAnswer(
        (_) => Future<http.Response>.value(response),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                try {
                  await store.dispatch(
                    PhoneSignUpAction(
                      context: context,
                      flag: 'sign_up',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              });
            },
          ));

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
      expect(find.byKey(feedbackBottomSheet), findsOneWidget);
    });

    testWidgets(
        'should dispatch action and catch error when phone number is null 2',
        (WidgetTester tester) async {
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'code': 4}),
        400,
      );
      late dynamic err;
      store.dispatch(PhoneSignUpStateAction(createPin: '1234'));

      when(baseGraphQlClientMock.callRESTAPI(
              endpoint:
                  'https://onboarding-testing.savannahghi.org/create_user_by_phone',
              variables: <String, dynamic>{
                'phoneNumber': '+254728101710',
                'pin': '1234',
                'flavour': 'CONSUMER',
                'otp': '123456',
                'appVersion': APPVERSION,
              },
              method: 'POST'))
          .thenAnswer(
        (_) => Future<http.Response>.value(response),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                try {
                  await store.dispatch(
                    PhoneSignUpAction(
                      context: context,
                      flag: 'sign_up',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              });
            },
          ));

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should dispatch action and pass', (WidgetTester tester) async {
      final http.Response response = http.Response(
        json.encode(loginResponse),
        200,
      );
      dynamic err;
      store.dispatch(
        PhoneSignUpStateAction(
            createPin: '1234',
            confirmPin: '1234',
            phoneNumber: '+254728101710',
            otp: '123456'),
      );

      when(baseGraphQlClientMock.callRESTAPI(
              endpoint:
                  'https://onboarding-testing.savannahghi.org/create_user_by_phone',
              variables: <String, dynamic>{
                'phoneNumber': '+254728101710',
                'pin': '1234',
                'flavour': 'CONSUMER',
                'otp': '123456',
                'appVersion': APPVERSION,
              },
              method: 'POST'))
          .thenAnswer(
        (_) => Future<http.Response>.value(response),
      );

      when(refreshTimer.updateExpireTime('2021-05-18T14:17:00.000'))
          .thenReturn(refreshTimer);
      when(refreshTimer.reset()).thenReturn(null);

      when(fcmMock.resetToken())
          .thenAnswer((Invocation realInvocation) => Future<void>.value());

      when(fcmMock.resetToken()).thenAnswer(
          (Invocation realInvocation) => Future<String?>.value('newpushtoken'));

      queryWhenThenAnswer(
        queryString: registerDeviceTokenQuery,
        variables: <String, dynamic>{'token': 'newpushtoken'},
        response: http.Response(
          json.encode(<String, dynamic>{'token': 'newpushtoken'}),
          200,
        ),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                try {
                  toggleLoadingIndicator(context: context, flag: createPinFlag);
                  await store.dispatch(
                    PhoneSignUpAction(
                      context: context,
                      flag: 'sign_up',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              });
            },
          ));

      await tester.pump();

      expect(dateTimeParser.parsedExpireAt(int.parse('3600')),
          '2021-05-18T14:17:00.000');

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isNull);
    });

    testWidgets(
        'should dispatch action and throw exception because pins don\'t match',
        (WidgetTester tester) async {
      dynamic err;
      store.dispatch(
        PhoneSignUpStateAction(
            createPin: '1234',
            confirmPin: '4321',
            phoneNumber: '+254728101710',
            otp: '123456'),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(onPressed: () async {
                try {
                  await store.dispatch(
                    PhoneSignUpAction(
                      context: context,
                      flag: 'sign_up',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              });
            },
          ));

      await tester.pump();

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });
  });
}
