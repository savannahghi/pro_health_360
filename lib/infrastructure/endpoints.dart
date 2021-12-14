/* GENERAL */
const String dGraphEndpoint =
    'https://nameless-brook-310185.eu-central-1.aws.cloud.dgraph.io/graphql';

/* 
TEST ENDPOINTS 

We are using staging endpoints here so as to match what the backend does.

The environment that these endpoints call is STRICTLY for internal DEVs only
*/
const String kTestGraphqlEndpoint =
    'https://mycarehub-staging.savannahghi.org/graphql';
const String kTestLoginByPhoneEndpoint =
    'https://mycarehub-staging.savannahghi.org/login_by_phone';
const String kTestPinResetEndpoint =
    'https://mycarehub-staging.savannahghi.org/request_pin_reset';
const String kTestUpdateUserPinEndpoint =
    'https://mycarehub-staging.savannahghi.org/reset_pin';
const String kTestVerifyPhoneEndpoint =
    'https://mycarehub-staging.savannahghi.org/verify_otp';
const String kTestCreateUserByPhoneEndpoint =
    'https://mycarehub-staging.savannahghi.org/create_user_by_phone';
const String kTestRetryResendOtpEndpoint =
    'https://mycarehub-staging.savannahghi.org/send_retry_otp';
const String kTestRefreshTokenEndpoint =
    'https://mycarehub-staging.savannahghi.org/refresh_token';
const String kTestAnonymousLoginEndpoint =
    'https://mycarehub-staging.savannahghi.org/login_anonymous';
const String kTestUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-staging.savannahghi.org/user_recovery_phonenumbers';
const String kTestSendRecoverAccountOtpEndpoint =
    'https://mycarehub-staging.savannahghi.org/send_otp';
const String kTestSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-staging.savannahghi.org/set_primary_phonenumber';
const String kTestUploadFileEndPoint =
    'https://engagement-staging.savannahghi.org/upload';

/* 
DEMO ENDPOINTS 

The endpoints here have the -test suffix because this is what will be used by the 
clients (for now)
*/
const String kDemoGraphqlEndpoint =
    'https://mycarehub-testing.savannahghi.org/graphql';
const String kDemoLoginByPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/login_by_phone';
const String kDemoPinResetEndpoint =
    'https://mycarehub-testing.savannahghi.org/request_pin_reset';
const String kDemoUpdateUserPinEndpoint =
    'https://mycarehub-testing.savannahghi.org/reset_pin';
const String kDemoVerifyPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/verify_otp';
const String kDemoCreateUserByPhoneEndpoint =
    'https://mycarehub-testing.savannahghi.org/create_user_by_phone';
const String kDemoRetryResendOtpEndpoint =
    'https://mycarehub-testing.savannahghi.org/send_retry_otp';
const String kDemoRefreshTokenEndpoint =
    'https://mycarehub-testing.savannahghi.org/refresh_token';
const String kDemoAnonymousLoginEndpoint =
    'https://mycarehub-testing.savannahghi.org/login_anonymous';
const String kDemoUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-testing.savannahghi.org/user_recovery_phonenumbers';
const String kDemoSendRecoverAccountOtpEndpoint =
    'https://mycarehub-testing.savannahghi.org/send_otp';
const String kDemoSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-testing.savannahghi.org/set_primary_phonenumber';
const String kDemoUploadFileEndPoint =
    'https://engagement-testing.savannahghi.org/upload';

/* PROD ENDPOINTS */
const String kProdGraphqlEndpoint = 'https://gateway.savannahghi.org/graphql';
const String kProdLoginByPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/login_by_phone';
const String kProdPinResetEndpoint =
    'https://mycarehub-prod.savannahghi.org/request_pin_reset';
const String kProdUpdateUserPinEndpoint =
    'https://mycarehub-prod.savannahghi.org/reset_pin';
const String kProdVerifyPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/verify_otp';
const String kProdCreateUserByPhoneEndpoint =
    'https://mycarehub-prod.savannahghi.org/create_user_by_phone';
const String kProdRetryResendOtpEndpoint =
    'https://mycarehub-prod.savannahghi.org/send_retry_otp';
const String kProdRefreshTokenEndpoint =
    'https://mycarehub-prod.savannahghi.org/refresh_token';
const String kProdAnonymousLoginEndpoint =
    'https://mycarehub-prod.savannahghi.org/login_anonymous';
const String kProdUserRecoveryPhoneNumbersEndpoint =
    'https://mycarehub-prod.savannahghi.org/user_recovery_phonenumbers';
const String kProdSendRecoverAccountOtpEndpoint =
    'https://mycarehub-prod.savannahghi.org/send_otp';
const String kProdSetPrimaryPhoneNumberEndpoint =
    'https://mycarehub-prod.savannahghi.org/set_primary_phonenumber';
const String kProdUploadFileEndPoint =
    'https://engagement-prod.savannahghi.org/upload';
