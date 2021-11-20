// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/redux/actions/phone_login_action.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_response.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import '../../../../../mock_utils.dart';
import '../../../../../mocks.dart';
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
      customDateTime: DateTime.parse('2021-05-18'),
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

    testWidgets(
        'should navigate to home and update state if login request is '
        'successful', (WidgetTester tester) async {
      final http.Response loginResponse = http.Response(
        json.encode(mockLoginResponse),
        200,
      );

      final http.Response contentResponse = http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'fetchRecentContent': contentMock,
          }
        }),
        200,
      );

      final http.Response suggestedGroupsResponse = http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'fetchSuggestedGroups': mockSuggestions}
        }),
        200,
      );

      final Map<String, dynamic> queryVariables = <String, dynamic>{
        'phoneNumber': '+254728101710',
        'pin': '1234',
        'flavour': Flavour.CONSUMER.name,
      };

      final PhoneLoginResponse phoneLoginResponse = PhoneLoginResponse.fromJson(
        mockLoginResponse['data']['login'] as Map<String, dynamic>,
      );

      when(baseGraphQlClientMock.query(loginQuery, queryVariables))
          .thenAnswer((_) async => Future<http.Response>.value(loginResponse));

      when(
        baseGraphQlClientMock
            .query(fetchSuggestedGroupsQuery, <String, dynamic>{}),
      ).thenAnswer(
        (_) async => Future<http.Response>.value(suggestedGroupsResponse),
      );

      when(
        baseGraphQlClientMock
            .query(fetchRecentContentQuery, <String, dynamic>{}),
      ).thenAnswer((_) async => Future<http.Response>.value(contentResponse));

      when(refreshTimer.updateExpireTime('2021-05-18T00:50:00.000'))
          .thenReturn(refreshTimer);

      when(refreshTimer.reset()).thenReturn(null);

      when(baseGraphQlClientMock.toMap(contentResponse)).thenReturn(
        json.decode(contentResponse.body) as Map<String, dynamic>,
      );

      when(baseGraphQlClientMock.toMap(suggestedGroupsResponse)).thenReturn(
        json.decode(contentResponse.body) as Map<String, dynamic>,
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                onPressed: () async {
                  await StoreProvider.dispatch(
                    context,
                    PhoneLoginStateAction(
                      pinCode: '1234',
                      phoneNumber: '+254728101710',
                    ),
                  );
                  await StoreProvider.dispatch(
                    context,
                    PhoneLoginAction(
                      context: context,
                      flag: 'phone_login',
                      tokenManger: refreshTimer,
                      dateTimeParser: dateTimeParser,
                    ),
                  );
                },
              );
            },
          ),
        );

        await tester.pump();
        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);

        expect(
          store.state.clientState?.user,
          phoneLoginResponse.clientState?.user,
        );

        final AuthCredentials? credentials = store.state.credentials;

        expect(credentials?.expiresIn, dateTimeParser.parsedExpireAt(3600));
        expect(credentials?.isSignedIn, true);
        expect(
          credentials?.refreshToken,
          phoneLoginResponse.credentials?.refreshToken,
        );
      });
    });
  });
}
