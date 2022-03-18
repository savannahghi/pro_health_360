// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/login/create_pin.dart';
import 'package:myafyahub/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';
import '../../mocks.dart';

void main() {
  group('OnboardingState', () {
    test('fromJson works correctly', () {
      final OnboardingState fromJson =
          OnboardingState.fromJson(mockOnboardingState);

      final OnboardingState actual = OnboardingState(
        createPINState: CreatePINState.initial(),
        termsAndConditions: TermsAndConditions.initial(),
        securityQuestions: <SecurityQuestion>[SecurityQuestion.initial()],
        securityQuestionResponses: <SecurityQuestionResponse>[
          SecurityQuestionResponse.initial(),
        ],
      );

      expect(fromJson, actual);
    });
  });
}
