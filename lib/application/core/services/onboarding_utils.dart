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
import 'package:myafyahub/domain/core/entities/core/nav_path_config.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
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
      flavour: flavour,
    ),
  );
}

// NavigationPathConfig
AppNavConfig navPathConfig({
  required AppState? appState,
  bool calledOnResume = false,
}) {
  /// Check whether the current onboarding stage
  final CurrentOnboardingStage? currentOnboardingStage =
      appState!.onboardingState!.currentOnboardingStage;

  final bool isPhoneVerified =
      appState.onboardingState?.isPhoneVerified ?? false;
  final bool termsAccepted = appState.clientState?.user?.termsAccepted ?? false;
  final bool hasSetSecurityQuestions =
      appState.onboardingState?.hasSetSecurityQuestions ?? false;
  final bool hasSetNickName = appState.onboardingState?.hasSetNickName ?? false;
  final bool isPINSet =
      appState.onboardingState?.setPINState?.isPINSet ?? false;

  /// The sign in onboarding state
  if (currentOnboardingStage == CurrentOnboardingStage.Login) {
    final bool isSignedIn = appState.credentials?.isSignedIn ?? false;

    if (!isSignedIn) {
      return AppNavConfig(previousRoute: '', nextRoute: AppRoutes.phoneLogin);
    } else if (calledOnResume) {
      return AppNavConfig(
        nextRoute: AppRoutes.resumeWithPin,
        previousRoute: AppRoutes.phoneLogin,
      );
    }

    return AppNavConfig(nextRoute: AppRoutes.home, previousRoute: '');

    /// The sign up onboarding state
  } else if (currentOnboardingStage == CurrentOnboardingStage.Signup) {
    if (!isPhoneVerified) {
      return AppNavConfig(
        previousRoute: AppRoutes.phoneLogin,
        nextRoute: AppRoutes.verifySignUpOTP,
      );
    } else if (!termsAccepted) {
      return AppNavConfig(
        previousRoute: AppRoutes.verifySignUpOTP,
        nextRoute: AppRoutes.termsAndConditions,
      );
    } else if (!hasSetSecurityQuestions) {
      return AppNavConfig(
        previousRoute: AppRoutes.termsAndConditions,
        nextRoute: AppRoutes.securityQuestionsPage,
      );
    } else if (!isPINSet) {
      return AppNavConfig(
        previousRoute: AppRoutes.securityQuestionsPage,
        nextRoute: AppRoutes.createPin,
      );
    } else if (!hasSetNickName) {
      return AppNavConfig(
        previousRoute: AppRoutes.createPin,
        nextRoute: AppRoutes.congratulationsPage,
      );
    }

    return AppNavConfig(nextRoute: AppRoutes.home, previousRoute: '');

    /// The PIN expiry workflow
  } else if (currentOnboardingStage == CurrentOnboardingStage.PINExpired) {
    final bool isPhoneVerified =
        appState.onboardingState?.pinExpiredState?.isPhoneVerified ?? false;
    final bool isPINChanged =
        appState.onboardingState?.pinExpiredState?.isPINChanged ?? false;

    // check whether the phone is verified
    if (!isPhoneVerified) {
      return AppNavConfig(
        previousRoute: AppRoutes.pinExpiredPage,
        nextRoute: AppRoutes.verifySignUpOTP,
      );
    }

    // check whether the PIN has been changed
    else if (!isPINChanged) {
      return AppNavConfig(
        previousRoute: AppRoutes.verifySignUpOTP,
        nextRoute: AppRoutes.createPin,
      );
    }

    // Reset the state and navigate to the home page
    return AppNavConfig(nextRoute: AppRoutes.home, previousRoute: '');
  } else if (currentOnboardingStage == CurrentOnboardingStage.ChangePIN) {
    // verify the phone

    // change the PIN

    // (optional) set new security questions

    // Always return the home page
    return AppNavConfig(nextRoute: AppRoutes.home, previousRoute: '');
  }

  // return the login page if anything else fails
  return AppNavConfig(nextRoute: AppRoutes.phoneLogin, previousRoute: '');
}

/// Determines the path to route the user to based on the app state
OnboardingPathConfig onboardingPath({required AppState? appState}) {
  final bool isSignedIn = appState?.credentials?.isSignedIn ?? false;
  final bool termsAccepted =
      appState?.clientState?.user?.termsAccepted ?? false;
  final bool isPhoneVerified =
      appState?.onboardingState?.isPhoneVerified ?? false;
  final bool hasSetSecurityQuestions =
      appState?.onboardingState?.hasSetSecurityQuestions ?? false;
  final bool hasSetNickName =
      appState?.onboardingState?.hasSetNickName ?? false;
  final bool isPINSet =
      appState?.onboardingState?.setPINState?.isPINSet ?? false;

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
