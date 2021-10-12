/// These are the all routes that the app uses.
/// For better code and readability, the arrangement in this
/// file **MUST** follow the same, and must be replicated in
/// the router generator file
class BWRoutes {
  // onboarding routes
  static const String landing = 'landing';
  static const String phoneLogin = '/phoneLogin';
  static const String basicDetails = '/basicDetails';
  static const String verifyPhoneNo = '/verifyPhoneNo';
  static const String verifyCode = '/verifyCode';
  static const String termsAndConditions = '/termsAndConditions';
  static const String verifySignUpOTP = '/verifySignUpOTP';
  static const String forgotPinOtpWidget = '/forgotPinOtpWidget';

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

  // user profile routes
  static const String editProfileSettingsPage = '/editProfileSettingsPage';
  static const String userProfile = '/userProfile';
  static const String contactInfo = '/contactInfo';
  static const String consent = '/consent';
  static const String personalInfo = '/personalInfo';
  static const String medicalData = '/medicalData';
  static const String savedPosts = '/savedPosts';

  // benefit details and utilization routes

  static const String Invoices = '/Invoices';
  static const String singleSpentAmountInvoice = '/singleSpentAmountInvoice';
  static const String preAuthorizations = '/preAuthorizations';
  static const String authorizations = '/authorizations';
  static const String balanceReservations = '/balanceReservations';

  // consult and teleconsult routes
  static const String providerPanel = '/providerPanel';

  // notifications
  static const String notificationsPage = '/notificationsPage';

  //My Health Page
  static const String myHealthPage = '/myHealthPage';

  //Appointments page
  static const String appointmentsPage = '/appointmentsPage';

  // verify edi contacts routes
  static const String addMemberDetailsEdi = '/addMemberDetailsEdi';

  // homepage money items landing page routes
  static const String seeDoctor = '/seeDoctor';
  static const String buyMedicine = '/buyMedicine';
  static const String getTested = '/getTested';

  // library
  static const String library = '/library';
  static const String libraryContent = '/libraryContent';

  // search center
  static const String searchPage = '/searchPage';

  static const String webView = '/webView';

  static const String introduction = 'introduction';
  static const String selectAssistantPage = '/selectAssistantPage';
  static const String selectCoverageInfoPage = '/selectCoverageInfoPage';
  static const String confirmIdentificationDetailsPage =
      '/confirmIdentificationDetailsPage';
  static const String selectFullPaymentOrLoanPage =
      '/selectFullPaymentOrLoanPage';
  static const String selectTypeOfCoverPage = '/selectTypeOfCoverPage';
  static const String selectPremiumRangePage = '/selectPremiumRangePage';

  // community
  static const String communityListView = '/communityListView';

  // community chat screen
  static const String communityChatScreenPage = '/CommunityChatScreenPage';

  // Security questions
  static const String securityQuestionsPage = '/securityQuestionsPage';

  // Answer Security Question
  static const String answerSecurityQuestionPage =
      '/answerSecurityQuestionPage';

  // Feed
  static const String myAfyaHubFeedPage = '/feedPage';

  // Health Diary Page
  static const String myHealthDiaryPage = '/healthDiaryPage';

  // User Profile Page
  static const String userProfilePage = '/userProfilePage';

  // Profile Faqs Page
  static const String profileFaqsPage = '/profileFaqsPage';

  //Clinic Information Page
  static const String clinicInformationPage = '/clinicInformationPage';

  //Settings Page
  static const String settingsPage = '/settingsPage';
}

List<String> unProtectedRoutes = <String>[
  BWRoutes.landing,
  BWRoutes.phoneLogin,
  BWRoutes.resetPin,
];
