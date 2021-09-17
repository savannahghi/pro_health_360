import 'package:myafyahub/presentation/profile/profile_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

const String requestTimeoutError =
    'We could not perform this process in time. Please try again';

const String buildVersion = 'Build Version';

class OnboardingStrings {
  OnboardingStrings(this.locale);

  final Locale locale;

  static OnboardingStrings? of(BuildContext context) {
    return Localizations.of<OnboardingStrings>(context, OnboardingStrings);
  }

  String landingPageSubtitleText() =>
      Intl.message('Access health care easily at the palm of your hand',
          name: 'landingPageSubtitleText',
          desc: 'the subtitle for the landing page');

  String loginText() => Intl.message(
        'Login',
        name: 'loginText',
        desc: 'Login text, used in buttons',
      );

  String loginTextV2() => Intl.message(
        'Sign in here',
        name: 'signText',
        desc: 'SignIn text, used in links',
      );

  String phoneRequiredText() => Intl.message(
        'A valid phone number is required',
        name: 'phoneNo',
        desc: 'PhoneNumber text, used in errors',
      );

  String enterFirstNameText() => Intl.message(
        'Enter first name',
        name: 'enterFirstNameText',
        desc: 'enter persons first name',
      );

  String firstNameText() => Intl.message(
        'First name',
        name: 'firstNameText',
        desc: 'persons first name',
      );

  String firstNameRequiredText() => Intl.message(
        'First name is required',
        name: 'firstNameRequiredText',
        desc: 'user should enter persons first name to proceed',
      );

  String enterLastNameText() => Intl.message(
        'Enter last name',
        name: 'enterLastNameText',
        desc: 'persons last name',
      );

  String lastNameText() => Intl.message(
        'Last name',
        name: 'lastNameText',
        desc: 'persons last name',
      );

  String lastNameRequiredText() => Intl.message(
        ' Last name is required',
        name: 'lastNameRequiredText',
        desc: 'user to enter a persons last name to proceed',
      );

  String selectGenderText() => Intl.message(
        'Select gender',
        name: 'selectGenderText',
        desc: 'persons gender',
      );

  String dateOfBirthText() => Intl.message(
        'Date of birth',
        name: 'dateOfBirthText',
        desc: 'calendar date',
      );

  String dateOfBirthRequiredText() => Intl.message(
        'Date of birth is required',
        name: 'dateOfBirthRequiredText',
        desc: 'persons date of birth is required',
      );

  String saveContinueText() => Intl.message(
        'Save & Continue',
        name: 'saveContinueText',
        desc: 'Save the to the phone and proceed to next screen',
      );

  String previousText() => Intl.message(
        'Previous',
        name: 'previousText',
        desc:
            'Text used in buttons to show an action takes user to a previous screen',
      );

  String requestPinResetText() => Intl.message(
        'Request PIN reset',
        name: 'requestPinResetText',
        desc: 'Tell user to input their PIN',
      );

  String usePhoneToRequestText() => Intl.message(
        'Use your phone number to request',
        name: 'usePhoneToRequestText',
        desc: 'user to input their phone number to receive a text through it',
      );

  String greetUser(String name) => Intl.message(
        'Hey, $name',
        args: <String>[name],
        name: 'greetUser',
        desc: 'greet user with their name',
      );
  String enterPinToContinueText() => Intl.message(
        'Enter your PIN to continue',
        name: 'enterPinToContinueText',
        desc: 'user to enter their PIN to proceed',
      );

  String enterPinText() => Intl.message(
        'Enter your PIN',
        name: 'enterPinText',
        desc: 'user to enter their PIN',
      );
  String confirmPinText() => Intl.message(
        'Confirm your PIN',
        name: 'confirmPinText',
        desc: 'user to enter their PIN again',
      );

  String continueText() => Intl.message(
        'Continue',
        name: 'continueText',
        desc:
            'used in button text for actions that take user to another screen',
      );

  String backText() => Intl.message(
        'Back',
        name: 'backText',
        desc:
            'used in buttons for an action that takes user to previous screen',
      );

  String createPinText() => Intl.message(
        'Create PIN',
        name: 'createPinText',
        desc: 'create PIN',
      );

  String secureAccountText() => Intl.message(
        'Secure your account with a PIN',
        name: 'secureAccountText',
        desc: 'user to secure their account',
      );

  String changePinText() => Intl.message(
        'Change your PIN',
        name: 'changePinText',
        desc: 'change your PIN',
      );

  String changePinToSecureAccountText() => Intl.message(
        'Secure your account with a new PIN',
        name: 'changePinToSecureAccountText',
        desc: 'user to secure their account with a new pin',
      );

  String phoneNumberText() => Intl.message(
        'Phone number',
        name: 'phoneNumberText',
        desc: 'phone number',
      );

  String forgotPINText() => Intl.message(
        'Forgot PIN?',
        name: 'forgotPINText',
        desc: 'ask user if they can remember their PIN',
      );

  String signInText() => Intl.message(
        'Sign in',
        name: 'signInText',
        desc: 'Sign in to the app',
      );

  String wrongPinEntered() => Intl.message(
        'Sorry, you entered the wrong PIN. Please try again',
        name: 'wrongPinEntered',
        desc: 'user entered wrong PIN',
      );

  String noAccountWithPhoneNumber() => Intl.message(
        'No account with that phone number',
        name: 'noAccountWithPhoneNumber',
        desc:
            'user provided a phone number that is not registered on any account',
      );

  String requestText() => Intl.message(
        'Request',
        name: 'requestText',
        desc: 'an action to request, used in buttons',
      );

  String haveAnAccountText() => Intl.message(
        'Already have an account?  ',
        name: 'haveAnAccountText',
        desc: 'ask user if they have an existing account',
      );

  String verifyPhoneNumberText() => Intl.message(
        'Verify Phone Number',
        name: 'verifyPhoneNumberText',
        desc: 'user to verify their phone number',
      );

  String codeSentText() => Intl.message(
        'A 6 digit code has been sent to',
        name: 'codeSentText',
        desc: 'an OTP code sent to a phone number',
      );

  String phoneNumberExistsText() => Intl.message(
        'Sorry, a user with that phone number exists, please sign in to continue',
        name: 'phoneNumberExistsText',
        desc: 'phone number already registered an account',
      );

  static const String nullIDString = 'null_uid';
  static const String anonymousIsNullString = 'null_isAnonymous';
  static const String nullAnonymousExceptionMessage =
      'An error occurred while fetching a anonymous login response from the backend';
  static const String nullIDExceptionMessage =
      'An error occurred while fetching a anonymous login response from the backend';
  static const String changePINActionError = 'change_pin_action';
  static const String changePINActionException =
      'There was an error encountered while handling change PIN request, kindly try again';
  static const String pinMismatchError = 'change_pin_exception';
  static const String pinMismatchException =
      'The entered PIN did not match, kindly try again to proceed.';
  static const String agreementTextOne = 'By using My Afya Hub you agree to';
  static const String agreementTextTwo = 'our Terms and Conditions';
  static const String anonymousProvider = 'anonymous';
  static const String codeSent = 'A six digit code has been sent to';
  static const String codeSentEmail =
      'A six digit code has been sent to your email';
  static const String changePINMsg =
      'Your PIN was successfully updated. You will now be required to login with your new PIN';

  static const String enterPINText = 'Enter your PIN to continue';
  static const String errorSendingOTP = 'Sorry, we could not send one time PIN';
  static const String fourDigitPin = 'Please enter a 4 digit PIN';

  static const String landingPageTitle = 'Access Healthcare';
  static const String loginRequired = 'Please login to continue';
  static const String logoutButtonText = 'Logout';
  static const String backButtonText = 'Back';
  static const String matchingPins = 'Please enter matching PINs';
  static const String phoneNumberLabel = 'Phone number';
  static const String phoneNumberSignInSubtitle =
      'Use your phone number and PIN';

  static const String resetPINText = 'Forgot PIN?';
  static const String resumeWithPIN = 'our Terms and Conditions';
  static const String termsAndConditions = 'Terms and Conditions';

  static String createPin = 'Create PIN';
  static String createNewPin = 'Create new PIN';
  static String reenterPin = 'Re-enter PIN to verify';
  static String secureAccount = 'Secure your account with a PIN';
  static String confirmPin = 'Enter the same PIN from previous step';
  static String pinSuccess = 'Your PIN was set successfully';
  static String pinUpdateSuccess = 'Your PIN was updated successfully';
}

const String unMatchingPinErrorText =
    'The PIN entered does not match. Please try again';

// onboarding
const String nullIDString = 'null_uid';
const String anonymousIsNullString = 'null_isAnonymous';
const String nullAnonymousExceptionMessage =
    'An error occurred while fetching an anonymous login response from the backend';
const String nullIDExceptionMessage =
    'An error occurred while fetching an anonymous login response from the backend';
const String changePINActionError = 'change_pin_action';
const String changePINActionException =
    'There was an error encountered while handling change PIN request, kindly try again';
const String pinMismatchError = 'change_pin_exception';
const String pinMismatchException =
    'You entered an incorrect PIN, please try again';
const String agreementTextOne = 'By using My Afya Hub you agree to';
const String agreementTextTwo = 'our Terms and Conditions';
const String anonymousProvider = 'anonymous';
const String codeSentEmail = 'A 6 digit code has been sent to your email';
const String enterPINText = 'Enter your PIN to continue';
const String errorSendingOTP = 'Sorry, we could not send one time PIN';
const String fourDigitPin = 'Please enter a 4 digit PIN';
const String landingPageTitle = 'Welcome to My Afya Hub';
const String loginRequired = 'Please login to continue';
const String logoutButtonText = 'Logout';
const String matchingPins = 'Please enter matching PINs';
const String phoneNumberSignInSubtitle = 'Use your phone number and PIN';
const String requestPinResetSubtitle = 'Use your phone number to request';
const String requestPinResetTitle = 'Request PIN reset';
const String resumeWithPIN = 'our Terms and Conditions';
const String termsAndConditions = 'Terms and Conditions';
const String createNewPin = 'Create new PIN';
const String reenterPin = 'Re-enter PIN to verify';
const String confirmPin = 'Enter the same PIN from previous step';
const String pinSuccess = 'Your PIN was set successfully';
const String pinUpdateSuccess = 'Your PIN was updated successfully';

const String coachComingSoonText = 'Coaching';
const String coachCopy = 'Eat right, stay fit, live healthy';
const String coachTitle = 'Get coaching';
const String welcomeToBeWellString = 'Welcome to My Afya Hub';

//phoneNumber usage

const String infoTitle = 'How we use your contact information';
const String infoVerificationTitle = 'Verification codes';
const String infoVerificationBody =
    'We will send you verification codes via email, SMS or WhatsApp';
const String infoRecoveryTitle = 'Recovery';
const String infoRecoveryBody =
    'We will use your contact information to help you recover your PIN';
const String infoCommunicationTitle = 'Communication';
const String infoCommunicationBody =
    'We will communicate to you about offers and discounts';
const String infoContinueText = 'Continue';
const String infoDoneText = 'Done';
const String checkBoxActionText = ' How we use your contact info';

// library
const String emptyLibraryCopy =
    'Your library is empty. We will notify you once we have more items.';
const String libraryNoDataCopy =
    'Something went wrong while loading your library, check later or get help from our help center.';
const String libraryTitle = 'Library';
const String libraryContentTitle = 'LIBRARY CONTENT';
const String featuredStory = 'Featured Story';

// cart
const String title = 'your cart';
const String cartCopy = 'Items you have chosen to buy will be shown here';
const String cartTitle = 'Cart';

const String cartNotItemsCopyTitle = 'No Items in cart yet';
const String cartNotItemsCopyDescription =
    'Try buying some health products or booking a consultation';

// health records
const String comingSoonText = 'Coming soon...';
const String healthRecordsText =
    'Your medical history, diagnosis, medications, test results and much more are shown here';
const String healthRecordsTitle = 'MY HEALTH PROFILE';

//profile
const String accountSection = 'Account';
const String changePINSettings = 'Change PIN';
const String changeAssistant = 'Change my assistant';
const String homeAndWorkSettings = 'Home and work address';
const String languageSettings = 'Language settings';
const String legalSection = 'Legal';
const String notificationSettings = 'Notification settings';
const String termsOfServiceSettings = 'Terms of service';
const String tryNewFeatureSettings = 'Try new features';
const String contactInfo = 'Contact info';
const String editProf = 'Contact info';
const String editProfDesc = 'Tap to enable editing';
const String verifyText = 'Send verification code';
const String invalidOtp = 'Invalid verification code';
const String successEmail = 'Email verified successfully';
const String editProfileString = 'Edit Profile';
const String profileUpdated = 'Profile updated successfully';
const String anonymousDescTitle = 'What can you do with a My Afya Hub account?';
const String anonymousDescBody =
    'Create a My Afya Hub account today and enjoy many features including the ones listed below';
const String profileComingSoonText = 'Coming soon';

// verify phone

const String commAlert = 'commAlert';
const String commConsent = 'commConsent';
const String text_2 = 'text_2';
const String emailAlert = 'emailAlert';
const String emailConsent = 'emailConsent';

// communication setting
const String emailSubtitle =
    'Receive emails, including verification PINs and communication from My Afya Hub by Slade360';
const String emailTitle = 'Email';
const String messagesSubTitle =
    'Receive text messages including, verification PINs and communication from My Afya Hub by Slade360';
const String messagesTitle = 'Text messages';
const String pageHeader = 'Updates from My Afya Hub by Slade 360';
const String pushSubTitle =
    'Receive push notifications including, verification PINs and communication from My Afya Hub by Slade360';
const String pushTitle = 'Push Notifications';
const String snoozeSubTitle = 'Mute My Afya Hub notifications for some time';
const String snoozeTitle = 'Snooze notifications';
const String whatsAppSubTitle =
    'Receive text messages including, verification PINs and communication from My Afya Hub by Slade360';
const String whatsAppTitle = 'WhatsApp messages';

// help center strings
const String callIcon = 'assets/icons/call.svg';
const String chatIcon = 'assets/icons/chat.svg';
const String faqTextTitle = 'FAQs';
const String faqTextDescription = 'Frequently asked questions';
const String faqTextSubtitle =
    'We are here to help, browse through our frequently asked questions';
const String faqTitle = 'How can we help?';
const String faqSubtitle =
    'Quickly get help from our team or go through our FAQs';
const String faqPageTitle = 'My Afya Hub Support Center';
const String silPhoneNumber = 'tel:+254790360360';
const String topTopics = 'Top support Topics';
const String email = 'mailto:support@slade360.co.ke';
const String call = 'tel://+254790360360';
const String callText = 'Call support';
const String whatsAppText = 'WhatsApp';
const String logTitle = 'Get FAQs';

const String actionGenericTimeout = 'getting FAQs';
const String actionTextGenericNoData = 'Retry';
const String messageBodyGenericNoData =
    'Something went wrong while loading FAQs, retry or contact support for immediate help';
const String itemGenericEmptyData = 'FAQs';
const String contactUs = 'Contact Us';

// search page strings
const String applyLoan = 'Apply for a loan';
const String clear = 'Clear';
const String checkCart = 'Check my cart';
const String checkHealthRecords = 'Check my health records';
const String checkLoans = 'Check on my loans';
const String checkout = 'Checkout cart';
const String checkWellnessPoints = 'Check Wellness Points history';
const String consult = 'Consult Personal Coach';
const String earnWellnessPoints = 'Earn Wellness Points';
const String emptyQuery = 'Write something in order to search';
const String getHelp = 'Contact the help center';
const String getTest = 'Get tested';
const String helpCenter = 'Help center';
const String viewLibrary = 'View my Library';
const String loans = 'Loans';
const String manageWellnessPoints = 'Manage my Wellness Points';
const String medicine = 'Buy Medicine';
const String noQuery =
    'Sorry, we could not find what you were looking for, please try again or get help from our help center';
const String otcMedications = 'Order OTC medicine';
const String prescriptionMedications = 'Order prescription medicine';
const String queryLength = 'Search term needs to be longer than 2 letters';
const String recentSearchesText = 'Your recent Searches';
const String suggestedSearchTerms = 'Suggested';
const String result = 'Results for';
const String searchCheckup = 'Search for a check-up';
const String searchHintText = 'Search for anything';
const String searchMedication = 'Search for medication';
const String searchPageSubtitle = 'Popular searches';
const String seeDoctor = 'See a doctor';
const String startWorkout = 'Start Workout';
const String tests = 'Get Tested';
const String viewAppointments = 'View previous appointments';
const String viewItems = 'View items in my cart';
const String viewLab = 'View lab orders and tests';
const String weeklyDiet = 'Create your weekly diet';
const String wellnessPoints = 'Wellness Points';
const String whatYouCanDo = 'What you can do';
const String workout = 'Make your workout routine';

// wellness page strings
const String wellnessPageTitle = 'Wellness Points balance';
const String wellnessPageSubTitle = 'Wellness Points';
const String wellnessPayPageTitle = 'wellness points pay';
const String wellnessPayPagText = 'Scan QR code';
const String wellnessPointsHistoryPageTitle = 'wellness points history';
const String wellnessPointsComingSoonText =
    'Wellness Points is a loyalty scheme for My Afya Hub users. The points can be used for a variety of in-app purchases';

// event names
const String acceptTermsEvent = 'ACCEPTTERMS_EVENT';
const String addBioDataEvent = 'ADDBIODATA_EVENT';
const String addPhoneNumberEvent = 'ADDPHONENUMBER_EVENT';
const String awardHealthCashEvent = 'AWARDHEALTHCASH_EVENT';
const String buyMedicineEvent = 'BUYMEDICINE_EVENT';
const String cartAdditionEvent = 'CARTADDITION_EVENT';
const String completeOnboardingEvent = 'COMPLETEONBOARDING_EVENT';
const String editProfileEvent = 'EDITPROFILE_EVENT';
const String getTestedEvent = 'GETTESTED_EVENT';
const String homeArrivalEvent = 'HOMEARRIVAL_EVENT';
const String navigationEvent = 'NAVIGATION_EVENT';
const String notificationEvent = 'NOTIFICATION_EVENT';
const String paymentEvent = 'PAYMENT_EVENT';
const String successfulLaunchEvent = 'SUCCESSFULLAUNCH_EVENT';
const String verifyPhoneNumberEvent = 'VERIFYPHONENUMBER_EVENT';
const String viewBenefitDetailEvent = 'VIEWBENEFITDETAIL_EVENT';
const String viewBenefitEvent = 'VIEWBENEFIT_EVENT';
const String viewBenefitUtilizationEvent = 'VIEWBENEFITUTILIZATION_EVENT';
const String viewSpentAmountEvent = 'VIEWSPENTAMAOUNT_EVENT';

//App Rating
const String appStoreID = '1496576692';
const String googlePlayIdentifier = 'com.savannah.myafyahub';
const String rateNow = 'Rate now';
const String later = 'Later';
const String dialogTitle = 'Enjoying My Afya Hub?';
const String dialogSubtitle = 'Leave a rating';

const String timeoutErrorText =
    'There seems to be a network connection issue, please check you internet connection.';

//Terms & Conditions Strings
const String description = 'By using My Afya Hub you agree to';

//phone verification page strings
const String phoneVerificationHintText = 'Enter your phone number';
const String requiredPhoneNumber = 'Phone number is required';
const String sendingCode = 'Sending Code...';
const String sendingPhoneOtp = 'Sending phone otp';
const String titleDescription =
    'Kindly provide an phone number to verify below';
const String validPhoneNumber = 'Please enter a valid phone number';

//email verification page strings

const String emailAllowComm = 'Please allow email use to proceed';
const String emailAllowCommDescription = 'Allow My Afya Hub to use your email';
const String requiredEmail = 'Email is required';
const String sendingOtp = 'Verify email : send OTP';
const String sendVerificationEmail = 'Send verification to email';
const String emailTitleDescription = 'Kindly provide email to verify below';
const String validEmail = 'A valid email is required';
const String verifying = 'Verifying...';

//create account strings
const String acceptTerms = 'Accept Terms & Conditions';
const String createAccount = 'Create your account';

const String hint = 'Enter your phone number';
const String invalidCode =
    'You entered an incorrect code, please enter the correct code.';
const String label = 'Phone number';
const String phoneExists =
    'A user with that phone number exists. Kindly proceed to log in.';

const String loadingText = 'LOADING';

//login strings
const String loginDescription = 'Select an option to log in below';
const String loginButton = 'Log in with phone number';
const String loginTitle = 'Welcome back';
const String doesNotHaveAccount = 'Don\'t have an account?  ';
const String alreadyHaveAccount = 'Already have an account?  ';
const String enteredWrongPINString =
    'Sorry, you entered the wrong PIN, please try again.';
const String invalidCredentialsErrorMsg =
    'Sorry, you enter invalid credentials, please try again or get help from our help center.';

// resume with pin
const String errMsg = 'Sorry, we could not verify your PIN. Please try again.';
const String wrongPIN = 'You entered an incorrect PIN. Please try again.';

// Sliver app bar
const String welcomeMessage = 'What would you like to do today?';

const String gestureText = 'Select';

// medications landing page strings
const String medicationsTitle = 'Buy medicine';

const String medicationsDescription =
    'Buy medicine via a prescription. You can also take a'
    ' picture of your prescription and we will transcribe it for you.';
const String appbarTitle = 'medications';

const String zeroStateTitle = 'No medications yet';
const String zeroStateSubTitle =
    'Try buying some health products or medications';
const String buyMedicationButtonText = 'Buy Medication';
const String bottomSheetTitle = 'What is your medication order type';

const String tappableCardTitle = 'I have a doctor\'s prescription';
const String tappableCardSubtitle =
    'Take a photo of your doctor\'s prescription to order drugs';

// see a doctor landing page strings
const String seeDoctorTitle = 'See a doctor';
const String seeDoctorCopy = 'Schedule an appointment with a doctor';
const String seeDoctorComingSoonText = 'Seeing a doctor';

// get tested landing page strings
const String getTestedTitle = 'Get tested';
const String getTestedCopy = 'Order tests for yourself or someone else.'
    ' If you have a picture of a prescribed test, we can transcribe it for you.';
const String getTestedComingSoonText = 'Tests';

// request PIN reset strings
const String errorPhoneNumber = 'That phone number does not exist';

// basic details strings
const String basicDetailsString = 'Basic details';
const String requestBasicDetailsString = 'Kindly provide the details below';
const String requestFirstNameString = 'Enter first name';
const String firstNameLabel = 'First name';
const String firstNameHintText = 'Enter your first name';
const String firstNameRequiredString = 'First name is required';
const String requestLastNameString = 'Enter last name';
const String lastNameLabel = 'Last name';
const String lastNameHintText = 'Enter your last name';
const String lastNameRequiredString = ' Last name is required';
const String genderHint = 'Select gender';
const String genderRequired = 'Gender is required';
const String selectGender = 'Select gender';
const String dateLabelText = 'Tap to select a date';
const String dobRequired = 'Date of birth is required';

// user friendly messages
const String defaultUserFriendlyMessage =
    'Sorry, an unknown error occurred, please try again or get help from our help center.';
const String slowInternet =
    'Slow internet connection. Please check your connection and try again';
const String userWithThatPhoneExists =
    'Sorry, a user with that phone number already exists, kindly log in to continue';
const String userWithThatEmailExists =
    'Sorry, a user with that email address already exists';
const String usernameExists = 'That username already exists.';
const String userNotFound = 'We could not find a user with those details.';
const String wrongLoginCredentials = 'Your phone number or PIN do not match.';
const String pinNotFound = 'No PIN found for this user.';
const String noUserFoundString =
    'We could not find a user with those details, kindly create an account to continue';

// recover account
const String recoverAccountTitle = 'Recover Account';
const String recoverAccountSubTitle = 'Phone Number';
const String phoneNumberInputDescription =
    'Provide the phone number you used to sign up';
const String phoneNumberInputError = 'A phone number is required!';
const String otpInputError = 'An OTP is required';
const String recoverAccountPrimaryButtonText = 'Continue';
const String selectPrimaryPhoneNumberDescription =
    'Choose the phone number you wish to set as Primary';
const String selectRecoverAccountDescription =
    'We need to verify your identity, pick the phone number that is currently active';
const String getUserPhoneNumbersMessage =
    'We could not find a user linked to that phone number, kindly confirm and try again';
const String getUserPhoneNumbersButtonText = 'Create Account';
const String setPrimaryNumberErrorMessage =
    'An error occurred while save your details, please retry.';
const String setPrimaryNumberErrorButtonText = 'Try Again';
const String setPrimaryNumberSuccessMessage =
    'Your details were updated successfully, you can now login';
const String setPrimaryNumberSuccessButtonText = 'Login';
const String pickedPhoneNumberError = 'You can only pick one phone number';

// filter box
const String fingerprint = 'Fingerprint';
const String card = 'Card';
const String otp = 'OTP';
const String guardian = 'Guardian';
const String inpatient = 'Inpatient';
const String maternity = 'Maternity';
const String dental = 'Dental';
const String optical = 'Optical';
const String prescription = 'Prescription';
const String lab = 'Lab';
const String radiology = 'Radiology';

// inbox
const String retryButtonText = 'Retry';

// route error
const String goBack = 'Go back';
const String goHome = 'Go Home';
const String errorOccurred = 'An error occurred';
const String errorFind = 'We can\'t seem to find what you are looking for';

// generic widget
const String genericErrorOccurred = 'Sorry, an error occurred';
const String genericTryAgain = 'Please try again later';
const String genericVerifyPhoneNumber = 'Verify Phone number';
const String addingYourCover = 'Adding your cover...';
const String continueButtonText = 'Continue';
const String continueToLoginButtonText = 'Continue to Log in';
const String updatingProfileDetails = 'Updating profile details...';

// HTTP Request constants
const String httpPOST = 'POST';
const String httpGET = 'GET';

const String testAppSignature = 'testApp';

const String messagesComingSoonTitle = 'Messages';
const String messagesComingSoonDescription =
    'All your communications will appear here';

const String noUserFound = 'no_user_account_found';
const String userNotFoundMessage =
    'User does not exist,  tap the button below to create an account';
const String createAccountButtonText = 'Create Account';
const String failedToCreateAccount = 'Sorry, we could not create your account';
const String misMatchedPins =
    'Sorry, the PINs entered do not match, please try again';
const String providePhoneToProceed =
    'Kindly provide your phone number to proceed';
const String sendOtpError = 'Error encountered while sending OTP';

const String pressToExitText = 'Press back again to leave';

const String fetchingYourLibraryText = 'Fetching your library';

const String personalDetails = 'Personal details';
const String personalDetailsDesc =
    'Tell us more about you. We use the information below to enhance your My Afya Hub experience.';
final String copyrightString =
    'Copyright ©️ ${returnCurrentYear()} My Afya Hub';

// this is the version of the currently running app.
// it has to be defined as a const otherwise the compiler will return the default
const String APPVERSION =
    String.fromEnvironment('APPVERSION', defaultValue: 'dev-build');

const String appVersionString = 'Current Version:';
const String diagnosesString = 'Diagnoses';

const String diagnosesDescString = 'Tap to view your diagnoses details';

const String buildContactProviderState = 'buildContactProviderState';

const String removeText = 'Remove';
const String backIDSideText = 'Back Side';
const String frontIDSideText = 'Front Side';
const String uploadIdOrPassportText = 'Select identification document type';
const String idImageSelectionText = 'Upload photos of your National ID';
const String passportImageSelectionText = 'Upload photo of your Passport';
const String generalImageUploadError =
    'Unable to upload your selected image. Try again';

const String closeComparisonText = 'Close Comparison';

const String errorLoggingIn = 'Error logging in';
const String errorSigningUp = 'Error signing up';
const String errorResettingPIN = 'Error resetting PIN';
const String errorChangingPIN = 'Error changing PIN';
const String errorResumingWithPIN = 'Error resuming with PIN';
const String errorSendingRecoveryOTP = 'Error sending recovery OTP';
const String errorUpdatingBioData = 'Error updating bio data';

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng INITIAL_LOCATION = LatLng(-1.286389, 36.817223);

String serverTookLongToRespondText =
    'It\'s not you, it\'s us. Our server took too long to respond. Give us a moment to fix it and try again in a short while.';

String serverFailureText =
    'It\'s not you, it\'s us. A server failure occurred. Kindly try again.';

String noInternetConnectionText =
    'Make sure wifi or cellular data is turned on and then try again.';

String noInternetConnectionTitleText = 'Oops, No internet connection';

String somethingWentWrongTitleText = 'Something went wrong';

const String refreshText = 'REFRESH';
const String goToPreviousPage = 'Go to previous page';

const String continueWithBowi = 'Continue with Bowi';
const String continueWithBev = 'Continue with Bev';

// localized counts
const String bullet = '\u2022 ';
const String frontPassportPictureText = 'Front passport picture';
const String sharedBenefitExplanation =
    'This is a shared benefit. The total amount above is inclusive of what your dependants have spent';

const String searchLocationText = 'Search location';
const String letUsStartText = 'Let\'s Start...';

const String landingPageActionState = 'landing_page_action_state';
const String confirmText = 'Confirm';
const String cancelText = 'Cancel';
const String confirmBioDataTitle = 'Confirm your bio data info';
const String confirmBioDataBody =
    'We hope you have provided the correct information about your and your dependants. Please press confirm to proceed, or cancel to update the details.';

const String confirmHRATitle = 'Confirm your medical information';
const String confirmHRABody =
    'We hope you have provided the correct information about your and your dependants\'s medical information. Please press confirm to proceed, or cancel to update the details ';

const String introSliderOneTitle = 'Find your health insurance';
const String introSliderOneDesc =
    'You provide your preferences, Bowie will take care of the rest.';
const String introSliderTwoTitle = 'Add your Wellness Card';
const String introSliderTwoDesc =
    'Link your health insurance to access all your Virtual Wellness Cards.';
const String introSliderThreeTitle = 'Track your health insurance expenses';
const String introSliderThreeDesc =
    'Access all your hospital spending anywhere, anytime.';
const String introSliderFourTitle = 'View your health insurance benefits';
const String introSliderFourDesc =
    'Get a detailed view of all services covered under your health insurance.';
const String introSliderFiveTitle = 'Build healthy habits';
const String introSliderFiveDesc =
    'Explore and read curated content fit for your health.';
const String introSkip = 'Skip';
const String introDone = 'Done';

const String noFeedDataMessage =
    'Something went wrong while fetching your feed';
const String noInternetConnection = 'No Internet Connection';

const String duplicateRequestString = 'a similar request is under review';
