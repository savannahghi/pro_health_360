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
  static const String verifySignUpOTP = '/verifySignUpOTP';
  static const String forgotPinOtpWidget = '/forgotPinOtpWidget';

  static const String setPin = '/setPin';
  static const String resetPin = '/resetPin';

  static const String createPin = '/createPin';
  static const String confirmCreatePin = '/confirmCreatePin';

  static const String resumeWithPin = '/resumeWithPin';

  // onboarding routes
  static const String createAccount = '/createAccount';
  static const String setupUserAsTester = '/setupUserAsTester';

  static const String enterEmail = '/enterEmail';
  static const String emailVerification = '/emailVerification';

  // homepage
  static const String home = 'home';

  // user profile routes
  static const String userProfile = '/userProfile';
  static const String contactInfo = '/contactInfo';

  // benefit details and utilization routes

  static const String Invoices = '/Invoices';
  static const String singleSpentAmountInvoice = '/singleSpentAmountInvoice';
  static const String preAuthorizations = '/preAuthorizations';
  static const String authorizations = '/authorizations';
  static const String balanceReservations = '/balanceReservations';

  // consult and teleconsult routes
  static const String providerPanel = '/providerPanel';

  // verify edi contacts routes
  static const String addMemberDetailsEdi = '/addMemberDetailsEdi';

  // homepage money items landing page routes
  static const String seeDoctor = '/seeDoctor';
  static const String buyMedicine = '/buyMedicine';
  static const String getTested = '/getTested';

  // library
  static const String library = '/library';
  static const String libraryContent = '/libraryContent';

  // profile page action items routes
  static const String editProfileSettingsPage = '/editProfileSettingsPage';

  // support center
  static const String helpCenter = '/helpCenter';

  // search center
  static const String searchPage = '/searchPage';

  // loans placeholder
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
}

List<String> unProtectedRoutes = <String>[
  BWRoutes.landing,
  BWRoutes.phoneLogin,
  BWRoutes.createAccount,
  BWRoutes.resetPin,
];
