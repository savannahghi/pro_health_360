/// This file stores flags used in the app
///
/// flags are just unique strings used by async_redux to toggle loading for
/// some specific events. For more info on the implementation, take a look at
/// the [AppState] class

// feed flags
const String feedRefreshFlag = 'refresh_user_feed';
const String fetchUserFeedFlag = 'fetch_user_feed';

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

const String requestResetPinText = 'request_reset_pin';
