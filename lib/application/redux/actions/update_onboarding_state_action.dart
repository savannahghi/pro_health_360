// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';

// TODO(abiud): rewrite this action to cater for the new fields
class UpdateOnboardingStateAction extends ReduxAction<MainAppState> {
  UpdateOnboardingStateAction({
    this.securityQuestionsResponses,
  });

  List<SecurityQuestionResponse>? securityQuestionsResponses;

  @override
  MainAppState reduce() {
    final OnboardingState? newOnboardingState = state.onboardingState?.copyWith
        .call(securityQuestionResponses: securityQuestionsResponses);

    final MainAppState newState =
        state.copyWith(onboardingState: newOnboardingState);

    return newState;
  }
}
