// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/create_pin_action.dart';
import 'package:myafyahub/application/redux/actions/create_pin_state_action.dart';
import 'package:myafyahub/application/redux/actions/set_nickname_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/router/routes.dart';

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
    return OnboardingPathConfig(route: AppRoutes.phoneLogin);
  } else if (!isPhoneVerified) {
    return OnboardingPathConfig(route: AppRoutes.verifySignUpOTP);
  } else if (!termsAccepted) {
    return OnboardingPathConfig(route: AppRoutes.termsAndConditions);
  } else if (!hasSetSecurityQuestions) {
    return OnboardingPathConfig(route: AppRoutes.securityQuestionsPage);
  } else if (!isPINSet) {
    return OnboardingPathConfig(route: AppRoutes.createPin);
  } else if (!hasSetNickName) {
    return OnboardingPathConfig(route: AppRoutes.congratulationsPage);
  }

  return OnboardingPathConfig(route: AppRoutes.home);
}

Future<void> setUserNickname({
  required BuildContext context,
  required String nickName,
}) async {
  // this is the Redux Action that store the nickname user enters
  StoreProvider.dispatch<AppState>(
    context,
    UpdateUserProfileAction(nickName: nickName),
  );

  // this is the Redux Action that handles set nickname for an existing user
  await StoreProvider.dispatch<AppState>(
    context,
    SetNicknameAction(
      context: context,
      flag: setNickNameFlag,
    ),
  );
}
