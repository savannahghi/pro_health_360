// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:dart_fcm/dart_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import '../../../mock_utils.dart';
import './onboarding_utils_2_test.mocks.dart';

@GenerateMocks(<Type>[DateTimeParser, SILFCM])
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
    MockDateTimeParser? dateTimeParser;

    MockSILFCM? fcm;

    setUp(() async {
      dateTimeParser = MockDateTimeParser();
      fcm = MockSILFCM();

      when(dateTimeParser!.parsedExpireAt(int.parse('3600')))
          .thenReturn('2021-05-11T21:34:25.150');

      when(fcm!.resetToken())
          .thenAnswer((Invocation realInvocation) => Future<void>.value());

      when(fcm!.getDeviceToken()).thenAnswer(
        (Invocation realInvocation) => Future<String>.value('test-token'),
      );
    });
  });
}
