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
mutation acceptTerms($userID: String!, $termsID: String!){
  acceptTerms(userID: $userID, termsID: $termsID)
}
 ''';

Map<String, dynamic> getTermsVariables({
  required String userId,
  required String termsId,
}) {
  return <String, dynamic>{
    'userID': userId,
    'termsID': termsId,
  };
}
