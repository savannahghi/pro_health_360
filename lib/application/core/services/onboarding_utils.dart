// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/create_pin_action.dart';
import 'package:myafyahub/application/redux/actions/create_pin_state_action.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/actions/set_nickname_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_config.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/constants.dart';

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

    if ((body['code'] == 7) && context != null) {
      return ProcessedResponse(
        ok: false,
        response: response,
        message: getUserFriendlyMsg(body['code'] as int),
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
      ok: false,
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
            WaitAction<AppState>.add(flag, ref: '${flag}_ref'),
          )
        : StoreProvider.dispatch(
            context,
            WaitAction<AppState>.remove(flag, ref: '${flag}_ref'),
          );
  }
}

Function checkWaitingForFunc(BuildContext context) {
  return ({required String flag}) {
    return StoreProvider.state<AppState>(context)!.wait!.isWaitingFor(flag);
  };
}

void clearAllFlags(BuildContext context) {
  SchedulerBinding.instance?.addPostFrameCallback((_) {
    StoreProvider.dispatch(
      context,
      WaitAction<AppState>.clear(),
    );
  });
}

Future<void> setUserPIN({
  String? phoneNumber,
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
      phone: phoneNumber,
      context: context,
      flag: createPinFlag,
      flavour: flavour,
    ),
  );
}

/// Determines the path to route the user to based on the app state
OnboardingPathConfig onboardingPath({
  required AppState? appState,
  bool calledOnResume = false,
}) {
  final bool isSignedIn = appState?.credentials?.isSignedIn ?? false;
  final bool termsAccepted =
      appState?.clientState?.user?.termsAccepted ?? false;
  final bool isPhoneVerified =
      appState?.onboardingState?.isPhoneVerified ?? false;
  final bool hasSetSecurityQuestions =
      appState?.onboardingState?.hasSetSecurityQuestions ?? false;
  final bool hasSetNickName =
      appState?.onboardingState?.hasSetNickName ?? false;
  final bool isPINSet = appState?.onboardingState?.isPINSet ?? false;

  if (!isSignedIn) {
    return OnboardingPathConfig(BWRoutes.phoneLogin);
  } else if (!isPhoneVerified) {
    return OnboardingPathConfig(BWRoutes.verifySignUpOTP);
  } else if (!termsAccepted) {
    return OnboardingPathConfig(BWRoutes.termsAndConditions);
  } else if (!hasSetSecurityQuestions) {
    return OnboardingPathConfig(BWRoutes.securityQuestionsPage);
  } else if (!isPINSet) {
    return OnboardingPathConfig(BWRoutes.createPin);
  } else if (!hasSetNickName) {
    return OnboardingPathConfig(BWRoutes.congratulationsPage);
  }

  return OnboardingPathConfig(BWRoutes.home);
}

/// Checks if token has expired based on expiry datetime
/// returns true if token expires in 10 minutes or less
/// otherwise returns false
bool hasTokenExpired(DateTime expiresAt, DateTime now) {
  return expiresAt.difference(now).inMinutes < 10;
}

Future<void> setUserNickname({
  required BuildContext context,
  required String nickName,
}) async {
  // this is the Redux Action that handles set nickname for an existing user
  await StoreProvider.dispatch<AppState>(
    context,
    SetNicknameAction(
      context: context,
      flag: setNickNameFlag,
      nickName: nickName,
    ),
  );
}
