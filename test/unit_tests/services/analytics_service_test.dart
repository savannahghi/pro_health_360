import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/core/services/analytics_service.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_analytics_platform_interface/firebase_analytics_platform_interface.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AnalyticsService', () {
    final List<MethodCall> methodCallLog = <MethodCall>[];

    setUp(() async {
      MethodChannelFirebaseAnalytics.channel
          .setMockMethodCallHandler((MethodCall methodCall) async {
        methodCallLog.add(methodCall);
        switch (methodCall.method) {
          default:
            return false;
        }
      });

      MethodChannelFirebase.channel
          .setMockMethodCallHandler((MethodCall call) async {
        if (call.method == 'Firebase#initializeCore') {
          return <Map<String, dynamic>>[
            <String, dynamic>{
              'name': defaultFirebaseAppName,
              'options': <String, dynamic>{
                'apiKey': '123',
                'appId': '123',
                'messagingSenderId': '123',
                'projectId': '123',
              },
              'pluginConstants': <String, dynamic>{},
            }
          ];
        }

        if (call.method == 'Firebase#initializeApp') {
          return <String, dynamic>{
            'name': call.arguments['appName'],
            'options': call.arguments['options'],
            'pluginConstants': <String, dynamic>{},
          };
        }

        return null;
      });
      await Firebase.initializeApp();
    });

    tearDown(() {
      methodCallLog.clear();
    });

    test('should return the correct analytics observer', () {
      expect(
        AnalyticsService().getAnalyticsObserver(),
        isA<FirebaseAnalyticsObserver>(),
      );
    });

    test(
      'should initialize the analytics setup and set all properties correctly',
      () async {
        await AnalyticsService().init(environment: 'test');

        expect(methodCallLog.length, 4);
        expect(methodCallLog, <Matcher>[
          isMethodCall(
            'Analytics#setAnalyticsCollectionEnabled',
            arguments: <String, bool>{'enabled': true},
          ),
          isMethodCall(
            'Analytics#setUserProperty',
            arguments: <String, String>{
              'name': 'program',
              'value': 'myCareHub',
            },
          ),
          isMethodCall(
            'Analytics#setUserProperty',
            arguments: <String, Object>{
              'name': 'flavour',
              'value': 'CONSUMER',
            },
          ),
          isMethodCall(
            'Analytics#setUserProperty',
            arguments: <String, Object>{
              'name': 'environment',
              'value': 'test',
            },
          ),
        ]);
      },
    );

    test('should reset the current user ID', () async {
      await AnalyticsService().reset();

      expect(methodCallLog.length, 1);
      expect(methodCallLog, <Matcher>[
        isMethodCall(
          'Analytics#setUserId',
          arguments: <String, dynamic>{'userId': null},
        ),
      ]);
    });

    test('should set the current user ID', () async {
      await AnalyticsService().setUserId('test-user-id');

      expect(methodCallLog.length, 1);
      expect(methodCallLog, <Matcher>[
        isMethodCall(
          'Analytics#setUserId',
          arguments: <String, dynamic>{'userId': 'test-user-id'},
        ),
      ]);
    });

    test(
      'should log an event when the userID and user names are available',
      () async {
        await AnalyticsService().logEvent(
          name: 'testEvent',
          eventType: AnalyticsEventType.AUTH_EVENT,
          parameters: <String, dynamic>{'test_param': 'value'},
        );

        expect(methodCallLog.length, 1);
        expect(methodCallLog.first, isA<MethodCall>());
        expect(
          methodCallLog,
          <Matcher>[
            isMethodCall(
              'Analytics#logEvent',
              arguments: <String, dynamic>{
                'eventName': 'testEvent',
                'parameters': <String, dynamic>{
                  'eventType': 'AUTH_EVENT',
                  'test_param': 'value',
                },
              },
            )
          ],
        );
      },
    );
  });
}
