// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

const String requestTimeoutError =
    'We could not perform this process in time. Please try again';

const String phoneRequiredText = 'A valid phone number is required';

const String previousText = 'Previous';

const String backText = 'Back';

const String verifyPhoneNumberText = 'Verify Phone Number';

const String codeSentText = 'A 6 digit code has been sent to';

const String changePINMsg =
    'Your PIN was successfully updated. You will now be required to login with your new PIN';

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
const String landingPageTitle = 'Welcome to myCareHub';
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
    'Something went wrong while fetching contents of this section, retry or contact support for immediate help';
const String feedErrorDetail =
    'Something went wrong while fetching recent content, kindly try again or contact our support center for immediate help';
const String healthDiaryErrorDetail =
    'Something went wrong while fetching your diary, kindly try again or contact our support center for immediate help';

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

const String checkInternetText = 'Check your internet connection and try again';

const String connectionLostText = 'Internet connection lost';

const String slowInternet =
    'Looks like you have a slow internet connection. Please check your connection and try again';
const String userWithThatPhoneExists =
    'Sorry, a user with that phone number already exists, kindly log in to continue';
const String userWithThatEmailExists =
    'Sorry, a user with that email address already exists';
const String usernameExists = 'Sorry, that username already exists.';
const String userNotFound =
    'Sorry, we could not find a user with those details. Please confirm that the credentials you provided are correct';
const String wrongLoginCredentials = 'Your phone number or PIN do not match.';
const String pinNotFound = 'No PIN found for this user.';
const String noUserFoundString =
    'We could not find a user with those details. Kindly create an account to continue';

// recover account
const String getUserPhoneNumbersMessage =
    'We could not find a user linked to that phone number. Kindly confirm and try again';

// inbox
const String retryButtonText = 'Retry';

// generic widget
const String genericErrorOccurred = 'Sorry, an error occurred';
const String genericTryAgain =
    'Something went wrong while fetching content for you. Please retry or check in later for more. You can also contact our support center in case the issue persists';
const String genericVerifyPhoneNumber = 'Verify Phone number';
const String continueToLoginButtonText = 'Continue to Log in';
const String updatingProfileDetails = 'Updating profile details...';

const String youHaveNoSaveItemsText = 'You have no saved items';
const String pleaseBePatientWhileWePrepareYourSaveItemsText =
    'Please be patient while we prepare your saved items.';

// HTTP Request constants
const String httpPOST = 'POST';

const String noUserFound = 'no_user_account_found';

const String createAccountButtonText = 'Create Account';
const String failedToCreateAccount = 'Sorry, we could not create your account';
const String misMatchedPins =
    'Sorry, the PINs entered do not match, please try again';
const String providePhoneToProceed =
    'Kindly provide your phone number to proceed';

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
    'A six digit verification code has been sent to your phone';
const String enterOTPString = 'Enter verification code to proceed';
const String confirmOTPButtonString = 'Confirm OTP';
const String invalidOTPString = 'Invalid OTP *';
String anOtpHasBeenSentText(String phoneNumber) {
  return 'An OTP has been sent to $phoneNumber';
}

const String resendOTP = 'Resend code';

const String verifyOTPState = 'verifyOTPState';
const String didNotReceiveOTP = 'Did not receive a verification code?';

const String setSecurityQuestionsString = 'Set security questions';
const String securityQuestionsDescriptionString =
    'These questions will be used to reset your PIN. Make sure to remember the answers you provide';

const String answerSecurityQuestionString = 'Answer security question';
const String answerCorrectlyToGainAccessString =
    'Answer correctly to gain access';

const String kindlyAnswerAllQuestionsString = 'Kindly answer all questions';

// TODO(abiud): remove these strings. they should be fetched from the backend
const String whereWereYouBornString =
    'What are the last 3 digits of your CCC number?';
const String whatsTheNameOfYourPetString =
    'Which month did you start your treatment?';
const String whereDidYouFirstLiveString =
    'Which county is your clinic located?';

const String answerHereString = 'Answer here';
const String saveAndContinueButtonText = 'Save & Continue';
const String doneText = 'Done';
const String phoneNumberRequiredText = 'A phone number is required';
const String validPhoneNumberText = 'Please enter a valid phone number';
const String loginPageTitleString = 'Welcome to myCareHub';
const String loginPageSubTitleString =
    'Please enter your phone number and PIN to continue.';
const String phoneNumberString = 'Phone Number';
const String pinString = 'PIN';
const String enterYourString = 'Kindly enter your PIN';
const String enterPhoneNumberString = 'Kindly enter your phone number';
const String continueString = 'Continue';
String howAreYouFeelingTodayText(String user) {
  return 'Hi $user, how are you feeling today?';
}

// Mood Selection
const String veryHappyString = 'Very Happy';
const String happyString = 'Happy';
const String neutralString = 'Meh';
const String sadString = 'Sad';
const String verySadString = 'Very Sad';
const String pleaseAddANoteOnHowYouAreFeelingString =
    'Great, please describe your feeling';
const String iAmFeelingText = 'I am ';
const String areYouFeelingAnyOfTheFollowingString =
    'Are you feeling any of the following?';
const String selectWhatBestDescribesHowYourCurrentConditionString =
    'Select what best describes how your current condition';
const String shareDiaryEntryPrompt =
    'Would you like to share your diary entry with your doctor? It might be discussed in your next visit';
const String elaborateString = 'Please elaborate';
const String soSorryPleaseDescribeHowAreFeelingString =
    'So sorry, please describe how you are feeling.';
const String addNotesString = 'Describe how you are feeling';
const String iHaveNightSweatsString = 'I have night sweats';
const String iHaveAFeverString = 'I have a fever';
const String imCoughingString = 'I\'m coughing';
const String iVeLostWeightString = 'I\'ve lost weight';
const String nextString = 'Next';
const String errorCreatingHealthDiaryEntryString =
    'Error creating health diary entry';

const String confirmPinString = 'Confirm new PIN';
const String createNewPINTitleString = 'Create new PIN';
const String createNewPINSubTitleString = 'Enter your new 4 digit PIN.';
const String pinMustMatchString = 'PIN must match';

//congratulations page
String setNickNamePageTitle({required BuildContext context}) {
  /// [congratulationsPageTitle] function fetches the enrollment date from state and calculates
  /// the difference in years to return the appropriate message to the title on [CongratulationsPage]
  final int duration = DateTime.now()
      .difference(
        DateTime.parse(
          StoreProvider.state<AppState>(context)!
                      .clientState!
                      .treatmentEnrollmentDate! ==
                  UNKNOWN
              ? DateTime.now().toString()
              : StoreProvider.state<AppState>(context)!
                  .clientState!
                  .treatmentEnrollmentDate!,
        ),
      )
      .inDays;
  return 'Congratulations on your ${getEnrollmentDuration(
    enrollmentDuration: duration,
  )}health journey';
}

String getEnrollmentDuration({
  required int enrollmentDuration,
}) {
  if ((enrollmentDuration / 365) >= 2) {
    return '${(enrollmentDuration / 365).round()} years ';
  }

  return '';
}

const String congratulationsPageDescription =
    'Please create a nickname (Visible to community members)';
const String nameInputValidateString = 'Kindly input a nickname';
const String importantInformationString = 'Important Information';

// Community strings
const String groupText = 'Group';
const String groupInfoText = 'Group Info';
const String exitGroupText = 'Exit Group';
const String messageText = 'message';

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
    'Please review the terms of service below and accept them';
const String acceptTermsText = 'I agree with the terms and conditions';
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
const String feedDate = '2021-08-23T06:42:05.085216Z';
const String feedReadTime = '5 minutes';
String contentReadDuration(int duration) =>
    duration == 0 ? '...' : '${(duration / 60).floor()} min read';
String contentAudioVideoDuration(int duration) =>
    duration == 0 ? '...' : '${(duration / 60).floor()} min';

const String newText = 'New';

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
const String enterChatPINString = 'Enter your PIN to view your chats';
const String forgotPINString = 'Forgot PIN?';
const String wrongPINString = 'Wrong PIN, try again';

//Health Diary page
const String myHealthDiaryString = 'My Health Diary';

//settings page
const String nickNameString = 'Nickname';
const String editString = 'Edit';
const String settingsPageTitle = 'Settings';
const String saveString = 'Save';
const String savedString = 'Saved';

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

//Article Details Page
const String datePublishedString = 'Published on ';

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

const String somethingWentWrongText =
    'Sorry, an unknown error occurred, please try again or get help from our help center.';
const String pinSuccessString = 'PIN created successfully';
const String requestCorrectionString = 'Request for correction';
const String nicknameSuccessString = 'Nickname created successfully';

const String invalidCode =
    'You have entered a wrong code. Kindly verify the code sent or resend the code to your phone number';
const String verifyCode = 'Verifying Code';
const String likeString = 'like';
const String shareString = 'Share';
const String sendOTPError =
    'There was an error while sending your verification code. Let’s get you a fresh verification code';

const String defaultQuoteAuthor = 'myAfyaHub';
const String randomQuoteText =
    'The greatest glory in living lies not in never falling, but in rising every time we fall';
const String randomQuoteAuthor = '- Nelson Mandela';

//Feed Page
const String contentCategoriesErrorMessage = 'Something went wrong. Retry';

const String contentSavedSuccessfully = 'Content saved successfully';
const String diaryEntrySuccessfulText = 'Diary entry added successfully';
const String diaryEmptyTitle = 'Your diary is empty';
const String diaryEmptyDescription =
    'No worries, let’s get you started. Tap the button below to make your first diary entry. You will be redirected to the home page';

const String mightTakeSomeTimeText =
    'They might take some time to reach out to you. '
    'If it is an emergency, please contact your '
    'clinic on ';
const String okThanksText = 'Ok, thanks';
const String clinicNumber = '+254 7123456';

String getSuccessfulBodyText(String userName) {
  return 'Thanks $userName for sharing how you are feeling. '
      'We have notified your clinician. Your entry might be discussed '
      'on your next visit.';
}

const String contentZeroStateTitle = 'You have no content';
const String contentZeroStateDescription =
    'Sit back, relax and enjoy a cup of coffee as we prepare fresh content for you';
const String contentZeroStateButtonText = 'Retry';
const String fetchLikeStatusErrorString =
    'Error while fetching your like status';
