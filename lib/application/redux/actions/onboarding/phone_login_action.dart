// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/src/response.dart';
import 'package:misc_utilities/refresh_token_manager.dart';
// Project imports:
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/bottom_nav_action.dart';
import 'package:myafyahub/application/redux/actions/update_client_profile_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_config.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login_response.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:user_feed/user_feed.dart';

/// [PhoneLoginAction] is a Redux Action whose job is to verify a user signed in using valid credentials that match those stored in the backend
///
/// Otherwise delightfully notify user of a Login Error or credentials mismatch
///
/// should initiate phone login process
class PhoneLoginAction extends ReduxAction<AppState> {
  PhoneLoginAction({
    required this.context,
    required this.flag,
    required this.tokenManger,
    required this.dateTimeParser,
  });

  final BuildContext context;
  final String flag;
  final RefreshTokenManger tokenManger;
  final DateTimeParser dateTimeParser;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: flag);
  }

  @override
  void after() {
    toggleLoadingIndicator(context: context, flag: flag, show: false);
    super.after();
  }

  @override
  Future<AppState> reduce() async {
    /// [pin] variable is retrieving the PIN the user input in the [PhoneLogin] page from state
    /// [phoneNumber] variable is retrieving the Phone Number the user input in the [PhoneLogin] page from state
    final String? pin = state.onboardingState?.phoneLogin?.pinCode;
    final String? phoneNumber = state.onboardingState?.phoneLogin?.phoneNumber;

    /// Check to verify the PIN is `not null` and contains four digits
    if (pin != null &&
        pin != UNKNOWN &&
        pin.isNotEmpty &&
        phoneNumber != null) {
      final Map<String, dynamic> variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'pin': pin,
        'flavour': Flavour.CONSUMER.name,
      };

      dispatch(
        UpdateUserAction(
          user: User.initial().copyWith(
            primaryContact: Contact.initial().copyWith(value: phoneNumber),
          ),
        ),
      );

      final IGraphQlClient httpClient =
          AppWrapperBase.of(context)!.graphQLClient;

      final String loginEndpoint =
          AppWrapperBase.of(context)!.customContext!.loginByPhoneEndpoint;

      final Response httpResponse = await httpClient.callRESTAPI(
        endpoint: loginEndpoint,
        method: httpPOST,
        variables: variables,
      );

      final ProcessedResponse processedResponse =
          processHttpResponse(httpResponse, context);

      if (processedResponse.ok == true) {
        final Map<String, dynamic> parsed =
            jsonDecode(httpResponse.body) as Map<String, dynamic>;

        final PhoneLoginResponse loginResponse =
            PhoneLoginResponse.fromJson(parsed);

        final DateTime now = DateTime.now();
        AuthCredentials? authCredentials = loginResponse.credentials?.copyWith(
          signedInTime: now.toIso8601String(),
          isSignedIn: true,
        );

        final String? expiresIn = loginResponse.credentials?.expiresIn;
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

        final User? user =
            loginResponse.clientState?.user?.copyWith(pinChangeRequired: false);

        dispatch(
          UpdateOnboardingStateAction(
            hasSetNickName: user?.username != null,
            hasSetSecurityQuestions: user?.hasSetSecurityQuestions,
            hasSetPin: user?.hasSetPin,
            isPhoneVerified: user?.isPhoneVerified,
          ),
        );

        dispatch(UpdateUserAction(user: user));

        dispatch(UpdateClientProfileAction(id: loginResponse.clientState?.id));

        final OnboardingPathConfig onboardingPathConfig =
            onboardingPath(appState: state);

        dispatch(
          BottomNavAction(currentBottomNavIndex: BottomNavIndex.home.index),
        );

        Navigator.of(context).pushNamedAndRemoveUntil(
          onboardingPathConfig.route,
          (Route<dynamic> route) => false,
          arguments: onboardingPathConfig.arguments,
        );
        return state;
      } else {
        // exception thrown if the backend could not match the provided
        //credentials with those stored in the backend
        showFeedbackBottomSheet(
          context: context,
          modalContent: processedResponse.message ?? UNKNOWN, // safety-net
          imageAssetPath: errorIconUrl,
        );

        throw SILException(
          error: processedResponse.response,
          cause: 'sign_in_error',
          message: processedResponse.message,
        );
      }
    } else {
      showFeedbackBottomSheet(
        context: context,
        modalContent: fourDigitPin,
        imageAssetPath: infoIconUrl,
      );
      // exception thrown incase the provided PIN is less than four digits
      throw SILException(cause: 'pin_too_short', message: fourDigitPin);
    }
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException && error.error != null) {
      reportErrorToSentry(context, error.error, hint: errorLoggingIn);
    }

    return error;
  }
}
