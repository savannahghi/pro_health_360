import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/login/create_pin.dart';
import 'package:myafyahub/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';

part 'onboarding_state.freezed.dart';
part 'onboarding_state.g.dart';

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState({
    CreatePINState? createPINState,
    TermsAndConditions? termsAndConditions,
  }) = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  factory OnboardingState.initial() => OnboardingState(
        ///   - Login state
        ///   - Terms and conditions
        termsAndConditions: TermsAndConditions.initial(),
        createPINState: CreatePINState.initial(),

        ///   - security questions
        ///   - nickname
      );
}
