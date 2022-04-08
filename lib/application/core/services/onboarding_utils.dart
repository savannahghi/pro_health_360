// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myafyahub/application/core/services/utils.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/set_nickname_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_info.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
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

// NavigationPathConfig
OnboardingPathInfo onboardingPath({required AppState? appState}) {
  /// Check whether the current onboarding stage
  final CurrentOnboardingStage? currentOnboardingStage =
      appState!.onboardingState!.currentOnboardingStage;

  final bool isPhoneVerified =
      appState.onboardingState?.isPhoneVerified ?? false;
  final bool termsAccepted = appState.clientState?.user?.termsAccepted ?? false;
  final bool hasSetSecurityQuestions =
      appState.onboardingState?.hasSetSecurityQuestions ?? false;
  final bool hasVerifiedSecurityQuestions =
      appState.onboardingState?.hasVerifiedSecurityQuestions ?? false;
  final bool hasSetNickName = appState.onboardingState?.hasSetNickName ?? false;
  final bool hasSetPin = appState.onboardingState?.hasSetPin ?? false;
  final bool hasSetPIN = appState.onboardingState?.hasSetPin ?? false;

  /// The sign in onboarding state
  if (currentOnboardingStage == CurrentOnboardingStage.Login) {
    final bool isSignedIn = appState.credentials?.isSignedIn ?? false;

    if (!isSignedIn) {
      return OnboardingPathInfo(
        previousRoute: '',
        nextRoute: AppRoutes.phoneLogin,
      );
    }

    /// The sign up onboarding state
    if (!isPhoneVerified) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.phoneLogin,
        nextRoute: AppRoutes.verifySignUpOTP,
      );
    } else if (!termsAccepted) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.verifySignUpOTP,
        nextRoute: AppRoutes.termsAndConditions,
      );
    } else if (!hasSetSecurityQuestions) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.termsAndConditions,
        nextRoute: AppRoutes.securityQuestionsPage,
      );
    } else if (!hasSetPin) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.securityQuestionsPage,
        nextRoute: AppRoutes.createPin,
      );
    } else if (!hasSetNickName) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.createPin,
        nextRoute: AppRoutes.congratulationsPage,
      );
    }

    return OnboardingPathInfo(nextRoute: AppRoutes.home, previousRoute: '');

    /// The PIN expiry workflow
  } else if (currentOnboardingStage == CurrentOnboardingStage.PINExpired ||
      currentOnboardingStage == CurrentOnboardingStage.PINUpdate) {
    // check whether the phone is verified
    if (!isPhoneVerified) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.pinExpiredPage,
        nextRoute: AppRoutes.verifySignUpOTP,
      );
    }

    // check whether the PIN has been changed
    else if (!hasSetPIN) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.verifySignUpOTP,
        nextRoute: AppRoutes.createPin,
      );
    }

    if (currentOnboardingStage == CurrentOnboardingStage.PINUpdate &&
        !hasSetSecurityQuestions) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.termsAndConditions,
        nextRoute: AppRoutes.securityQuestionsPage,
      );
    }

    // Reset the state and navigate to the login page
    return OnboardingPathInfo(
      nextRoute: AppRoutes.phoneLogin,
      previousRoute: '',
    );

    // This means it is the [CurrentOnboardingStage.ResetPIN] that is in play
  } else {
    // verify the phone
    // check whether the phone is verified
    if (!isPhoneVerified) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.pinExpiredPage,
        nextRoute: AppRoutes.verifySignUpOTP,
      );
    }

    // (optional) set new security questions
    if (!hasVerifiedSecurityQuestions) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.termsAndConditions,
        nextRoute: AppRoutes.securityQuestionsPage,
      );
    }

    // change the PIN
    // check whether the PIN has been changed
    else if (!hasSetPIN) {
      return OnboardingPathInfo(
        previousRoute: AppRoutes.verifySignUpOTP,
        nextRoute: AppRoutes.createPin,
      );
    }

    // Navigate user to the login page is they have successfully changed their PIN
    return OnboardingPathInfo(
      nextRoute: AppRoutes.phoneLogin,
      previousRoute: '',
    );
  }
}

void setUserNickname({
  required BuildContext context,
}) {
  // this is the Redux Action that handles set nickname for an existing user
  StoreProvider.dispatch<AppState>(
    context,
    SetNicknameAction(
      client: AppWrapperBase.of(context)!.graphQLClient,
      onSuccess: () {
        showTextSnackbar(
          ScaffoldMessenger.of(context),
          content: nicknameSuccessString,
        );
      },
      onError: (String error) {
        showTextSnackbar(ScaffoldMessenger.of(context), content: error);
      },
      flag: setNickNameFlag,
    ),
  );
}
