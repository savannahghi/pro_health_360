import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:quiver/core.dart';

class AppSetupData {
  final List<AppContext> appContexts;
  final String sentryDsn;
  final BaseContext? customContext;

  AppSetupData({
    required this.appContexts,
    required this.sentryDsn,
    this.customContext,
  });

  @override
  bool operator ==(Object o) =>
      o is AppSetupData &&
      listEquals(appContexts, o.appContexts) &&
      o.sentryDsn == this.sentryDsn;

  @override
  int get hashCode => hash2(hashObjects(appContexts), sentryDsn);
}

final AppSetupData devAppSetupData = AppSetupData(
  appContexts: testAppContexts,
  sentryDsn: FlutterConfig.get('DEV_SENTRY_DNS') as String,
  customContext: const BaseContext(
    anonymousLoginEndpoint: kTestAnonymousLoginEndpoint,
    graphqlEndpoint: kTestGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: kTestSetPrimaryPhoneNumberEndpoint,
    refreshTokenEndpoint: kTestRefreshTokenEndpoint,
    retryResendOtpEndpoint: kTestRetryResendOtpEndpoint,
    pinResetEndpoint: kTestPinResetEndpoint,
    userRecoveryPhoneNumbersEndpoint: kTestUserRecoveryPhoneNumbersEndpoint,
    verifyContactOTPEndpoint: kTestVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kTestVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: kTestSendContactVerificationOTPEndpoint,
    sendRecoverAccountOtpEndpoint: kTestSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kTestLoginByPhoneEndpoint,
    updateUserPinEndpoint: kTestUpdateUserPinEndpoint,
    uploadFileEndPoint: kTestUploadFileEndPoint,
    createUserByPhoneEndpoint: kTestCreateUserByPhoneEndpoint,
    switchFlaggedFeaturesEndpoint: '',
  ),
);

final AppSetupData prodAppSetupData = AppSetupData(
  appContexts: prodAppContexts,
  sentryDsn: FlutterConfig.get('PROD_SENTRY_DNS') as String,
  customContext: const BaseContext(
    anonymousLoginEndpoint: kProdAnonymousLoginEndpoint,
    graphqlEndpoint: kProdGraphqlEndpoint,
    setPrimaryPhoneNumberEndpoint: kProdSetPrimaryPhoneNumberEndpoint,
    refreshTokenEndpoint: kProdRefreshTokenEndpoint,
    retryResendOtpEndpoint: kProdRetryResendOtpEndpoint,
    pinResetEndpoint: kProdPinResetEndpoint,
    userRecoveryPhoneNumbersEndpoint: kProdUserRecoveryPhoneNumbersEndpoint,
    verifyContactOTPEndpoint: kProdVerifyContactOTPEndpoint,
    verifyPhoneEndpoint: kProdVerifyPhoneEndpoint,
    sendContactVerificationOTPEndpoint: kProdSendContactVerificationOTPEndpoint,
    sendRecoverAccountOtpEndpoint: kProdSendRecoverAccountOtpEndpoint,
    loginByPhoneEndpoint: kProdLoginByPhoneEndpoint,
    updateUserPinEndpoint: kProdUpdateUserPinEndpoint,
    uploadFileEndPoint: kProdUploadFileEndPoint,
    createUserByPhoneEndpoint: kProdCreateUserByPhoneEndpoint,
    switchFlaggedFeaturesEndpoint: '',
  ),
);
