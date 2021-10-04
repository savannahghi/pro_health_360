import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:myafyahub/presentation/profile/profile_utils.dart';

const String requestTimeoutError =
    'We could not perform this process in time. Please try again';

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
        'Enter phone number',
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
  static const String changePINMsg =
      'Your PIN was successfully updated. You will now be required to login with your new PIN';
}

const String unMatchingPinErrorText =
    'The PIN entered does not match. Please try again';

// onboarding
const String changePINActionError = 'change_pin_action';
const String changePINActionException =
    'There was an error encountered while handling change PIN request, kindly try again';
const String pinMismatchError = 'change_pin_exception';
const String pinMismatchException =
    'You entered an incorrect PIN, please try again';
const String enterPINText = 'Enter your PIN to continue';
const String fourDigitPin = 'Please enter a 4 digit PIN';
const String landingPageTitle = 'Welcome to My Afya Hub';
const String logoutButtonText = 'Logout';
const String phoneNumberSignInSubtitle = 'Use your phone number and PIN';
const String pinUpdateSuccess = 'Your PIN was updated successfully';

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
const String infoDoneText = 'Done';

// library
const String emptyLibraryCopy =
    'Your library is empty. We will notify you once we have more items.';
const String libraryNoDataCopy =
    'Something went wrong while loading your library, check later or get help from our help center.';
const String libraryTitle = 'Library';

//profile
const String accountSection = 'Account';
const String changePINSettings = 'Change PIN';
const String legalSection = 'Legal';
const String termsOfServiceSettings = 'Terms of service';
const String contactInfo = 'Contact info';
const String profileUpdated = 'Profile updated successfully';

// help center strings
const String faqTextDescription = 'Frequently asked questions';
const String faqTextSubtitle =
    'We are here to help, browse through our frequently asked questions';
const String faqSubtitle =
    'Quickly get help from our team or go through our FAQs';
const String faqPageTitle = 'My Afya Hub Support Center';
const String silPhoneNumber = 'tel:+254790360360';
const String callText = 'Call support';
const String whatsAppText = 'WhatsApp';
const String logTitle = 'Get FAQs';

const String actionTextGenericNoData = 'Retry';
const String messageBodyGenericNoData =
    'Something went wrong while loading FAQs, retry or contact support for immediate help';
const String itemGenericEmptyData = 'FAQs';

const String clear = 'Clear';

const String getHelp = 'Contact the help center';
const String getTest = 'Get tested';
const String helpCenter = 'Help center';
const String viewLibrary = 'View my Library';
const String medicine = 'Buy Medicine';
const String noQuery =
    'Sorry, we could not find what you were looking for, please try again or get help from our help center';
const String prescriptionMedications = 'Order prescription medicine';
const String queryLength = 'Search term needs to be longer than 2 letters';

const String suggestedSearchTerms = 'Suggested';
const String result = 'Results for';
const String searchHintText = 'Search for anything';
const String searchPageSubtitle = 'Popular searches';
const String seeDoctor = 'See a doctor';
const String tests = 'Get Tested';
const String viewLab = 'View lab orders and tests';
const String weeklyDiet = 'Create your weekly diet';
const String whatYouCanDo = 'What you can do';
const String workout = 'Make your workout routine';

//App Rating
const String appStoreID = '1496576692';
const String googlePlayIdentifier = 'com.savannah.myafyahub';
const String rateNow = 'Rate now';
const String later = 'Later';
const String dialogTitle = 'Enjoying My Afya Hub?';
const String dialogSubtitle = 'Leave a rating';

//create account strings
const String createAccount = 'Create your account';

const String loadingText = 'LOADING';

//login strings
const String doesNotHaveAccount = 'Don\'t have an account?  ';
const String enteredWrongPINString =
    'Sorry, you entered the wrong PIN, please try again.';
const String invalidCredentialsErrorMsg =
    'Sorry, you enter invalid credentials, please try again or get help from our help center.';

// resume with pin
const String errMsg = 'Sorry, we could not verify your PIN. Please try again.';
const String wrongPIN = 'You entered an incorrect PIN. Please try again.';

// Sliver app bar
const String welcomeMessage = 'What would you like to do today?';

// medications landing page strings
const String medicationsTitle = 'Buy medicine';

const String medicationsDescription =
    'Buy medicine via a prescription. You can also take a'
    ' picture of your prescription and we will transcribe it for you.';

// see a doctor landing page strings
const String seeDoctorTitle = 'See a doctor';
const String seeDoctorCopy = 'Schedule an appointment with a doctor';
const String seeDoctorComingSoonText = 'Seeing a doctor';

// get tested landing page strings
const String getTestedTitle = 'Get tested';
const String getTestedCopy = 'Order tests for yourself or someone else.'
    ' If you have a picture of a prescribed test, we can transcribe it for you.';
const String getTestedComingSoonText = 'Tests';

// basic details strings
const String firstNameRequiredString = 'First name is required';
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
const String getUserPhoneNumbersMessage =
    'We could not find a user linked to that phone number, kindly confirm and try again';

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

// generic widget
const String genericErrorOccurred = 'Sorry, an error occurred';
const String genericTryAgain = 'Please try again later';
const String genericVerifyPhoneNumber = 'Verify Phone number';
const String continueButtonText = 'Continue';
const String continueToLoginButtonText = 'Continue to Log in';
const String updatingProfileDetails = 'Updating profile details...';

// HTTP Request constants
const String httpPOST = 'POST';

const String noUserFound = 'no_user_account_found';

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

const String buildContactProviderState = 'buildContactProviderState';

const String errorLoggingIn = 'Error logging in';
const String errorSigningUp = 'Error signing up';
const String errorResettingPIN = 'Error resetting PIN';
const String errorChangingPIN = 'Error changing PIN';
const String errorResumingWithPIN = 'Error resuming with PIN';
const String errorUpdatingBioData = 'Error updating bio data';

const double CAMERA_ZOOM = 13;
const double CAMERA_BEARING = 30;

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
const String diaryString = 'Diary';
const String textEntryString = 'Text entry';
const String imageFileString = 'Image file';

//Verify phone number page
const String verifyPhoneNumberTitle = 'Verify phone number';
const String verifyPhoneNumberDescription =
    'A one time password has been sent to your phone';
const String enterOTPString = 'Enter OTP to proceed';
const String confirmOTPButtonString = 'Confirm OTP';
const String invalidOTPString = 'Invalid OTP *';
const String setSecurityQuestionsString = 'Set security questions';
const String securityQuestionsDescriptionString =
    'Choose one security question. Make sure to remember the answer';

const String answerSecurityQuestionString = 'Answer security question';
const String answerCorrectlyToGainAccessString =
    'Answer correctly to gain access';

const String whereWereYouBornString = 'Where were you born?';
const String whatsTheNameOfYourPetString = 'What\'s the name of your pet?';
const String whatsYourfavouriteFoodString = 'What\'s your favourite food?';
const String whereDidYouFirstLiveString = 'Where did you first live?';
const String answerHereString = 'Answer here';
const String saveAndContinueButtonText = 'Save & Continue';
const String doneText = 'Done';
const String phoneNumberRequiredText = 'Phone number is required';
const String validPhoneNumberText = 'Please enter a valid phone number';
const String loginPageTitleString = 'Welcome\nto My Care Hub';
const String loginPageSubTitleString = 'Enter PIN sent to you to continue';
const String phoneNumberString = 'Phone Number';
const String pinString = 'PIN';
const String enterYourString = 'Enter your PIN';
const String enterPhoneNumberString = 'Enter phone number';
const String continueString = 'Continue';
String howAreYoufeelingTodayText(String user) {
  return 'Hi $user, how are you feeling today?';
}

const String excitedString = 'Excited';
const String happyString = 'Happy';
const String mehString = 'Meh';
const String sadString = 'Sad';
const String verySadString = 'Very Sad';
const String confirmPinString = 'Confirm new PIN';
const String createNewPINTitleString = 'Create new pin';
const String createNewPINSubTitleString =
    'Enter a new 4 digit pin, make sure you remember it.';
const String pinMustMatchString = 'PIN must match';
//congratulations page
String congratulationsPageTitle(String duration) =>
    'Congratulations on your $duration health journey';
const String congratulationsPageDescription =
    'Please create a nickname (Visible to community members)';
const String nickNameString = 'Name';
const String nameInputValidateString = 'Name is required';
const String importantInformationString = 'Important Information';

// Community strings
const String groupText = 'Group';

//Important Information Link Widget
const String importantLinkString = 'Important Link';

// Consent page
const String viewTermsText = 'View terms and conditions';
const String groupsText = 'Groups';
const String consentText = 'I consent to be added to groups';

// Terms and conditions
const String portalTermsText = 'Portal terms and conditions';
const String readAndAcceptText =
    'Read and accept the terms and conditions to proceed';
const String acceptTermsText = 'I accept terms and conditions';
const String joinString = 'Join';
const String suggestedGroupsString = 'Suggested groups to join';

//User Profile
const String correctionRequestString = 'Request for correction';
const String hotlineString = 'Hotline';
const String hotlineNumberString = '0712345678';
const String callString = 'Call';

//feed Item Widget
const String feedHeader =
    'Tips on how to keep yourself properly hydrated while exercising';
const String feedDate = 'July 12 2021';
const String feedReadTime = '5 minutes';
String contentReadDuration(String duration) => '$duration read';
const String newString = 'New';

//New Content
const String newContentText = 'New Content';
const String viewAllText = 'View All';
