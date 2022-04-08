// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/src/response.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_client_profile_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/communities_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_info.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// [PhoneLoginAction] is a Redux Action whose job is to verify a user signed
/// in using valid credentials that match those stored in the backend
///
/// Otherwise delightfully notify user of a Login Error or credentials mismatch
///
/// should initiate phone login process
class PhoneLoginAction extends ReduxAction<AppState> {
  PhoneLoginAction({
    required this.httpClient,
    required this.endpoint,
    this.errorCallback,
  });

  final void Function(String reason)? errorCallback;
  final String endpoint;
  final IGraphQlClient httpClient;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(phoneLoginFlag));
    super.after();
  }

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(phoneLoginFlag));
    dispatch(
      UpdateOnboardingStateAction(
        currentOnboardingStage: CurrentOnboardingStage.Login,
      ),
    );
  }

  @override
  Future<AppState?> reduce() async {
    /// [pin] variable is retrieving the PIN the user input in the [PhoneLogin] page from state
    /// [phoneNumber] variable is retrieving the Phone Number the user input in the [PhoneLogin] page from state
    final String pin = state.onboardingState?.pin ?? UNKNOWN;
    final String phoneNumber = state.onboardingState?.phoneNumber ?? UNKNOWN;

    /// Check and verify that the phone and PIN are present
    if (pin != UNKNOWN && phoneNumber != UNKNOWN && pin.length == 4) {
      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'pin': pin,
        'flavour': Flavour.consumer.name,
      };

      final Response httpResponse = await httpClient.callRESTAPI(
        endpoint: endpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      if (processedResponse.ok) {
        final Map<String, dynamic> parsed =
            jsonDecode(processedResponse.response.body) as Map<String, dynamic>;

        final PhoneLoginResponse loginResponse =
            PhoneLoginResponse.fromJson(parsed);

        final DateTime now = DateTime.now();

        AuthCredentials? authCredentials =
            loginResponse.userResponse?.credentials?.copyWith(
          signedInTime: now.toIso8601String(),
          isSignedIn: true,
        );

        final String? expiresIn =
            loginResponse.userResponse?.credentials?.expiresIn;

        if (expiresIn != null && expiresIn.isNotEmpty && isNumeric(expiresIn)) {
          final DateTime tokenExpiryTimestamp =
              now.add(Duration(seconds: int.tryParse(expiresIn) ?? 0));

          authCredentials = authCredentials?.copyWith(
            tokenExpiryTimestamp: tokenExpiryTimestamp.toIso8601String(),
          );
        }

        dispatch(
          AuthStatusAction(
            idToken: authCredentials?.idToken,
            refreshToken: authCredentials?.refreshToken,
            expiresIn: authCredentials?.expiresIn,
            isSignedIn: true,
            signedInTime: authCredentials?.signedInTime,
            tokenExpiryTimestamp: authCredentials?.tokenExpiryTimestamp,
          ),
        );

        // Update the user with the chatroom token
        User? user = loginResponse.userResponse?.clientState?.user?.copyWith(
          chatRoomToken: loginResponse.userResponse?.streamToken,
        );

        // Clean up the user's names
        final String fullName =
            loginResponse.userResponse?.clientState?.user?.name ?? UNKNOWN;
        if (fullName != UNKNOWN && fullName.isNotEmpty) {
          final List<String> names = fullName.split(' ');
          user = user?.copyWith(firstName: names.first, lastName: names.last);
        }

        dispatch(
          UpdateOnboardingStateAction(
            isPhoneVerified: user?.isPhoneVerified,
            hasSetNickName: user?.username != null,
            hasSetSecurityQuestions: user?.hasSetSecurityQuestions,
            hasSetPin: user?.hasSetPin,
            hasAcceptedTerms: user?.termsAccepted,
          ),
        );

        dispatch(
          UpdateClientStateAction(
            clientState: loginResponse.userResponse?.clientState?.copyWith.call(
              user: user,
              communitiesState: CommunitiesState.initial(),
            ),
          ),
        );

        /// This addresses cases where a user's PIN has been reset by an admin
        /// and it needs to be changed before accessing the platform
        ///
        /// Note: For this to work, the backend should trigger these properties
        /// in the user profile (isPhoneVerified, hasSetPin, hasSetSecurityQuestions)
        if (user?.pinUpdateRequired ?? false) {
          dispatch(
            UpdateOnboardingStateAction(
              currentOnboardingStage: CurrentOnboardingStage.PINUpdate,
              isPhoneVerified: false,
              hasSetPin: false,
              hasSetSecurityQuestions: false,
            ),
          );
        }

        /// This is used to kickstart the onboarding workflow for a new user
        if (user?.pinChangeRequired ?? false) {
          dispatch(
            UpdateOnboardingStateAction(
              currentOnboardingStage: CurrentOnboardingStage.Login,
              isPhoneVerified: false,
              hasAcceptedTerms: false,
              hasSetSecurityQuestions: false,
              hasSetPin: false,
              hasSetNickName: false,
            ),
          );
        }

        final OnboardingPathInfo navConfig = onboardingPath(appState: state);

        dispatch(
          NavigateAction<AppState>.pushNamedAndRemoveUntil(
            navConfig.nextRoute,
            (Route<dynamic> route) => false,
            arguments: navConfig.arguments,
          ),
        );

        return state;
      } else {
        final Map<String, dynamic> parsed =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        switch (processedResponse.code) {
          case 8:
            dispatch(UpdateOnboardingStateAction(invalidCredentials: true));
            // exception thrown if the backend could not match the provided
            //credentials with those stored in the backend
            errorCallback?.call(processedResponse.message ?? UNKNOWN);
            return state;
          case 48:
            dispatch(
              NavigateAction<AppState>.pushNamedAndRemoveUntil(
                AppRoutes.pinExpiredPage,
                (Route<dynamic> route) => false,
              ),
            );
            return state;
          case 72:
            dispatch(
              NavigateAction<AppState>.pushNamedAndRemoveUntil(
                AppRoutes.pendingPINRequestPage,
                (Route<dynamic> route) => false,
              ),
            );
            return state;
          case 73:
            final double? retryTime = parsed['retryTime'] as double?;

            dispatch(
              NavigateAction<AppState>.pushNamedAndRemoveUntil(
                AppRoutes.loginCounterPage,
                (Route<dynamic> route) => false,
                arguments: retryTime?.ceil(),
              ),
            );

            return state;
          default:
            // exception thrown if the backend could not match the provided
            //credentials with those stored in the backend
            errorCallback?.call(processedResponse.message ?? UNKNOWN);
        }
      }
    } else {
      errorCallback?.call(fourDigitPin);

      return null;
    }
  }

  @override
  Object? wrapError(dynamic error) {
    Sentry.captureException(error, hint: 'Login failed');

    return UserException(getErrorMessage());
  }
}
