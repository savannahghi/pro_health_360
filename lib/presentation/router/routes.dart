/// These are the all routes that the app uses.
/// For better code and readability, the arrangement in this
/// file **MUST** follow the same, and must be replicated in
/// the router generator file
class AppRoutes {
  static const String deepLink = '/app';
  // onboarding routes
  static const String phoneLogin = '/phoneLogin';
  static const String verifyCode = '/verifyCode';
  static const String termsAndConditions = '/termsAndConditions';
  static const String verifySignUpOTP = '/verifySignUpOTP';
  static const String securityQuestionsPage = '/securityQuestionsPage';
  static const String congratulationsPage = '/congratulationsPage';

  static const String createPin = '/createPin';
  static const String confirmCreatePin = '/confirmCreatePin';

  // onboarding routes
  static const String setupUserAsTester = '/setupUserAsTester';

  static const String enterEmail = '/enterEmail';
  static const String emailVerification = '/emailVerification';

  // homepage
  static const String home = '/home';

  static const String moodFeedbackPage = '/moodFeedbackPage';

  // user profile routes
  static const String userProfile = '/userProfile';
  static const String consent = '/consent';
  static const String personalInfo = '/personalInfo';
  static const String medicalData = '/medicalData';
  static const String savedPosts = '/savedPosts';

  // Notifications page
  static const String notificationsPage = '/notificationsPage';

  // My Health Page
  static const String myHealthPage = '/myHealthPage';

  // Appointments page
  static const String appointmentsPage = '/appointmentsPage';

  // community
  static const String communityListPage = '/communityListView';

  // community chat screen
  static const String communityChatScreenPage = '/CommunityChatScreenPage';

  // Answer Security Question
  static const String answerSecurityQuestionPage =
      '/answerSecurityQuestionPage';

  // Feed
  static const String feedPage = '/feedPage';

  // Health Diary Page
  static const String myHealthDiaryPage = '/healthDiaryPage';
  static const String successfulEntryPage = '/successfulEntryPage';

  // User Profile Page
  static const String userProfilePage = '/userProfilePage';

  // Profile Faqs Page
  static const String profileFaqsPage = '/profileFaqsPage';

  // Profile Faqs Page
  static const String faqDetailViewPage = '/faqDetailViewPage';

  //Clinic Information Page
  static const String clinicInformationPage = '/clinicInformationPage';

  //Settings Page
  static const String settingsPage = '/settingsPage';

  //Feedback Page
  static const String feedbackPage = '/feedbackPage';

  //Pin Input Page
  static const String pinInputPage = '/pinInputPage';

  //Article Details Page
  static const String contentDetailPage = '/contentDetailPage';

  //Forgot PIN Page
  static const String forgotPINPage = '/forgotPINPage';

  //Edit Information Page
  static const String editInformationPage = '/editInformationPage';

  static const String galleryImagesPage = '/galleryImagesPage';

  //Documents Page
  static const String viewDocumentPage = '/viewDocumentPage';

  // violence assessment
  static const String violenceAssessmentPage = '/violenceAssessmentPage';

  //Contraceptive assessment Page
  static const String contraceptiveAssessmentPage =
      '/contraceptiveAssessmentPage';

  //Tuberculosis assessment Page
  static const String tuberculosisAssessmentPage =
      '/tuberculosisAssessmentPage';

  //Alcohol and substance use page
  static const String alcoholSubstanceUsePage = '/alcoholSubstanceUsePage';

  // successful assessment submission
  static const String successfulAssessmentSubmissionPage =
      '/successfulAssessmentSubmissionPage';

  // successful feedback submission
  static const String successfulFeedbackSubmissionPage =
      '/successfulFeedbackSubmissionPage';

  // communities group invites
  static const String groupInvitesPage = '/groupInvitesPage';
  static const String acceptGroupInvitesPage = '/acceptGroupInvitesPage';

  // resume with pin
  static const String resumeWithPin = '/resumeWithPin';

  // consent confirmation page
  static const String consentConfirmationPage = '/consentConfirmationPage';

  //pin requests
  static const String pinRequestSentPage = '/pinRequestSentPage';
  static const String pendingPINRequestPage = '/pendingPINRequestPage';
  static const String verifySecurityQuestionsHelpPage =
      '/verifySecurityQuestionsHelpPage';

  static const String pinExpiredPage = '/pinExpiredPage';
  static const String loginCounterPage = '/loginCounterPage';

  static const String myHealthTimeline = '/myHealthTimeline';
}

List<String> unProtectedRoutes = <String>[AppRoutes.phoneLogin];
