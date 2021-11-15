// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:myafyahub/presentation/profile/profile_utils.dart';

const String requestTimeoutError =
    'We could not perform this process in time. Please try again';

class OnboardingStrings {
  OnboardingStrings(this.locale);

  final Locale locale;

  static OnboardingStrings? of(BuildContext context) {
    return Localizations.of<OnboardingStrings>(context, OnboardingStrings);
  }

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

  String selectGenderText() => Intl.message(
        'Select gender',
        name: 'selectGenderText',
        desc: 'persons gender',
      );

  String previousText() => Intl.message(
        'Previous',
        name: 'previousText',
        desc:
            'Text used in buttons to show an action takes user to a previous screen',
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

  String backText() => Intl.message(
        'Back',
        name: 'backText',
        desc:
            'used in buttons for an action that takes user to previous screen',
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
const String whatsYourFavouriteFoodString = 'What\'s your favourite food?';
const String whereDidYouFirstLiveString = 'Where did you first live?';
const String answerHereString = 'Answer here';
const String saveAndContinueButtonText = 'Save & Continue';
const String doneText = 'Done';
const String phoneNumberRequiredText = 'Phone number is required';
const String validPhoneNumberText = 'Please enter a valid phone number';
const String loginPageTitleString = 'Welcome to My Care Hub';
const String loginPageSubTitleString = 'Enter PIN sent to you to continue';
const String phoneNumberString = 'Phone Number';
const String pinString = 'PIN';
const String enterYourString = 'Enter your PIN';
const String enterPhoneNumberString = 'Enter phone number';
const String continueString = 'Continue';
String howAreYouFeelingTodayText(String user) {
  return 'Hi $user, how are you feeling today?';
}

// Mood Selection
const String excitedString = 'Excited';
const String happyString = 'Happy';
const String mehString = 'Meh';
const String sadString = 'Sad';
const String verySadString = 'Very Sad';
const String pleaseAddaNoteOnHowYouAreFeelingString =
    'Neat, please add a note on how you are feeling';
const String areYouFeelingAnyOfTheFollowingString =
    'Are you feeling any of the following?';
const String selectWhatBestDescribesHowYourCurrentConditionString =
    'Select what best describes how your current condition';
const String soSorryPleaseDescribeHowAreFeelingString =
    'So sorry, please describe how you are feeling.';
const String addNotesString = 'Add notes';
const String iHaveNightSweatsString = 'I have night sweats';
const String iHaveaFeverString = 'I have a fever';
const String imCoughingString = 'I\'m coughing';
const String iVeLostWeightString = 'I\'ve lost weight';
const String nextString = 'Next';
const String saveEntryString = 'Save Entry';

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
const String nameInputValidateString = 'Kindly input a nickname';
const String importantInformationString = 'Important Information';

// Community strings
const String groupText = 'Group';
const String groupInfoText = 'Group Info';
const String exitGroupText = 'Exit Group';
const String messageText = 'message';

//Important Information Link Widget
const String importantLinkString = 'Important Link';

// Consent page
const String viewTermsText = 'View terms and conditions';
const String groupsText = 'Groups';
const String consentConfirmationText = 'I consent to be added to groups';
const String consentText = 'Consent';

// Community strings
const String communityPageString = 'Community';
const String libraryPageString = 'Library';

// Terms and conditions
const String portalTermsText = 'Portal terms and conditions';
const String readAndAcceptText =
    'Read and accept the terms and conditions to proceed';
const String acceptTermsText =
    'I have read and accepted the terms and conditions';
const String joinString = 'Join';
const String suggestedGroupsString = 'Suggested groups to join';
const String closeString = 'Close';
const String acceptTermsErrorMessage =
    'Kindly agree to the terms and conditions before proceeding';

// Community Chat
const String awaitingModerationString = 'Awaiting Moderation';
const String typeYourMessageHereString = 'Type your Message here';

//User Profile
const String hotlineString = 'Hotline';
const String hotlineNumberString = '0712345678';
const String callString = 'Call';
const String clinicContactString = 'Clinic contacts';
const String chvString = 'CHV';
const String treatmentBuddyString = 'Treatment buddy';
const String keyProviderString = 'Key provider';

// Page title strings
const String myProfilePageTitle = 'My Profile';
const String clinicInfoPageTitle = 'Clinic Information';
const String personalInfoPageTitle = 'Personal Information';
const String medicalDataPageTitle = 'Medical Data';

//feed Item Widget
const String feedHeader =
    'Tips on how to keep yourself properly hydrated while exercising';
const String feedDate = 'July 12 2021';
const String feedReadTime = '5 minutes';
String contentReadDuration(String duration) => '$duration read';
const String newString = 'New';

//My Health Page
const String myHealthPageTitle = 'My Health';
const String myHealthPageProfile = 'My Profile';
const String initials = 'WJ';
const String myHealthPagePatient = 'Patient ID';
const String myHealthViralLoad = 'Viral load';
const String myHealthViralLoadReading = '600';
const String myHealthViralLoadReadingUnit = '/ml';
const String myHealthNextRefill = 'Next refill';
const String myHealthNextRefillDate = '19';
const String myHealthNextRefillMonth = 'Aug';
const String myHealthPageHealthDiary = 'My Health Diary';
const String myHealthPageAppointments = 'Appointments';
const String feelingString = 'Feeling';
const String textString = 'Text';
const String addDiaryString = 'Add diary entry';
const String myHealthTimelineText = 'My Health Timeline';

//Appointments
const String appointmentsPageTitle = 'Appointments';
const String upcomingAppointmentsText = 'Upcoming appointments';
const String pastAppointmentsText = 'Past appointments';

//New Content
const String newContentText = 'New Content';
const String viewAllText = 'View All';

//Personal Information
const String myProfileCaregiverText = 'Caregiver information';
const String myProfileCaregiverDescriptionText =
    'Could be a parent, guardian or nurse';
const String janeDoe = 'Jane Doe';
const String father = 'Father';
const String name = 'Name';
const String phoneNumber = 'Phone number';
const String relationText = 'How are you related';
const String preferredLanguage = 'Preferred Language';
const String english = 'English';
const String preferredClinic = 'Preferred Clinic';
const String clinic = 'Equity Afia Ruaka';
const String preferredCommunication = 'Preferred way of Communication';
const String inApp = 'in app';

// Profile FAQs
const String faqsText = 'FAQs';
const String frequentlyAskedQuestions = 'Frequently asked questions';
const String howDoIUpdateMyProfileText = 'How do i update my profile?';
const String howDoICheckMyMedicalInfoText =
    'How do i check my medical information?';
const String howDoIUpdateMyNicknameText = 'How do i update my nickname?';
const String howDoIRescheduleAnAppointmentText =
    'How do reschedule an appointment?';

const String comingSoonText = 'Coming soon';
const String loremIpsumText =
    'A detailed description for this question will be available soon';
const String tapToLearnMoreText = 'Tap to learn more';

//savedPosts
const String savedText = 'Saved';
const String savedVideoText = 'Saved Video';
const String savedArticleText = 'Saved Article';
const String feedHeaderListSavedVideo = 'How to keep yourself healthy always';

//notifications
const String addCalendarText = 'Add to Calendar';
const String notificationsText = 'Notifications';

//Pin input page strings
const String enterChatPINString = 'Enter your pin to view your chats';
const String forgotPINString = 'Forgot pin?';
const String wrongPINString = 'Wrong pin, try again';

//Health Diary page
const String myHealthDiaryString = 'My Health Diary';

//settings page
const String nickNameString = 'Nickname';
const String editString = 'Edit';
const String settingsPageTitle = 'Settings';
const String saveString = 'Save';

//Feedback Page
const String feedbackString = 'Feedback';
const String weValueFeedbackString = 'We value your feedback';
const String anyThoughtsToShareString =
    'Do you have any thoughts you\'d like to share?';
const String howToImproveExperienceString =
    'Let us know how we might improve your experience in the app';
const String followUpOnFeedbackString =
    'May we follow up with you on your feedback??';
const String yesString = 'Yes';
const String noString = 'No';
const String sendFeedbackString = 'Send feedback';
const String cancelString = 'Cancel';
const String allString = 'All';
const String recommendedString = 'Recommended';
const String exerciseString = 'Exercise';
const String dietString = 'Diet';

//Article Details Page
const String datePublishedString = 'Published on ';

String defactoZeroStateString({String topic = 'Content'}) =>
    '$topic will be available soon';

const String termsAndConditionsString = 'Terms and conditions';

const String twoYearText = '2 year';

//Forgot PIN Page
const String answerToGainAccessString = 'Answer correctly to gain access';

const String textEntryText = 'Text entry';
const String imageFileText = 'Image file';

String getDoctorName(String? firstName, String? lastName) =>
    'Dr $firstName $lastName';

//Edit information page
const String mother = 'Mother';
const String sibling = 'Sibling';
const String selectYourPreferredLanguage = 'Select your preferred language';
const String swahili = 'Swahili';
const String selectYourPreferredClinic = 'Select your preferred Clinic';
const String equityAfiaUmoja = 'Equity Afia Umoja';
const String kenyattaHospital = 'Kenyatta National Hospital';
const String selectYourPreferredCommunication =
    'Select your preferred communication channel';
const String communicationChannel = 'Communication channel';
const String nickNameFieldName = 'Enter your nickname';
String editInfoTitle(String title) => 'Edit $title';

const String somethingWentWrongText = 'Something went wrong';
