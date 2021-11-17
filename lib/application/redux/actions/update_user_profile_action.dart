// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question.dart';
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';

/// - [userProfile]
/// - [profileSetupComplete]
/// - [unmaskedPhoneNumbers]
/// - [maskedPhoneNumber]
// TODO(abiud): rewrite this action to cater for the new fields
class UpdateUserProfileAction extends ReduxAction<AppState> {
  UpdateUserProfileAction({
    this.profile,
    this.communicationSettings,
    this.userBioData,
    //customer profile for transactions
    this.customerProfile,
    // other internal states
    this.onboardingTourComplete,
    this.profileSetupComplete,
    this.unmaskedPhoneNumbers,
    this.maskedPhoneNumbers,
    this.isFirstLaunch,
    this.securityQuestions,
    this.securityQuestionsResponses,
  });

  final UserProfile? profile;
  final CommunicationSettings? communicationSettings;
  final BioData? userBioData;
  final Customer? customerProfile;
  final bool? onboardingTourComplete;
  final bool? profileSetupComplete;
  final List<PhoneNumber>? maskedPhoneNumbers;
  final List<PhoneNumber>? unmaskedPhoneNumbers;
  final bool? isFirstLaunch;
  final List<SecurityQuestion>? securityQuestions;
  final Map<String, SecurityQuestionResponse>? securityQuestionsResponses;

  @override
  AppState reduce() {
    final UserProfile userProfile = state.userProfileState!.userProfile!;

    final BioData? bio = state.userProfileState!.userProfile!.userBioData;

    final CommunicationSettings settings =
        state.userProfileState!.communicationSettings!;

    final List<SecurityQuestion>? securityQuestions =
        state.userProfileState?.securityQuestions;

    final Map<String, SecurityQuestionResponse>? questionsResponses =
        state.userProfileState?.securityQuestionsResponses;

    final AppState newState = state.copyWith.userProfileState!.call(
      userProfile: UserProfile(
        id: this.profile?.id ?? userProfile.id,
        username: this.profile?.username ?? userProfile.username,
        primaryPhoneNumber:
            this.profile?.primaryPhoneNumber ?? userProfile.primaryPhoneNumber,
        primaryEmailAddress: this.profile?.primaryEmailAddress ??
            userProfile.primaryEmailAddress,

        /// [secondaryPhoneNumbers] and [secondaryEmailAddresses] are overwrite to avoid complex checking of occurrences
        secondaryPhoneNumbers: this.profile?.secondaryPhoneNumbers ??
            userProfile.secondaryPhoneNumbers,
        secondaryEmailAddresses: this.profile?.secondaryEmailAddresses ??
            userProfile.secondaryEmailAddresses,

        termsAccepted: this.profile?.termsAccepted ?? userProfile.termsAccepted,
        suspended: this.profile?.suspended ?? userProfile.suspended,
        photoUploadID: this.profile?.photoUploadID ?? userProfile.photoUploadID,

        userBioData: BioData(
          firstName: this.userBioData?.firstName ?? bio?.firstName,
          lastName: this.userBioData?.lastName ?? bio?.lastName,
          dateOfBirth: this.userBioData?.dateOfBirth ?? bio?.dateOfBirth,
          gender: this.userBioData?.gender ?? bio?.gender,
        ),
      ),
      communicationSettings: CommunicationSettings(
        allowEmail:
            this.communicationSettings?.allowEmail ?? settings.allowEmail,
        allowPush: this.communicationSettings?.allowPush ?? settings.allowPush,
        allowText: this.communicationSettings?.allowText ?? settings.allowText,
        allowWhatsApp:
            this.communicationSettings?.allowWhatsApp ?? settings.allowWhatsApp,
      ),
      // required for transactions
      customerProfile:
          this.customerProfile ?? state.userProfileState!.customerProfile,
      // overwrite
      onboardingTourComplete: this.onboardingTourComplete ??
          state.userProfileState!.onboardingTourComplete,
      profileSetupComplete: this.profileSetupComplete ??
          state.userProfileState!.onboardingTourComplete,
      maskedPhoneNumbers:
          this.maskedPhoneNumbers ?? state.userProfileState!.maskedPhoneNumbers,
      unmaskedPhoneNumbers: this.unmaskedPhoneNumbers ??
          state.userProfileState!.unmaskedPhoneNumbers,
      isFirstLaunch: this.isFirstLaunch,
      securityQuestions: this.securityQuestions ?? securityQuestions,
      securityQuestionsResponses:
          this.securityQuestionsResponses ?? questionsResponses,
    );

    return newState;
  }
}
