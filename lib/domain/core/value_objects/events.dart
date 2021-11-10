String hasLoggedInSuccessfullyEvent(String appContext) =>
    'consumer_logged_in_$appContext';

String hasFailedToLoggingEvent(String appContext) =>
    'consumer_failed_to_login_$appContext';

String hasSuccessfulRefreshTokenEvent(String appContext) =>
    'consumer_refresh_token_$appContext';

String hasFailedToRefreshTokenEvent(String appContext) =>
    'consumer_failed_to_refresh_token_$appContext';

String hasSuccessfullyVerifiedContactEvent(String appContext) =>
    'consumer_success_contact_veri_$appContext';

String hasFailedContactVerificationEvent(String appContext) =>
    'consumer_failed_contact_veri_$appContext';
