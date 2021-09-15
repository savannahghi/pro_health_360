import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';

part 'user_profile_state.freezed.dart';
part 'user_profile_state.g.dart';

@freezed
class UserProfileState with _$UserProfileState {
  factory UserProfileState({
    // sourced from the response for login
    UserProfile? userProfile,
    Customer? customerProfile,
    CommunicationSettings? communicationSettings,
    AuthCredentialResponse? auth,

    // generate from the app
    bool? onboardingTourComplete,
    bool? profileSetupComplete,
    List<PhoneNumber>? unmaskedPhoneNumbers,
    List<PhoneNumber>? maskedPhoneNumbers,
    bool? isSignedIn,
    String? inActivitySetInTime,
    String? signedInTime,
    bool? isFirstLaunch,
  }) = _UserProfileState;

  factory UserProfileState.fromJson(Map<String, dynamic> json) =>
      _$UserProfileStateFromJson(json);

  factory UserProfileState.initial() => UserProfileState(
        isSignedIn: false,
        inActivitySetInTime: UNKNOWN,
        signedInTime: UNKNOWN,
        userProfile: UserProfile(
          id: UNKNOWN,
          username: Name.withValue(UNKNOWN),
          primaryPhoneNumber: PhoneNumber.withValue(UNKNOWN),
          primaryEmailAddress: EmailAddress.withValue(UNKNOWNEMAIL),
          secondaryPhoneNumbers: <PhoneNumber>[],
          secondaryEmailAddresses: <EmailAddress>[],
          termsAccepted: false,
          suspended: false,
          photoUploadID: UNKNOWN,
          userBioData: BioData(
            firstName: Name.withValue(UNKNOWN),
            lastName: Name.withValue(UNKNOWN),
            dateOfBirth: UNKNOWN,
            gender: Gender.unknown,
          ),
        ),
        auth: AuthCredentialResponse(
          customToken: UNKNOWN,
          idToken: UNKNOWN,
          expiresIn: UNKNOWN,
          refreshToken: UNKNOWN,
          uid: UNKNOWN,
          isAdmin: false,
          isAnonymous: true,
          canExperiment: false,
        ),
        communicationSettings: CommunicationSettings(
          profileID: UNKNOWN,
          allowEmail: false,
          allowPush: false,
          allowText: false,
          allowWhatsApp: false,
        ),
        onboardingTourComplete: false,
        profileSetupComplete: false,
        isFirstLaunch: true,
      );
}
