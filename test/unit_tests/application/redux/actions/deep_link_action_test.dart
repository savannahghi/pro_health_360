// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/deep_link_action.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_response.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import '../../../../mocks.dart';

void main() {
  group('DeepLinkAction', () {
    test('should navigate to home page', () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      final PhoneLoginResponse phoneLoginResponse =
          PhoneLoginResponse.fromJson(mockLoginResponse);

      store.dispatch(
        UpdateUserAction(user: phoneLoginResponse.clientState?.user),
      );

      store.dispatch(
        UpdateCredentialsAction(
          expiresIn: phoneLoginResponse.credentials?.expiresIn,
          isSignedIn: true,
        ),
      );

      store.dispatch(
        UpdateOnboardingStateAction(
          isPhoneVerified: true,
          hasSetNickName: true,
          hasSetSecurityQuestions: true,
          hasSetPin: true,
        ),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(DeepLinkAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushNamed?;

      expect(navDetails?.routeName, BWRoutes.home);
    });

    test('should navigate to phone login if user is null', () async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(clientState: null),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(DeepLinkAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushNamed?;

      expect(navDetails?.routeName, BWRoutes.phoneLogin);
    });

    test('should navigate to phone login if expiresAt is unknown', () async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(credentials: null),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(DeepLinkAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushNamed?;

      expect(navDetails?.routeName, BWRoutes.phoneLogin);
    });

    test('should navigate to phone login if token has expired', () async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());

      final PhoneLoginResponse phoneLoginResponse =
          PhoneLoginResponse.fromJson(mockLoginResponse);

      store.dispatch(
        UpdateUserAction(user: phoneLoginResponse.clientState?.user),
      );

      final String tokenExpiryDate =
          DateTime.now().add(const Duration(minutes: 1)).second.toString();

      store.dispatch(
        UpdateCredentialsAction(
          expiresIn: tokenExpiryDate,
        ),
      );

      final StoreTester<AppState> storeTester =
          StoreTester<AppState>.from(store);

      storeTester.dispatch(DeepLinkAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(NavigateAction);

      final NavigateAction<AppState>? actionDispatched =
          info.action as NavigateAction<AppState>?;

      final NavigatorDetails_PushNamed? navDetails =
          actionDispatched?.details as NavigatorDetails_PushNamed?;

      expect(navDetails?.routeName, BWRoutes.phoneLogin);
    });
  });
}
