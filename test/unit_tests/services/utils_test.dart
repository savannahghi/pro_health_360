// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
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
      expect(unProtectedRoutes[0], AppRoutes.phoneLogin);
    });

    test('formatSecurityQuestionDate should return birth date in en_GB format',
        () {
      initializeDateFormatting();
      const String enFormat = '1990-02-19';
      const String looseFormat = '19 Feb 1990';

      final String r1 = formatSecurityQuestionDate(enFormat);
      final String r2 = formatSecurityQuestionDate(looseFormat);

      expect(r1, equals(r2));
    });

    test(
        'formatSecurityQuestionDate should return birth date from britain format',
        () {
      initializeDateFormatting();
      const String enFormat = '1990-02-19';
      const String looseFormat = '19 Feb, 1990';

      final String r2 =
          formatSecurityQuestionDate(looseFormat, format: 'yyyy-MM-dd');

      expect(enFormat, equals(r2));
    });

    group('getAppSetupData', () {
      FlutterConfig.loadValueForTesting(<String, String>{
        'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
        'DEMO_SENTRY_DNS': 'test_demo_sentry_dns',
        'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
        'DEV_STREAM_API_KEY': 'dev_stream_api_key',
        'DEMO_STREAM_API_KEY': 'demo_stream_api_key',
        'PROD_STREAM_API_KEY': 'prod_stream_api_key',
      });

      test('should return the correct instance of AppSetupData', () async {
        expect(getAppSetupData(testAppContexts.last), devAppSetupData);

        expect(getAppSetupData(demoAppContexts.last), demoAppSetupData);

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

    test('getMoodColor should return the various mood colors', () {
      expect(getMoodColor('Happy').color, AppColors.greenHappyColor);
      expect(getMoodColor('Very Happy').color, AppColors.greenHappyColor);
      expect(getMoodColor('Meh').color, AppColors.mehMoodColor);
      expect(getMoodColor('Sad').color, AppColors.warningColor);
      expect(getMoodColor('Very Sad').color, AppColors.verySadColor);
      expect(getMoodColor('Other').color, AppColors.secondaryColor);
      expect(getMoodColor(null).color, AppColors.secondaryColor);
    });

    test('getFeedBackValidationMessage should return the various messages', () {
      expect(
        getFeedBackValidationMessage(
          feedBackType: FeedBackType.SERVICES_OFFERED,
          feedBackText: '',
          selectedRating: 0,
        ),
        'Please select a rating',
      );
      expect(
        getFeedBackValidationMessage(
          feedBackType: FeedBackType.SERVICES_OFFERED,
          feedBackText: '',
          selectedRating: 1,
        ),
        'Please enter the name of service',
      );
      expect(
        getFeedBackValidationMessage(
          feedBackType: FeedBackType.GENERAL_FEEDBACK,
          feedBackText: '',
          selectedRating: 1,
        ),
        'Please share your thoughts',
      );
    });

  test('resumeWithPIN returns the correct value', () {
      expect(
        resumeWithPIN(
          AppState.initial().copyWith(
            credentials: AuthCredentials.initial().copyWith(isSignedIn: true),
            onboardingState: OnboardingState.initial().copyWith(
              isPhoneVerified: true,
              hasSetSecurityQuestions: true,
              hasVerifiedSecurityQuestions: true,
              hasSetNickName: true,
              hasSetPin: true,
              hasAcceptedTerms: true,
            ),
            miscState: MiscState.initial().copyWith(
              inactiveTime: DateTime.now()
                  .subtract(const Duration(minutes: 10))
                  .toString(),
            ),
            clientState:
                ClientState.initial().copyWith(user: User(termsAccepted: true)),
          ),
        ),
        true,
      );
      expect(resumeWithPIN(AppState.initial()), false);
      expect(resumeWithPIN(AppState.initial()), false);
    });
  });

  test('userBannedMessage should return the correct message', () {
    expect(userBannedMessage(), 'User banned successfully');
    expect(
      userBannedMessage(userName: 'test', communityName: 'test'),
      'You have banned test from test',
    );
    expect(userBannedMessage(userName: 'test'), 'You have banned test');
    expect(
      userBannedMessage(
        isBanned: true,
      ),
      'User unbanned successfully',
    );
    expect(
      userBannedMessage(
        userName: 'test',
        communityName: 'test',
        isBanned: true,
      ),
      'You have unbanned test from test',
    );
    expect(
      userBannedMessage(
        userName: 'test',
        isBanned: true,
      ),
      'You have unbanned test',
    );
  });
}
