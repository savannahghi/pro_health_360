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

const String createHealthDiaryEntryMutation = r'''
mutation createHealthDiaryEntry($clientID: String!, $note: String,$mood:String!, $reportToStaff: Boolean!){
  createHealthDiaryEntry(clientID: $clientID, note: $note,mood: $mood,reportToStaff: $reportToStaff)  
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

const String updateClientCaregiverMutation = r'''
mutation createOrUpdateClientCaregiver($caregiverInput: CaregiverInput){
  createOrUpdateClientCaregiver(caregiverInput: $caregiverInput)
}
''';

const String sendFeedbackMutation = r'''
mutation sendFeedback($input: FeedbackResponseInput!) {
  sendFeedback(input: $input)
}
''';

const String rejectInvitationMutation = r'''
mutation rejectInvitation($memberID: String!, $communityID: String!){
  rejectInvitation(memberID: $memberID, communityID: $communityID)
}
''';

const String acceptInvitationMutation = r'''
mutation acceptInvitation($memberID: String!, $communityID: String!){
  acceptInvitation(memberID: $memberID, communityID: $communityID)
}
''';

const String addMembersToCommunityMutation = r'''
mutation addMembersToCommunity($memberIDs: [String!]!, $communityID: String!){
  addMembersToCommunity(
    memberIDs: $memberIDs, communityID: $communityID)
}
''';

const String optOutMutation = r'''
mutation optOut($phoneNumber: String!, $flavour: Flavour!) {
  optOut(phoneNumber: $phoneNumber, flavour: $flavour)
}
''';

const String answerScreeningToolQuestionMutation = r'''
mutation answerScreeningToolQuestion($screeningToolResponses: [ScreeningToolQuestionResponseInput!]!){
  answerScreeningToolQuestion(screeningToolResponses: $screeningToolResponses)
}
''';

const String rescheduleAppointmentMutation = r'''
mutation rescheduleAppointment($appointmentID: String!, $date: Date!) {
  rescheduleAppointment(
    appointmentID: $appointmentID,
    date: $date,
  )
}
''';

const String shareHealthDiaryEntryMutation = r'''
mutation shareHealthDiaryEntry($healthDiaryEntryID: String!, $shareHealthDiaryEntry: Boolean!){
  shareHealthDiaryEntry(healthDiaryEntryID: $healthDiaryEntryID, shareEntireHealthDiary: $shareHealthDiaryEntry)
}
''';

const String setPushTokenMutation = r'''
mutation setPushToken($token: String!){
  setPushToken(token: $token)
}
''';

const String removeFromGroupMutation = r'''
mutation removeMembersFromCommunity($communityID: String!, $memberIDs: [String!]!){
  removeMembersFromCommunity(communityID: $communityID, memberIDs: $memberIDs)
}
''';

const String promoteToModeratorMutation = r'''
mutation addModerators($memberIDs: [String!]!, $communityID: String!){
  addModerators(memberIDs: $memberIDs, communityID: $communityID)
}
''';

const String banUserMutation = r'''
mutation BanUser($memberID: String!, $bannedBy: String!, $communityID: String!){
  banUser(MemberID: $memberID, bannedBy: $bannedBy, communityID: $communityID)
}
''';

const String unBanUserMutation = r'''
mutation UnBanUser($memberID: String!, $communityID: String!){
  unBanUser(memberID: $memberID, communityID: $communityID)
}
''';
const String readNotificationsMutation = r'''
mutation readNotifications($ids: [ID!]!){
  readNotifications(ids: $ids)
}
''';

const String contentViewDurationMutation = r'''
mutation collectMetric($input:MetricInput!) {
  collectMetric(input:$input)
}
''';
