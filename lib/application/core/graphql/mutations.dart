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
