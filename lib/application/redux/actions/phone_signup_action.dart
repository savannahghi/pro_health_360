// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:misc_utilities/refresh_token_manager.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/phone_signup.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

/// [PhoneSignUpAction] is a Redux Action whose job is to verify a `NEW` user has satisfied Sign Up preconditions and there after successfully created
///
/// Otherwise delightfully notify user of a Sign Up Error or credentials mismatch
///
/// should initiate phone Sign Up process

class PhoneSignUpAction extends ReduxAction<AppState> {
  PhoneSignUpAction(
      {required this.context,
      required this.flag,
      required this.tokenManger,
      required this.dateTimeParser,
      this.onboardActionType = OnboardActionType.createAccount});

  final BuildContext context;
  final String flag;
  final RefreshTokenManger tokenManger;
  final DateTimeParser dateTimeParser;
  final OnboardActionType onboardActionType;

  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: flag);
  }

  @override
  Future<AppState> reduce() async {
    /// [phoneSignUpState] variable is initializing the [phoneSignUpState] from state
    /// [phoneNumber] variable is retrieving the Phone Number the user input in the [PhoneLogin] page from state
    /// [createPin] variable is retrieving the Created PIN the user input in the [CreatePinPage] page from state
    /// [verifyStepOtp] variable is retrieving the OTP sent to the user to verify their phone number during Sign UP
    final PhoneSignUp? phoneSignUpState = store.state.miscState!.phoneSignUp;
    final String? phoneNumber = phoneSignUpState?.phoneNumber;
    final String? verifyStepOtp = phoneSignUpState?.otp;
    final String? createPin = phoneSignUpState?.createPin;
    final String? confirmPin = phoneSignUpState?.confirmPin;

    /// check to verify that Created PIN matches the confirm PIN, which throws an exception they do not match
    if (confirmPin != createPin) {
      // coverage:ignore-line to ignore one line
      throw SILException(cause: 'pin_match_error', message: misMatchedPins);
    }

    final Map<String, String> variables = <String, String>{
      'phoneNumber': phoneNumber!,
      'pin': confirmPin!,
      'flavour': Flavour.CONSUMER.name,
      'otp': verifyStepOtp!,
      'appVersion': APPVERSION,
    };

    /// initialize the [createAccountEndpoint] endpoint used to create a new user
    final String createAccountEndpoint =
        AppWrapperBase.of(context)!.customContext!.createUserByPhoneEndpoint;

    /// initialize the http client from [AppWrapperBase]
    final IGraphQlClient _httpClient =
        AppWrapperBase.of(context)!.graphQLClient;

    /// network request made to create a new user
    final ProcessedResponse processedResponse = processHttpResponse(
        await _httpClient.callRESTAPI(
            endpoint: createAccountEndpoint,
            variables: variables,
            method: 'POST'),
        context);

    if (processedResponse.ok) {
      afterLoginOrCreateAccount(
          context: context,
          onboardActionType: this.onboardActionType,
          processedResponse: processedResponse,
          store: store,
          graphQlClient: _httpClient,
          dateTimeParser: this.dateTimeParser,
          refreshTokenManger: this.tokenManger);

      return state;
    }
    showFeedbackBottomSheet(
      context: context,
      modalContent: processedResponse.message!,
      imageAssetPath: errorIconUrl,
    );
    // throw an exception if the user creation process encountered an error
    throw SILException(
      error: processedResponse.response,
      cause: 'create_account_error',
      message: failedToCreateAccount,
    );
  }

  ///  this method sets the loading indicator to hide after end of execution of the `reduce()` method4
  /// show is initially set to `true`
  @override
  void after() {
    toggleLoadingIndicator(context: context, flag: flag, show: false);
  }

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  /// returns a bottom sheet that gives the user a friendly message and an option to create an account
  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException && error.error != null) {
      reportErrorToSentry(context, error.error, hint: errorSigningUp);
    }
    return actionWrapError(error: error, context: context);
  }
}
