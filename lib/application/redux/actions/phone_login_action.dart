import 'dart:async';

import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:user_feed/user_feed.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:misc_utilities/refresh_token_manager.dart';

import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

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
    final String pin = store.state.miscState!.phoneLogin!.pinCode;
    final String phoneNumber = store.state.miscState!.phoneLogin!.phoneNumber;

    /// Check to verify the PIN is `not null` and contains four digits
    if (pin != UNKNOWN && pin.length == 4) {
      // make the variables
      final Map<String, dynamic> _variables = <String, dynamic>{
        'phoneNumber': phoneNumber,
        'pin': pin,
        'flavour': Flavour.CONSUMER.name,
        'appVersion': APPVERSION,
      };

      /// initialize the http client from [AppWrapperBase]
      final IGraphQlClient _httpClient =
          AppWrapperBase.of(context)!.graphQLClient;

      /// initialize the [loginByPhoneEndpoint] endpoint used to verify user logging in with phone number and PIN
      final String endPoint =
          AppWrapperBase.of(context)!.customContext!.loginByPhoneEndpoint;

      /// network request is made to the backend to verify that the user provided credentials match those stored in our backend and result store in [processedResponse] variable
      final ProcessedResponse processedResponse = processHttpResponse(
          await _httpClient.callRESTAPI(
              endpoint: endPoint, variables: _variables, method: httpPOST),
          context);

      if (processedResponse.ok == true) {
        afterLoginOrCreateAccount(
            context: context,
            onboardActionType: OnboardActionType.login,
            processedResponse: processedResponse,
            store: store,
            graphQlClient: _httpClient,
            dateTimeParser: this.dateTimeParser,
            refreshTokenManger: this.tokenManger);
        return state;
      } else {
        // exception thrown if the backend could not match the provided credentials with those stored in the backend
        showFeedbackBottomSheet(
          context: context,
          modalContent: processedResponse.message ?? UNKNOWN, // safety-net
          imageAssetPath: errorIconUrl,
        );

        throw SILException(
            error: processedResponse.response,
            cause: 'sign_in_error',
            message: processedResponse.message);
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

  ///  this method sets the loading indicator to hide after end of execution of the `reduce()` method4
  /// show is initially set to `true`. Expect exception of type [ SILException] only
  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException && error.error != null) {
      reportErrorToSentry(context, error.error, hint: errorLoggingIn);
    }
    if (error.cause == noUserFound) {
      showFeedbackBottomSheet(
        context: context,
        modalContent: noUserFoundString,
        imageAssetPath: errorIconUrl,
      );
    }
    return error;
  }
}
