// Dart imports:
import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/refresh_token_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';

import './onboarding_utils_2_test.mocks.dart';
import '../../../mock_utils.dart';
import '../../../test_helpers.dart';

@GenerateMocks(<Type>[RefreshTokenManger, DateTimeParser, SILFCM])
void main() {
  // initial set up
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  const MethodChannel('plugins.flutter.io/firebase_messaging')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'Messaging#getToken') {
      return <String, String?>{
        'token': 'sampleToken'
      }; // set initial values here if desired
    }
    return null;
  });

  group('OnboardingUtils 2', () {
    MockRefreshTokenManger? refreshTimer;

    MockDateTimeParser? dateTimeParser;

    MockSILFCM? fcm;

    setUp(() async {
      refreshTimer = MockRefreshTokenManger();
      dateTimeParser = MockDateTimeParser();
      fcm = MockSILFCM();

      when(dateTimeParser!.parsedExpireAt(int.parse('3600')))
          .thenReturn('2021-05-11T21:34:25.150');
      when(refreshTimer!.updateExpireTime('2021-05-11T21:34:25.150'))
          .thenReturn(refreshTimer!);
      when(refreshTimer!.reset()).thenReturn(null);

      when(fcm!.resetToken())
          .thenAnswer((Invocation realInvocation) => Future<void>.value());

      when(fcm!.getDeviceToken()).thenAnswer(
        (Invocation realInvocation) => Future<String>.value('test-token'),
      );
    });

    test('should register device token', () async {
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'registerPushToken': true}),
        201,
      );

      queryWhenThenAnswer(
        queryString: registerDeviceTokenQuery,
        variables: <String, dynamic>{'token': 'sampleToken'},
        response: response,
      );

      await registerDeviceToken(client: baseGraphQlClientMock);

      expect(
        () async => registerDeviceToken(client: baseGraphQlClientMock),
        returnsNormally,
      );
    });
  });
}
