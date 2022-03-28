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
const String fetchRecentContentFlag = 'fetch_recent_content_flag';

//Security Questions
const String getSecurityQuestionsFlag = 'get_security_questions';
const String recordSecurityQuestionsFlag = 'record_security_questions_flag';
const String verifySecurityQuestionsFlag = 'verify_security_questions_flag';

// profile faqs
const String getFAQsFlag = 'get_faqs_flag';

// basic details
const String updateBasicDetailsFlag = 'update_basic_details_flag';

// landing page
const String anonymousLoginFlag = 'anonymous_login_flag';

// phone number entry
const String phoneNumberEntryFlag = 'phone_number_entry_flag';

// create pin page
const String createPinFlag = 'create_pin_flag';
const String resetPinFlag = 'reset_pin_flag';

const String phoneLoginFlag = 'phone_login_flag';

const String paymentRequestFlag = 'payment_request_flag';

const String requestResetPinFlag = 'request_reset_pin_flag';

const String sendOTPFlag = 'sending_otp_flag';
const String resendOTPFlag = 'resending_otp_flag';
const String verifyOTPFlag = 'verify_otp_flag';
const String requestResetPinText = 'request_reset_pin_flag';

// Congratulations page
const String setNickNameFlag = 'set_nickname_flag';

const String editInformationFlag = 'edit_information_flag';

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

const String verifyPINFlag = 'verify_pin_flag';

// Send Feedback page
const String sendFeedbackFlag = 'set_feedback_flag';
const String fetchClinicInformationFlag = 'fetch_clinic_information';

const String connectionFlag = 'connection_flag';

// communities
const String fetchInvitedCommunitiesFlag = 'fetch_invited_communities_flag';
const String fetchRecommendedCommunitiesFlag =
    'fetch_recommended_communities_flag';
const String addUserToCommunityFlag = 'add_user_community_flag';

const String fetchMembersFlag = 'fetch_members_flag';

// resume with pin
const String resumeWithPinFlag = 'resume_with_pin';

//pin reset service request
const String pinResetServiceRequestFlag = 'pin_reset_service_request_flag';

const String optOutFlag = 'opt_out_flag';
const String fetchAppointmentsFlag = 'fetch_appointments_flag';

//screening tools flags
const String fetchingViolenceQuestionsFlag = 'fetch_violence_questions_flags';
const String fetchingContraceptivesQuestionsFlag =
    'fetch_contraceptives_questions_flags';
const String fetchingTBQuestionsFlag = 'fetch_TB_questions_flags';
const String fetchingAlcoholQuestionsFlag = 'fetch_alcohol_questions_flags';
