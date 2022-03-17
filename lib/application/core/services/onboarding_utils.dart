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

void clearAllFlags(BuildContext context) {
  SchedulerBinding.instance?.addPostFrameCallback((_) {
    StoreProvider.dispatch(
      context,
      WaitAction<AppState>.clear(),
    );
  });
}

/// Determines the path to route the user to based on the app state
OnboardingPathConfig onboardingPath({
  required AppState? appState,
  bool calledOnResume = false,
}) {
  final bool pinChangeRequired =
      appState?.clientState?.user?.pinChangeRequired ?? false;

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

  if (pinChangeRequired) {
    return OnboardingPathConfig(route: AppRoutes.pinExpiredPage);
  }

  if (!isSignedIn) {
    return OnboardingPathConfig(route: AppRoutes.phoneLogin);
  } else if (!isPhoneVerified) {
    return OnboardingPathConfig(route: AppRoutes.verifyPhone);
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
