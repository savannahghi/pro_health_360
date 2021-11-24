// Dart imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/presentation/router/routes.dart';

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

    test('formatSecurityQuestionDate should return birthdate in en_GB format',
        () {
      initializeDateFormatting();
      const String enFormat = '1990-02-19';
      const String looseFormat = '19 Feb 1990';

      final String r1 = formatSecurityQuestionDate(enFormat);
      final String r2 = formatSecurityQuestionDate(looseFormat);

      expect(r1, equals(r2));
    });

    test(
        'formatSecurityQuestionDate should return birthdate from britain format',
        () {
      initializeDateFormatting();
      const String enFormat = '1990-02-19';
      const String looseFormat = '19 Feb, 1990';

      final String r2 =
          formatSecurityQuestionDate(looseFormat, format: 'yyyy-MM-dd');

      expect(enFormat, equals(r2));
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

    test('getEnvironmentContext should return the correct contexts', () async {
      expect(getEnvironmentContext(<AppContext>[AppContext.AppProd]), 'prod');
      expect(getEnvironmentContext(<AppContext>[AppContext.AppDemo]), 'demo');
      expect(getEnvironmentContext(<AppContext>[AppContext.AppTest]), 'test');
    });
  });
}
