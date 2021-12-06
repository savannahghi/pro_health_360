/// This file stores flags used in the app
///
/// flags are just unique strings used by async_redux to toggle loading for
/// some specific events. For more info on the implementation, take a look at
/// the [AppState] class

// feed flags
const String feedRefreshFlag = 'refresh_user_feed_flag';
const String fetchUserFeedFlag = 'fetch_user_feed_flag';

//Terms and Conditions
const String getTermsFlag = 'get_terms_flag';
const String acceptTermsFlag = 'accept_terms_flag';

// Home page
const String canRecordMoodFlag = 'can_record_mood_flag';
const String createHealthDiaryFlag = 'create_health_diary_flag';

//Security Questions
const String getSecurityQuestionsFlag = 'get_security_questions';
const String recordSecurityQuestionsFlag = 'record_security_questions_flag';

// basic details
const String updateBasicDetailsFlag = 'update_basic_details_flag';

// landing page
const String anonymousLoginFlag = 'anonymous_login_flag';

// phone number entry
const String phoneNumberEntryFlag = 'phone_number_entry_flag';

// create pin page
const String createPinFlag = 'create_pin_flag';

const String phoneLoginFlag = 'phone_login_flag';

const String paymentRequestFlag = 'payment_request_flag';

const String requestResetPinFlag = 'request_reset_pin_flag';

const String sendOTPFlag = 'sending_otp_flag';
const String resendOTPFlag = 'resending_otp_flag';
const String verifyOTP = 'verify_otp_flag';
const String requestResetPinText = 'request_reset_pin_flag';

// Congratulations page
const String setNickNameFlag = 'set_nickname_flag';

//Content Details Page
const String updateLikeContentFlag = 'update_like_content_flag';
const String fetchContentFlag = 'fetch_content_flag';
const String bookMarkContentFlag = 'bookmark_content_flag';
const String fetchHealthDiaryFlag = 'fetch_health_diary_flag';
const String fetchLikeStatusFlag = 'fetch_like_status_flag';
const String fetchBookmarkStatusFlag = 'fetch_bookmark_status_flag';
const String shareContentFlag = 'share_content_flag';

//Saved Content Page
const String fetchSavedContentFlag = 'fetch_saved_content_flag';
