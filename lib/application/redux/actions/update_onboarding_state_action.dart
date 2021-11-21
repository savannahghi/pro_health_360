// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';

// TODO(abiud): rewrite this action to cater for the new fields
class UpdateOnboardingStateAction extends ReduxAction<AppState> {
  UpdateOnboardingStateAction({
    this.securityQuestionsResponses,
    this.isPhoneVerified,
    this.isPINSet,
  });

  List<SecurityQuestionResponse>? securityQuestionsResponses;
  bool? isPhoneVerified;
  bool? isPINSet;

  @override
  AppState reduce() {
    final bool? oldPhoneVerified = state.onboardingState?.isPhoneVerified;
    final OnboardingState? newOnboardingState = state.onboardingState?.copyWith(
      securityQuestionResponses: securityQuestionsResponses,
      isPhoneVerified: isPhoneVerified ?? oldPhoneVerified,
      isPINSet: isPINSet ?? state.onboardingState?.isPINSet,
    );

    final AppState newState =
        state.copyWith(onboardingState: newOnboardingState);

    return newState;
  }
}
