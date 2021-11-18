// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:domain_objects/failures.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/string_constant.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/create_pin_action.dart';
import 'package:myafyahub/application/redux/actions/create_pin_state_action.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_config.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/sil_progress_dialog.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/constants.dart';
import 'package:url_launcher/url_launcher.dart';

/// [updateUserPin] resets a user's PIN
///
/// - it makes an api call to the reset PIN endpoint to reset a user's PIN
/// - it basically changes a user's PIN to the entered one after OTP confirmation
Future<void> updateUserPin({
  required BuildContext context,
  required String pin,
  required String phoneNumber,
  required String otp,
}) async {
  final Map<String, String> _variables = <String, String>{
    'phoneNumber': phoneNumber,
    'OTP': otp,
    'PIN': pin,
  };

  final IGraphQlClient _httpClient = AppWrapperBase.of(context)!.graphQLClient;

  final String endPoint =
      AppWrapperBase.of(context)!.customContext!.updateUserPinEndpoint;

  final http.Response response = await _httpClient.callRESTAPI(
    endpoint: endPoint,
    variables: _variables,
    method: httpPOST,
  );

  final dynamic body = json.decode(response.body);

  if (body != null && body == true) {
    Navigator.pushReplacementNamed(context, BWRoutes.phoneLogin);

    showFeedbackBottomSheet(
      context: context,
      modalContent: pinUpdateSuccess,
      imageAssetPath: infoIconUrl,
    );
  } else {
    reportErrorToSentry(context, response, hint: 'Error updating pin');
    await showFeedbackBottomSheet(
      context: context,
      modalContent: UserFeedBackTexts.getErrorMessage(),
      imageAssetPath: infoIconUrl,
    );
  }
}

Future<ProcessedResponse> requestForANewToken({
  required List<AppContext> thisAppContexts,
  required String refreshToken,
  required BuildContext context,
}) async {
  final IGraphQlClient _httpClient = AppWrapperBase.of(context)!.graphQLClient;
  final String refreshTokenEndpoint =
      AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint;

  final Map<String, dynamic> refreshTokenVariables = <String, dynamic>{
    'refreshToken': refreshToken,
    'appVersion': APPVERSION,
  };

  return processHttpResponse(
    await _httpClient.callRESTAPI(
      endpoint: refreshTokenEndpoint,
      method: 'POST',
      variables: refreshTokenVariables,
    ),
    context,
  );
}

Future<void> registerDeviceToken({required IGraphQlClient client}) async {
  final Map<String, dynamic> _variables = <String, dynamic>{
    'token': await SILFCM().getDeviceToken()
  };

  await client.query(registerDeviceTokenQuery, _variables);
}

/// [onboardingPath] routine is used to determine what should be the
/// first Page(route) a user should see on launching the application.
/// The selection of the Page(route) to show is determined by if the user
/// is already signed in/logged in or not.
///
/// 1. Signed in/ logged i// determines the path to route the user to based on the app state
OnboardingPathConfig onboardingPath(
  AppState state, {
  bool calledOnResume = false,
}) {
  // TODO!!(abiud): add more checks here when tying up the storyline

  /// take the user to the homepage if they have passed
  /// the normal user profile checks
  return OnboardingPathConfig(BWRoutes.home);
}

/// [processHttpResponse] routine is used to process a network call response, for errors, bad requests, timeouts and correct responses.
///
/// errors are further processed using our own custom error codes to determine if it an error within our error codes
ProcessedResponse processHttpResponse(
  http.Response response, [
  BuildContext? context,
]) {
  if (<int>[200, 201, 202].contains(response.statusCode)) {
    return ProcessedResponse(ok: true, response: response);
  }

  reportErrorToSentry(context, response, hint: '${response.statusCode}');

  if (response.statusCode == 400) {
    final Map<String, dynamic> body =
        json.decode(response.body) as Map<String, dynamic>;

    /**
       *  TODO!!(abiud): confirm with the backend to remove error code 4 
       */

    if ((body['code'] == 7 || body['code'] == 10) && context != null) {
      throw SILException(
        error: body,
        cause: noUserFound,
        message: getUserPhoneNumbersMessage,
      );
    }

    if (body['code'] == 8 && context != null) {
      StoreProvider.dispatch(
        context,
        PhoneLoginStateAction(invalidCredentials: true),
      );
    }

    return ProcessedResponse(
      ok: false,
      response: response,
      message: getUserFriendlyMsg(body['code'] as int),
    );
  }
  if (response.statusCode == 500) {
    final int code = json.decode(response.body)['code'] != null
        ? json.decode(response.body)['code'] as int
        : 11;

    return ProcessedResponse(
      ok: false,
      response: response,
      message: getUserFriendlyMsg(code),
    );
  }
  if (response.statusCode == 408) {
    return ProcessedResponse(
      ok: true,
      response: response,
      message: getUserFriendlyMsg(0),
    );
  }
  return ProcessedResponse(
    ok: false,
    response: response,
    message: UserFeedBackTexts.getErrorMessage(),
  );
}

String getUserFriendlyMsg(int code) {
  switch (code) {
    case 0:
      return slowInternet;
    case 4:
      return userWithThatPhoneExists;
    case 5:
      return userWithThatEmailExists;
    case 6:
      return usernameExists;
    case 7:
    case 10:
      return userNotFound;
    case 8:
      return wrongLoginCredentials;
    case 9:
      return pinNotFound;
    default:
      return defaultUserFriendlyMessage;
  }
}

void toggleLoadingIndicator({
  required BuildContext context,
  required String? flag,
  bool show = true,
}) {
  if (flag != null) {
    show
        ? StoreProvider.dispatch(
            context,
            WaitAction<AppState>.add(
              flag,
              ref: '${flag}_ref',
            ),
          )
        : StoreProvider.dispatch(
            context,
            WaitAction<AppState>.remove(
              flag,
              ref: '${flag}_ref',
            ),
          );
  }
}

Widget showSaveProfileDetailsSILProgressDialog(BuildContext context) {
  return const SILProgressDialog(message: Text(updatingProfileDetails));
}

Object actionWrapError({
  required dynamic error,
  required BuildContext context,
}) async {
  if (error.runtimeType == SILException) {
    if (error.cause.contains('no_user_account_found') == true) {
      genericBottomSheet(
        context: context,
        message: noUserFoundString,
        isError: true,
        primaryActionCallback: () =>
            Navigator.pushReplacementNamed(context, BWRoutes.phoneLogin),
        primaryActionText: createAccountButtonText,
        buttonColor: AppColors.primaryColor,
      );
      return error;
    }
    genericBottomSheet(
      context: context,
      message: error.message as String,
      isError: true,
      primaryActionCallback: () =>
          Navigator.pushReplacementNamed(context, BWRoutes.phoneLogin),
      primaryActionText: continueToLoginButtonText,
      secondaryActionCallback: () => Navigator.of(context).pop(),
      secondaryActionText: retryButtonText,
      buttonColor: AppColors.primaryColor,
    );
    return error;
  }
  showFeedbackBottomSheet(
    context: context,
    modalContent: UserFeedBackTexts.getErrorMessage(),
    imageAssetPath: errorIconUrl,
  );
  return error;
}

Function checkWaitingForFunc(BuildContext context) {
  return ({required String flag}) {
    return StoreProvider.state<AppState>(context)!.wait!.isWaitingFor(flag);
  };
}

void clearAllFlags(BuildContext context) {
  SchedulerBinding.instance!.addPostFrameCallback((_) {
    StoreProvider.dispatch(
      context,
      WaitAction<AppState>.clear(),
    );
  });
}

void callSupport() {
  launch(silPhoneNumber);
}

void chatOnWhatsApp() {
  launchWhatsApp(
    message: '',
    phone: kWhatsAppNumber,
    launch: launch(
      whatsAppUrl(
        phone: kWhatsAppNumber,
        message: '',
      ),
    ),
  );
}

void listenForConnectivityChanges(ConnectivityResult result) {
  if (result == ConnectivityResult.none) {
    InternetConnectivitySubject().connectivitySubject.add(false);
  } else {
    InternetConnectivitySubject().connectivitySubject.add(true);
  }
}

// void refreshTokenAndUpdateState({
//   required bool value,
//   required bool signedIn,
//   required BuildContext context,
//   required List<AppContext> appContexts,
//   required String refreshToken,
// }) {
//   if (value) {
//     // check if user is logged in
//     if (signedIn) {
//       // request for a new token
//       requestForANewToken(
//         context: context,
//         thisAppContexts: appContexts,
//         refreshToken: refreshToken,
//       ).then((ProcessedResponse response) {
//         //check if the request was successful
//         if (response.ok) {
//           // update state with the new token
//           updateStateAuth(context: context, processedResponse: response);
//         }
//       });
//     }
//   }
// }

Future<void> setUserPIN({
  required BuildContext context,
  required String newPIN,
  required String confirmPIN,
  required String flavour,
}) async {
  // this is the Redux Action that store the PINs user enters
  StoreProvider.dispatch(
    context,
    CreatePINStateAction(
      newPIN: newPIN,
      confirmPIN: confirmPIN,
    ),
  );

  // this is the Redux Action that handles set PIN for an existing user
  await StoreProvider.dispatch<AppState>(
    context,
    CreatePINAction(
      context: context,
      flag: createPinFlag,
      newPIN: newPIN,
      confirmPIN: confirmPIN,
      flavour: flavour,
    ),
  );
}

