// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
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
  });

  group('onboardingPath', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    test('should navigate to security questions page', () {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserProfileAction(
          termsAccepted: true,
          isPhoneVerified: true,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: false,
        ),
      );

      String path = '';

      path = onboardingPath(appState: store.state).route;
      expect(path, AppRoutes.securityQuestionsPage);
    });

    test('should navigate to terms and conditions page', () {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserProfileAction(
          pinChangeRequired: false,
          termsAccepted: false,
          isPhoneVerified: true,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: false,
        ),
      );

      String path = '';

      path = onboardingPath(appState: store.state).route;
      expect(path, AppRoutes.termsAndConditions);
    });

    test('should navigate to set pin page', () {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserProfileAction(
          pinChangeRequired: false,
          termsAccepted: true,
          isPhoneVerified: true,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: false,
        ),
      );

      String path = '';

      path = onboardingPath(appState: store.state).route;
      expect(path, AppRoutes.createPin);
    });

    test('should navigate to congratulations page', () {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserProfileAction(
          pinChangeRequired: false,
          termsAccepted: true,
          isPhoneVerified: true,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
        ),
      );

      String path = '';

      path = onboardingPath(appState: store.state).route;
      expect(path, AppRoutes.congratulationsPage);
    });

    test('should navigate to verify otp page', () {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserProfileAction(
          pinChangeRequired: false,
          isPhoneVerified: false,
        ),
      );

      String path = '';

      path = onboardingPath(appState: store.state).route;
      expect(path, AppRoutes.verifyPhone);
    });

    test('should navigate to login page', () {
      store.dispatch(UpdateCredentialsAction(isSignedIn: false));

      String path = '';

      path = onboardingPath(appState: store.state).route;
      expect(path, AppRoutes.phoneLogin);
    });
  });
}
