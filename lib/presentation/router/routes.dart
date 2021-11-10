/// These are the all routes that the app uses.
/// For better code and readability, the arrangement in this
/// file **MUST** follow the same, and must be replicated in
/// the router generator file
class BWRoutes {
  // onboarding routes
  static const String phoneLogin = '/phoneLogin';
  static const String verifyPhoneNo = '/verifyPhoneNo';
  static const String verifyCode = '/verifyCode';
  static const String termsAndConditions = '/termsAndConditions';
  static const String verifySignUpOTP = '/verifySignUpOTP';
  static const String forgotPinOtpWidget = '/forgotPinOtpWidget';
  static const String securityQuestionsPage = '/securityQuestionsPage';
  static const String congratulationsPage = '/congratulationsPage';

  static const String setPin = '/setPin';
  static const String resetPin = '/resetPin';

  static const String createPin = '/createPin';
  static const String confirmCreatePin = '/confirmCreatePin';

  static const String resumeWithPin = '/resumeWithPin';

  // onboarding routes
  static const String setupUserAsTester = '/setupUserAsTester';

  static const String enterEmail = '/enterEmail';
  static const String emailVerification = '/emailVerification';

  // homepage
  static const String home = 'home';

  static const String moodFeedbackPage = '/moodFeedbackPage';

  // user profile routes
  static const String editProfileSettingsPage = '/editProfileSettingsPage';
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

  // library
  static const String library = '/library';
  static const String libraryContent = '/libraryContent';

  static const String webView = '/webView';

  static const String introduction = 'introduction';

  // community
  static const String communityListView = '/communityListView';

  // community chat screen
  static const String communityChatScreenPage = '/CommunityChatScreenPage';

  // Answer Security Question
  static const String answerSecurityQuestionPage =
      '/answerSecurityQuestionPage';

  // Feed
  static const String feedPage = '/feedPage';

  // Health Diary Page
  static const String myHealthDiaryPage = '/healthDiaryPage';

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
  static const String articleDetailsPage = '/articleDetailsPage';

  //Forgot PIN Page
  static const String forgotPINPage = '/forgotPINPage';
}

List<String> unProtectedRoutes = <String>[
  BWRoutes.phoneLogin,
  BWRoutes.resetPin,
];
