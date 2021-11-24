/// This file stores flags used in the app
///
/// flags are just unique strings used by async_redux to toggle loading for
/// some specific events. For more info on the implementation, take a look at
/// the [AppState] class

// feed flags
const String feedRefreshFlag = 'refresh_user_feed';
const String fetchUserFeedFlag = 'fetch_user_feed';

//Terms and Conditions
const String getTermsFlag = 'get_terms';
const String acceptTermsFlag = 'accept_terms';

//Security Questions
const String getSecurityQuestionsFlag = 'get_security_questions';

// basic details
const String updateBasicDetailsFlag = 'update_basic_details';

// landing page
const String anonymousLoginFlag = 'anonymous_login';

// phone number entry
const String phoneNumberEntryFlag = 'phone_number_entry';

// create pin page
const String createPinFlag = 'create_pin';

const String phoneLoginFlag = 'phone_login';

const String paymentRequestFlag = 'payment_request_flag';

const String requestResetPinFlag = 'request_reset_pin';

const String sendOTPFlag = 'sending_otp';
const String resendOTPFlag = 'resending_otp';
const String verifyOTP = 'verify_otp_flag';
const String requestResetPinText = 'request_reset_pin';

// Congratulations page
const String setNickNameFlag = 'set_nickname';
