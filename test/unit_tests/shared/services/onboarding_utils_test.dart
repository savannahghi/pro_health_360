import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/router/routes.dart';

void main() {
  group('OnboardingPath', () {
    late Store<AppState> store;
    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should navigate to security questions page',
        (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserProfileAction(termsAccepted: true, isPhoneVerified: true),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: false,
          currentOnboardingStage: CurrentOnboardingStage.Login,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.securityQuestionsPage);
    });

    testWidgets('should navigate to terms and conditions page',
        (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserProfileAction(
          pinChangeRequired: true,
          termsAccepted: false,
          isPhoneVerified: true,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: false,
          currentOnboardingStage: CurrentOnboardingStage.Login,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.termsAndConditions);
    });

    testWidgets('should navigate to set pin page', (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserProfileAction(
          pinChangeRequired: true,
          termsAccepted: true,
          isPhoneVerified: true,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: false,
          currentOnboardingStage: CurrentOnboardingStage.Login,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.createPin);
    });

    testWidgets('should navigate to congratulations page',
        (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserProfileAction(
          pinChangeRequired: true,
          termsAccepted: true,
          isPhoneVerified: true,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
          currentOnboardingStage: CurrentOnboardingStage.Login,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.congratulationsPage);
    });

    testWidgets('should navigate to verify phone page',
        (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: true));
      store.dispatch(
        UpdateUserProfileAction(
          pinChangeRequired: true,
          isPhoneVerified: false,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.Login,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.verifySignUpOTP);
    });

    testWidgets('should navigate to home page upon successful sign up',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateUserProfileAction(
          pinChangeRequired: true,
          isPhoneVerified: true,
          termsAccepted: true,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.Login,
          isPhoneVerified: true,
          hasSetSecurityQuestions: true,
          hasSetNickName: true,
          hasSetPin: true,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.phoneLogin);
    });

    testWidgets(
        'should navigate to login page after successful PIN change '
        'after expiry', (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.PINExpired,
          isPhoneVerified: true,
          hasSetPin: true,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.phoneLogin);
    });

    testWidgets(
        'should navigate to login page after successful PIN change '
        'after PIN reset', (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.ResetPIN,
          isPhoneVerified: true,
          hasSetPin: true,
          hasSetSecurityQuestions: true,
          hasVerifiedSecurityQuestions: true,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.phoneLogin);
    });

    testWidgets('should navigate verify phone page when changing the PIN',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.ResetPIN,
          isPhoneVerified: false,
          hasSetPin: true,
          hasSetSecurityQuestions: true,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.verifySignUpOTP);
    });

    testWidgets('should navigate create PIN page when changing the PIN',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.PINUpdate,
          isPhoneVerified: true,
          hasSetPin: false,
          hasSetSecurityQuestions: true,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.createPin);
    });

    testWidgets(
        'should navigate security questions page when resetting the PIN',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.ResetPIN,
          isPhoneVerified: true,
          hasSetPin: true,
          hasSetSecurityQuestions: false,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.securityQuestionsPage);
    });

    testWidgets('should navigate security questions page when changing the PIN',
        (WidgetTester tester) async {
      store.dispatch(
        UpdateOnboardingStateAction(
          currentOnboardingStage: CurrentOnboardingStage.PINUpdate,
          isPhoneVerified: true,
          hasSetPin: true,
          hasSetSecurityQuestions: false,
        ),
      );

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.securityQuestionsPage);
    });

    testWidgets('should navigate to login page page',
        (WidgetTester tester) async {
      store.dispatch(UpdateCredentialsAction(isSignedIn: false));

      final String path = onboardingPath(appState: store.state).nextRoute;

      expect(path, AppRoutes.phoneLogin);
    });
  });
}
