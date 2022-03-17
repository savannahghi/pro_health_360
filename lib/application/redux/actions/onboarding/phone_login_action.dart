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
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_client_profile_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// [PhoneLoginAction] is a Redux Action whose job is to verify a user signed in using valid credentials that match those stored in the backend
///
/// Otherwise delightfully notify user of a Login Error or credentials mismatch
///
/// should initiate phone login process
class PhoneLoginAction extends ReduxAction<AppState> {
  PhoneLoginAction({
    required this.httpClient,
    required this.loginEndpoint,
    this.errorCallback,
  });

  final IGraphQlClient httpClient;
  final String loginEndpoint;
  final void Function(String reason)? errorCallback;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(phoneLoginFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(phoneLoginFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    /// [pin] variable is retrieving the PIN the user input in the [PhoneLogin] page from state
    /// [phoneNumber] variable is retrieving the Phone Number the user input in the [PhoneLogin] page from state
    final String? pin = state.onboardingState?.phoneLogin?.pinCode;
    final String? phoneNumber = state.onboardingState?.phoneLogin?.phoneNumber;

    /// Check to verify the PIN is `not null` and contains four digits
    if (pin != null &&
        pin != UNKNOWN &&
        pin.isNotEmpty &&
        pin.length == 4 &&
        phoneNumber != null) {
      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'pin': pin,
        'flavour': Flavour.consumer.name,
      };

      final Response httpResponse = await httpClient.callRESTAPI(
        endpoint: loginEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse);

      if (processedResponse.ok == true) {
        final Map<String, dynamic> parsed =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        // Check whether exponential backoff has been triggered
        if (parsed['code'] == 12) {
          final double? retryTime = parsed['retryTime'] as double?;

          dispatch(
            NavigateAction<AppState>.pushNamedAndRemoveUntil(
              AppRoutes.loginCounterPage,
              (Route<dynamic> route) => false,
              arguments: retryTime?.ceil(),
            ),
          );

          return state;
        }

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

        User? user = loginResponse.userResponse?.clientState?.user?.copyWith(
          pinChangeRequired: false,
          chatRoomToken: loginResponse.userResponse?.streamToken,
        );

        final String fullName =
            loginResponse.userResponse?.clientState?.user?.name ?? UNKNOWN;
        if (fullName != UNKNOWN && fullName.isNotEmpty) {
          final List<String> names = fullName.split(' ');
          user = user?.copyWith(firstName: names.first, lastName: names.last);
        }

        dispatch(
          UpdateOnboardingStateAction(
            hasSetNickName: user?.username != null,
            hasSetSecurityQuestions: user?.hasSetSecurityQuestions,
            hasSetPin: user?.hasSetPin,
            isPhoneVerified: user?.isPhoneVerified,
          ),
        );

        dispatch(UpdateUserAction(user: user));

        dispatch(
          UpdateClientProfileAction(
            id: loginResponse.userResponse?.clientState?.id,
            active: loginResponse.userResponse?.clientState?.active,
            counselled: loginResponse.userResponse?.clientState?.counselled,
            clientType: loginResponse.userResponse?.clientState?.clientType,
            facilityID: loginResponse.userResponse?.clientState?.facilityID,
            treatmentBuddy:
                loginResponse.userResponse?.clientState?.treatmentBuddy,
            treatmentEnrollmentDate: loginResponse
                .userResponse?.clientState?.treatmentEnrollmentDate,
            facilityName: loginResponse.userResponse?.clientState?.facilityName,
            chvUserID: loginResponse.userResponse?.clientState?.chvUserID,
            chvUserName: loginResponse.userResponse?.clientState?.chvUserName,
          ),
        );

        final OnboardingPathConfig onboardingPathConfig =
            onboardingPath(appState: state);

        dispatch(
          NavigateAction<AppState>.pushNamedAndRemoveUntil(
            onboardingPathConfig.route,
            (Route<dynamic> route) => false,
            arguments: onboardingPathConfig.arguments,
          ),
        );

        return state;
      } else {
        if (processedResponse.message == wrongLoginCredentials) {
          dispatch(PhoneLoginStateAction(invalidCredentials: true));
        }

        final Map<String, dynamic> body =
            json.decode(httpResponse.body) as Map<String, dynamic>;

        if (body['code'] == 48 ||
            (body['message']?.toString().contains('pin expired') ?? false)) {
          dispatch(
            NavigateAction<AppState>.pushNamedAndRemoveUntil(
              AppRoutes.pinExpiredPage,
              (Route<dynamic> route) => false,
            ),
          );

          return state;
        } else {
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
