const String completeSignUpMutation = r'''
mutation completeSignup($flavour: Flavour!){
  completeSignup(flavour: $flavour)
}
''';

const String updateUserProfileMutation = r'''
mutation updateUserProfile($input: UserProfileInput!) {
  updateUserProfile(input: $input) {
    userBioData {
      firstName
      lastName
      gender
      dateOfBirth
    }
  }
}
''';

const String registerDeviceTokenQuery = r'''
mutation RegisterPushToken($token: String!) {
  registerPushToken(token: $token)
}
''';

const String updateUserPinMutation = r'''
mutation UpdateUserPin($phone: String!, $pin: String!) {
  updateUserPIN(phone: $phone, pin: $pin)
}
 ''';

const String acceptTermsAndConditionsMutation = r'''
mutation acceptTerms($userID: String!, $termsID: Int!){
  acceptTerms(userID: $userID, termsID: $termsID)
}
 ''';

Map<String, dynamic> getTermsVariables({
  required String userId,
  required int termsId,
}) {
  return <String, dynamic>{
    'userID': userId,
    'termsID': termsId,
  };
}

const String setUserPINMutation = r'''
mutation setUserPin($input: PINInput!){
  setUserPIN(input: $input)
}
 ''';

Map<String, dynamic> setUserPINMutationVariables(
  Map<String, dynamic> setUserPINVariables,
) {
  return <String, dynamic>{'input': setUserPINVariables};
}

const String setNickNameMutation = r'''
mutation setNickName($userID: String!, $nickname: String!) {
  setNickName(userID: $userID, nickname: $nickname)
}
 ''';

const String completeOnboardingTourMutation = r'''
mutation completeOnboardingTour($userID: String!, $flavour: Flavour!){
  completeOnboardingTour(userID: $userID, flavour: $flavour)
}
 ''';

const String recordSecurityQuestionResponsesMutation = r'''
mutation recordSecurityQuestionResponses($input: [SecurityQuestionResponseInput!]!){
  recordSecurityQuestionResponses(input: $input){
    securityQuestionID,
    isCorrect
  }
}
 ''';

const String unlikeContentMutation = r'''
 mutation unlikeContent($userID: String!, $contentID: Int!){
  unlikeContent(userID: $userID, contentID: $contentID)
}
''';

const String likeContentMutation = r'''
 mutation likeContent($userID: String!, $contentID: Int!){
  likeContent(userID: $userID, contentID: $contentID)
}
''';

const String shareContentMutation = r'''
mutation shareContent($input: ShareContentInput!) {
  shareContent(input: $input)
}
''';

Map<String, dynamic> shareContentMutationVariables(
  Map<String, dynamic> shareContentVariables,
) {
  return <String, dynamic>{'input': shareContentVariables};
}


const String bookmarkContentMutation = r'''
mutation bookmarkContent($userID: String!, $contentItemID: Int!){
  bookmarkContent(userID: $userID, contentItemID: $contentItemID)
}
''';

const String unbookmarkContentMutation = r'''
mutation unbookmarkContent($userID: String!, $contentItemID: Int!){
  UnBookmarkContent(userID: $userID, contentItemID: $contentItemID)
}
''';
