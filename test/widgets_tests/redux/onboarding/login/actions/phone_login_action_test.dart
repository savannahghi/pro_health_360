// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
// Project imports:
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/redux/actions/phone_login_action.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:user_feed/user_feed.dart';

import '../../../../../mock_utils.dart';
import '../../../../../test_helpers.dart';
import '../../../../shared/services/onboarding_utils_2_test.mocks.dart';

void main() {
  // initial set up
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('PhoneLoginAction', () {
    late Store<AppState> store;

    final MockRefreshTokenManger refreshTimer = MockRefreshTokenManger();

    final DateTimeParser dateTimeParser = DateTimeParser(
      useCustomDateTime: true,
      customDateTime: DateTime.parse('2021-05-18 13:27:00'),
    );

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should dispatch action and catch pin_too_short error',
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
                    PhoneLoginAction(
                      context: context,
                      flag: 'phone_login',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
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

    testWidgets('should dispatch action and catch error',
        (WidgetTester tester) async {
      const String errMsg = 'No user account found';
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'error': errMsg}),
        500,
      );

      final Map<String, dynamic> queryVariables = <String, dynamic>{
        'phoneNumber': '+254728101710',
        'pin': '1234',
        'flavour': Flavour.CONSUMER.name,
      };

      when(baseGraphQlClientMock.query(loginQuery, queryVariables))
          .thenAnswer((_) async => Future<http.Response>.value(response));

      when(baseGraphQlClientMock.parseError(<String, dynamic>{'error': errMsg}))
          .thenReturn(errMsg);

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
                await StoreProvider.dispatch(
                  context,
                  PhoneLoginStateAction(
                    pinCode: '1234',
                    phoneNumber: '+254728101710',
                  ),
                );
                try {
                  await StoreProvider.dispatch(
                    context,
                    PhoneLoginAction(
                      context: context,
                      flag: 'phone_login',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
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
  });
}
