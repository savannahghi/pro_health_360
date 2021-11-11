// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import '../../mocks.dart';

void main() {
  group('Utils', () {
    test('should sentence case username', () {
      expect(
        sentenceCaseUserName(firstName: 'ule', lastName: 'makmende'),
        'Ule Makmende',
      );
      expect(sentenceCaseUserName(firstName: 'u', lastName: 'm'), 'u m');
      expect(sentenceCaseUserName(firstName: '', lastName: ''), ' ');
    });

    test('should return false on onWillPopCallback call', () async {
      final bool res = await onWillPopCallback();
      expect(res, false);
    });

    test('should return an unprotected route', () async {
      expect(unProtectedRoutes[0], BWRoutes.phoneLogin);
    });

    test('should throw message no_user_account_found', () {
      final Response expectedResponse =
          Response(json.encode(<String, dynamic>{'code': 7}), 400);
      final MockBuildContext context = MockBuildContext();

      expect(
        () => processHttpResponse(expectedResponse, context),
        throwsException,
      );
    });

    test('should parser expiredAt', () {
      expect(DateTimeParser().parsedExpireAt(int.parse('3600')), isA<String>());
      expect(
        DateTimeParser().parsedExpireAt(int.parse('3600')).contains('T'),
        true,
      );

      expect(
        DateTimeParser(
          useCustomDateTime: true,
          customDateTime: DateTime.parse('2021-05-18 13:27:00'),
        ).parsedExpireAt(int.parse('3600')),
        isA<String>(),
      );
    });

    group('getAppSetupData', () {
      FlutterConfig.loadValueForTesting(<String, String>{
        'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
        'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
      });

      test('should return the correct instance of AppSetupData', () async {
        expect(getAppSetupData(testAppContexts.last), devAppSetupData);

        expect(getAppSetupData(demoAppContexts.last), devAppSetupData);

        expect(getAppSetupData(prodAppContexts.last), prodAppSetupData);

        expect(getAppSetupData(e2eAppContexts.last), devAppSetupData);

        expect(getAppSetupData(AppContext.BewellCONSUMER), devAppSetupData);
      });
    });
  });
}
