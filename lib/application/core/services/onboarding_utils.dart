// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dart_fcm/dart_fcm.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/refresh_token_manager.dart';
import 'package:misc_utilities/string_constant.dart';
import 'package:shared_themes/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/connectivity_helper.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/manage_token_action.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/core/event_obj.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/domain/core/value_objects/events.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/sil_progress_dialog.dart';
import 'package:myafyahub/presentation/router/routes.dart';

/// [updateUserPin] resets a user's PIN
///
/// - it makes an api call to the reset PIN endpoint to reset a user's PIN
/// - it basically changes a user's PIN to the entered one after OTP confirmation
Future<void> updateUserPin({
  required BuildContext context,
  required String pin,
  required String phoneNumber,
  required String otp,
}) async {
  final Map<String, String> _variables = <String, String>{
    'phoneNumber': phoneNumber,
    'OTP': otp,
    'PIN': pin,
  };

  final IGraphQlClient _httpClient = AppWrapperBase.of(context)!.graphQLClient;

  final String endPoint =
      AppWrapperBase.of(context)!.customContext!.updateUserPinEndpoint;

  final http.Response response = await _httpClient.callRESTAPI(
      endpoint: endPoint, variables: _variables, method: httpPOST);

  final dynamic body = json.decode(response.body);

  if (body != null && body == true) {
    Navigator.pushReplacementNamed(context, BWRoutes.phoneLogin);

    showFeedbackBottomSheet(
      context: context,
      modalContent: pinUpdateSuccess,
      imageAssetPath: infoIconUrl,
    );
  } else {
    reportErrorToSentry(context, response, hint: 'Error updating pin');
    await showFeedbackBottomSheet(
      context: context,
      modalContent: UserFeedBackTexts.getErrorMessage(),
      imageAssetPath: infoIconUrl,
    );
  }
}

Future<ProcessedResponse> requestForANewToken({
  required List<AppContext> thisAppContexts,
  required String refreshToken,
  required BuildContext context,
}) async {
  final IGraphQlClient _httpClient = AppWrapperBase.of(context)!.graphQLClient;
  final String refreshTokenEndpoint =
      AppWrapperBase.of(context)!.customContext!.refreshTokenEndpoint;

  final Map<String, dynamic> refreshTokenVariables = <String, dynamic>{
    'refreshToken': refreshToken,
    'appVersion': APPVERSION,
  };

  return processHttpResponse(
      await _httpClient.callRESTAPI(
          endpoint: refreshTokenEndpoint,
          method: 'POST',
          variables: refreshTokenVariables),
      context);
}

Future<bool> updateStateAuth({
  required ProcessedResponse processedResponse,
  required BuildContext context,
}) async {
  /// the response is passed to a variable of type `http.Response`
  final http.Response okResponse = processedResponse.response;

  final Map<String, dynamic> body =
      json.decode(okResponse.body) as Map<String, dynamic>;

  final AuthCredentialResponse auth = AuthCredentialResponse.fromJson(body);

  final AppState? state = StoreProvider.state<AppState>(context);
  final String appContext =
      getEnvironmentContext(AppWrapperBase.of(context)!.appContexts);

  if (auth.idToken != null &&
      auth.refreshToken != null &&
      auth.expiresIn != null) {
    publishEvent(
      hasSuccessfulRefreshTokenEvent(appContext),
      EventObject(
          firstName: state!
              .userProfileState!.userProfile!.userBioData!.firstName!
              .getValue(),
          lastName: state.userProfileState!.userProfile!.userBioData!.lastName!
              .getValue(),
          primaryPhoneNumber: state
              .userProfileState!.userProfile!.primaryPhoneNumber!
              .getValue(),
          uid: state.userProfileState!.auth!.uid,
          flavour: Flavour.CONSUMER.name,
          timestamp: DateTime.now(),
          appVersion: APPVERSION),
    );

    await StoreProvider.dispatch<AppState>(
      context,
      ManageTokenAction(
        refreshToken: auth.refreshToken!,
        idToken: auth.idToken!,
        context: context,
        refreshTokenManger: RefreshTokenManger(),
        canExperiment: auth.canExperiment,
        parsedExpiresAt:
            DateTimeParser().parsedExpireAt(int.parse(auth.expiresIn!)),
      ),
    );
    return true;
  } else {
    reportErrorToSentry(context, okResponse,
        hint: 'Error failed to refresh token');

    /// we failed to refresh the token so require the user to login
    publishEvent(
      hasFailedToRefreshTokenEvent(appContext),
      EventObject(
          firstName: state!
              .userProfileState!.userProfile!.userBioData!.firstName!
              .getValue(),
          lastName: state.userProfileState!.userProfile!.userBioData!.lastName!
              .getValue(),
          primaryPhoneNumber: state
              .userProfileState!.userProfile!.primaryPhoneNumber!
              .getValue(),
          uid: state.userProfileState!.auth!.uid,
          flavour: Flavour.CONSUMER.name,
          timestamp: DateTime.now(),
          appVersion: APPVERSION),
    );
    return false;
  }
}

/// [checkTokenStatus] is used to check if the Auth Token has expired and if it need refreshing
///
/// #### [checkTokenStatus] Variables
/// [context] requires context of widget where it is used.
///
/// [authState] abstract class that hold the values of user signedIn Status.
///
/// - authToken (value of the current active Auth token)
/// - refreshToken (value of the refresh token) and
/// - expiresAt (time the token expires).
/// [thisAppContexts] app requires to know which appContext is in use to determine what endpoint to use.
///
/// [customHttpClient] our custom http client that we use to make network requests to our backend services mainly.

Future<AuthTokenStatus> checkTokenStatus({
  required BuildContext context,
  required UserProfileState profileState,
  required List<AppContext> thisAppContexts,
}) async {
  final DateTime now = DateTime.now();

  final DateTime expiresAt = DateTime.parse(profileState.auth!.expiresIn!);

  /// first check if token has expired
  if (expiresAt.difference(now).inMinutes < 50 &&
      expiresAt.difference(now).inSeconds > 0) {
    return AuthTokenStatus.okay;
  }

  /// since it's expired, we check if 72 hours has elapsed since the token was issued
  if (now.difference(expiresAt).inHours < 72) {
    final ProcessedResponse processedResponse = await requestForANewToken(
      context: context,
      thisAppContexts: thisAppContexts,
      refreshToken: profileState.auth!.refreshToken!,
    );

    /// check if the response from the network call returns `ok`
    ///  set by the backend to mean user credentials matched
    if (processedResponse.ok) {
      if (await updateStateAuth(
          context: context, processedResponse: processedResponse)) {
        return AuthTokenStatus.requiresPin;
      } else {
        /// we failed to refresh the token so require the user to login
        return AuthTokenStatus.requiresLogin;
      }
    }
  }

  /// token is expired and 72 hours have elapsed since last refresh
  /// so require the user to log in.
  return AuthTokenStatus.requiresLogin;
}

// determines the path to route the user to based on the app state
Map<String, dynamic> onboardingPath(AppState state,
    {bool calledOnResume = false}) {
  final BioData bioData = state.userProfileState!.userProfile!.userBioData!;

  if (bioData.firstName?.getValue() == UNKNOWN ||
      bioData.lastName?.getValue() == UNKNOWN ||
      bioData.dateOfBirth == UNKNOWN) {
    /// take the user to basic details if any of the above checks fail
    return <String, dynamic>{'route': BWRoutes.basicDetails, 'args': null};
  } else {
    /// take the user to the homepage if they have passed
    /// the normal user profile checks
    return <String, dynamic>{'route': BWRoutes.home, 'args': null};
  }
}

Future<void> registerDeviceToken({required IGraphQlClient client}) async {
  final Map<String, dynamic> _variables = <String, dynamic>{
    'token': await SILFCM().getDeviceToken()
  };

  await client.query(registerDeviceTokenQuery, _variables);
}

/// [getInitialRoute] routine is used to determine what should be the
/// first Page(route) a user should see on launching the application.
/// The selection of the Page(route) to show is determined by if the user
/// is already signed in/logged in or not.
///
/// 1. Signed in/ logged in user
///     - If a user is signed in/ logged in the
/// [OnboardingUtils.checkTokenStatus] routine goes on to check if a user has
/// a valid AuthToken.
///     - When the [OnboardingUtils.checkTokenStatus] routine returns
/// a `true` value then the user is redirected to the [Home Page].
///     - When the [OnboardingUtils.checkTokenStatus] routine returns
/// a `false` value then the user is redirected to the
/// [Resume with PIN Page ]to allow for renew of their AuthToken.
///
/// 2. User is NOT Signed in/ logged in
///     - If a user is not signed in/logged in the routine checks if they
/// have completed the onboarding tour to determine which page user
/// should be redirected.
///     - If the user had completed the Onboarding tour they are
/// directed to the [Lading Page] where there are options to
/// Login(for an existing user)/Sign Up(for a new user).
///     - If the user had `NOT` completed the Onboarding tour
///  they are directed to the Welcome page where they can browse through the
///  tour, which upon completion they are redirected to the [Lading Page]
///
/// #### Routes and corresponding pages
/// - [Routes.home] ---> home_page.dart
/// - [Routes.welcome] ---> welcome.dart
/// - [Routes.landing] ---> landing_page.dart
/// - [Routes.resumeWithPin] ---> resume_with_pin_page.dart
/// - [Routes.phoneLogin] ---> phone_number_login_page.dart
Future<String> getInitialRoute(
  BuildContext context,
  AppState appState,
  List<AppContext> thisAppContexts,
) async {
  if (appState.miscState!.appReviewObj != null &&
      appState.miscState!.appReviewObj!.shouldRateApp != null) {
    updateAppReviewVariables(
      context: context,
      days: appState.miscState!.appReviewObj!.days!,
      lastLaunchDate: appState.miscState!.appReviewObj!.lastLaunchDate!,
      launches: appState.miscState!.appReviewObj!.launches!,
    );
  }
  if (appState.userProfileState!.isSignedIn!) {
    final AuthTokenStatus checkTokenStatusResult = await checkTokenStatus(
      context: context,
      profileState: appState.userProfileState!,
      thisAppContexts: thisAppContexts,
    );
    switch (checkTokenStatusResult) {
      case AuthTokenStatus.requiresLogin:
        return BWRoutes.phoneLogin;
      case AuthTokenStatus.requiresPin:
        return BWRoutes.resumeWithPin;
      default:
    }

    final Map<String, dynamic> pathConfig =
        onboardingPath(appState, calledOnResume: true);
    if (pathConfig['route'] == BWRoutes.setPin) {
      return BWRoutes.setPin;
    }

    final String parsedExpiresAt =
        DateTime.parse(appState.userProfileState!.auth!.expiresIn!)
            .toIso8601String();

    RefreshTokenManger().updateExpireTime(parsedExpiresAt).reset();
    return Future<String>.value(pathConfig['route'].toString());
  } else {
    if (appState.userProfileState!.isFirstLaunch ?? false) {
      StoreProvider.dispatch<AppState>(
        context,
        UpdateUserProfileAction(
          isFirstLaunch: false,
        ),
      );
      return BWRoutes.introduction;
    }
    return BWRoutes.landing;
  }
}

/// [processHttpResponse] routine is used to process a network call response, for errors, bad requests, timeouts and correct responses.
///
/// errors are further processed using our own custom error codes to determine if it an error within our error codes
ProcessedResponse processHttpResponse(http.Response response,
    [BuildContext? context]) {
  if (<int>[200, 201, 202].contains(response.statusCode)) {
    return ProcessedResponse(ok: true, response: response);
  }

  reportErrorToSentry(context, response, hint: '${response.statusCode}');

  if (response.statusCode == 400) {
    final Map<String, dynamic> body =
        json.decode(response.body) as Map<String, dynamic>;
    if (body['code'] == 4 && context != null) {
      StoreProvider.dispatch(
          context, PhoneSignUpStateAction(accountExists: true));
    }
    if ((body['code'] == 7 || body['code'] == 10) && context != null) {
      throw SILException(
          error: body, cause: noUserFound, message: getUserPhoneNumbersMessage);
    }

    if (body['code'] == 8 && context != null) {
      StoreProvider.dispatch(
        context,
        PhoneLoginStateAction(invalidCredentials: true),
      );
    }

    return ProcessedResponse(
        ok: false,
        response: response,
        message: getUserFriendlyMsg(body['code'] as int));
  }
  if (response.statusCode == 500) {
    final int code = json.decode(response.body)['code'] != null
        ? json.decode(response.body)['code'] as int
        : 11;

    return ProcessedResponse(
        ok: false, response: response, message: getUserFriendlyMsg(code));
  }
  if (response.statusCode == 408) {
    return ProcessedResponse(
        ok: true, response: response, message: getUserFriendlyMsg(0));
  }
  return ProcessedResponse(
      ok: false,
      response: response,
      message: UserFeedBackTexts.getErrorMessage());
}

String getUserFriendlyMsg(int code) {
  switch (code) {
    case 0:
      return slowInternet;
    case 4:
      return userWithThatPhoneExists;
    case 5:
      return userWithThatEmailExists;
    case 6:
      return usernameExists;
    case 7:
    case 10:
      return userNotFound;
    case 8:
      return wrongLoginCredentials;
    case 9:
      return pinNotFound;
    case 2:
    case 3:
    case 11:
    default:
      return defaultUserFriendlyMessage;
  }
}

void toggleLoadingIndicator({
  required BuildContext context,
  required String? flag,
  bool show = true,
}) {
  if (flag != null) {
    show
        ? StoreProvider.dispatch(
            context,
            WaitAction<AppState>.add(
              flag,
              ref: '${flag}_ref',
            ),
          )
        : StoreProvider.dispatch(
            context,
            WaitAction<AppState>.remove(
              flag,
              ref: '${flag}_ref',
            ),
          );
  }
}

Widget showSaveProfileDetailsSILProgressDialog(BuildContext context) {
  return const SILProgressDialog(message: Text(updatingProfileDetails));
}

Future<void> saveProfileDetails({
  required Map<String, String> variables,
  required String checkGender,
  required String checkDisplayName,
  required BuildContext context,
}) async {
  /// show progress indicator
  showDialog(
    context: context,
    builder: showSaveProfileDetailsSILProgressDialog,
  );

  if (variables['gender'] == null) {
    variables['gender'] = checkGender;
  }

  final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
  final http.Response result = await _client
      .query(updateUserProfileMutation, <String, dynamic>{'input': variables});

  final Map<String, dynamic> body = _client.toMap(result);
  hideProgressDialog(context);

  //check first for errors
  if (_client.parseError(body) != null) {
    reportErrorToSentry(context, result,
        hint: 'Failed to save profile details');
    ScaffoldMessenger.of(context)
        .showSnackBar(snackbar(content: UserFeedBackTexts.getErrorMessage()));
    return;
  }

  if (body['data'] != null) {
    await StoreProvider.dispatch<AppState>(
      context,
      UpdateUserProfileAction(
        userBioData: BioData(
          firstName: Name.withValue(
            variables['firstName']!,
          ),
          dateOfBirth: variables['dateOfBirth'],
          lastName: Name.withValue(variables['lastName']!),
          gender: genderFromString(variables['gender']!),
        ),
      ),
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(snackbar(content: profileUpdated));

    await Future<void>.delayed(const Duration(seconds: 1));

    Navigator.pop(context);

    return;
  }
  ScaffoldMessenger.of(context)
      .showSnackBar(snackbar(content: UserFeedBackTexts.getErrorMessage()));
}

Object actionWrapError(
    {required dynamic error, required BuildContext context}) async {
  if (error.runtimeType == SILException) {
    if (error.cause.contains('no_user_account_found') == true) {
      genericBottomSheet(
        context: context,
        message: noUserFoundString,
        isError: true,
        primaryActionCallback: () =>
            Navigator.pushReplacementNamed(context, BWRoutes.phoneLogin),
        primaryActionText: createAccountButtonText,
        buttonColor: AppColors.primaryColor,
      );
      return error;
    }
    genericBottomSheet(
      context: context,
      message: error.message as String,
      isError: true,
      primaryActionCallback: () =>
          Navigator.pushReplacementNamed(context, BWRoutes.phoneLogin),
      primaryActionText: continueToLoginButtonText,
      secondaryActionCallback: () => Navigator.of(context).pop(),
      secondaryActionText: retryButtonText,
      buttonColor: AppColors.primaryColor,
    );
    return error;
  }
  showFeedbackBottomSheet(
    context: context,
    modalContent: UserFeedBackTexts.getErrorMessage(),
    imageAssetPath: errorIconUrl,
  );
  return error;
}

/// [afterLoginOrCreateAccount] is called after create account or login response has been received.
/// Since the working is the same,makes sense to have only one point to preprocess the response.
/// The only difference is in the final step where for [login] the user is navigated to a suitable page
/// depending on their onboarding path while for [createAccount] the used to navigated direct to basic details page.
Future<dynamic> afterLoginOrCreateAccount(
    {required ProcessedResponse processedResponse,
    required Store<AppState> store,
    required BuildContext context,
    required OnboardActionType onboardActionType,
    required DateTimeParser dateTimeParser,
    required RefreshTokenManger refreshTokenManger,
    required IGraphQlClient graphQlClient}) async {
  try {
    final http.Response jsonResponse = processedResponse.response;
    final Map<String, dynamic> response =
        json.decode(jsonResponse.body) as Map<String, dynamic>;

    final UserResponse userResponse = UserResponse.fromJson(response);

    final UserProfile? userProfile = userResponse.profile;

    // customer profile
    final Customer? customerProfile = userResponse.customerProfile;

    final CommunicationSettings? commSettings =
        userResponse.communicationSettings;

    final AuthCredentialResponse auth = userResponse.auth!;
    final String appContext =
        getEnvironmentContext(AppWrapperBase.of(context)!.appContexts);

    await store.dispatch(
      ManageTokenAction(
        context: context,
        refreshToken: auth.refreshToken!,
        idToken: auth.idToken!,
        parsedExpiresAt:
            dateTimeParser.parsedExpireAt(int.parse(auth.expiresIn!)),
        refreshTokenManger: refreshTokenManger,
        canExperiment: auth.canExperiment,
      ),
    );

    // dispatch an action to update the user profile

    await store.dispatch(
      UpdateUserProfileAction(
        profile: userProfile,
        communicationSettings: commSettings,
        userBioData: userProfile?.userBioData,
        customerProfile: customerProfile,
      ),
    );

    final AppState updatedState = store.state;

    await store.dispatch(
      AuthStatusAction(
        signedIn: true,
        uid: auth.uid,
        signedInTime: DateTime.now().toIso8601String(),
        isChangePin: auth.isChangePin,
      ),
    );

    if (onboardActionType == OnboardActionType.createAccount) {
      /// explicitly call to hide in case the user navigate back
      toggleLoadingIndicator(
          context: context, flag: createPinFlag, show: false);

      await store.dispatch(PhoneSignUpStateAction(accountCreated: true));

      publishEvent(
        hasSignedUpSuccessFullyEvent(appContext),
        EventObject(
          firstName: userProfile!.userBioData!.firstName?.getValue(),
          lastName: userProfile.userBioData!.lastName?.getValue(),
          uid: auth.uid,
          primaryPhoneNumber: userProfile.primaryPhoneNumber?.getValue(),
          flavour: Flavour.CONSUMER.name,
          timestamp: DateTime.now(),
        ),
      );

      await Navigator.pushNamedAndRemoveUntil(
          context, BWRoutes.basicDetails, (Route<dynamic> route) => false);
      return;
    }

    if (onboardActionType == OnboardActionType.login) {
      /// navigation to home page happens here
      final Map<String, dynamic> routeContext = onboardingPath(updatedState);
      final String appContext =
          getEnvironmentContext(AppWrapperBase.of(context)!.appContexts);

      publishEvent(
        hasLoggedInSuccessfullyEvent(appContext),
        EventObject(
          firstName: userProfile!.userBioData!.firstName?.getValue(),
          lastName: userProfile.userBioData!.lastName?.getValue(),
          uid: auth.uid,
          primaryPhoneNumber: userProfile.primaryPhoneNumber?.getValue(),
          flavour: Flavour.CONSUMER.name,
          timestamp: DateTime.now(),
        ),
      );

      // call register device token here but don't wait for it
      registerDeviceToken(client: AppWrapperBase.of(context)!.graphQLClient);

      final DeepLinkSubject deepLink = DeepLinkSubject();
      if (deepLink.hasLink.value) {
        deepLink.hasLink.add(false);
        Navigator.pushNamedAndRemoveUntil(
            context, deepLink.link.value, (Route<dynamic> route) => false);
        return;
      }

      if (userResponse.auth?.isChangePin != null &&
          userResponse.auth!.isChangePin!) {
        StoreProvider.dispatch(
          context,
          UpdatePinStatusAction(
            isChangingPin: true,
          ),
        );
        await Navigator.pushReplacementNamed(context, BWRoutes.createPin,
            arguments: <String, bool>{
              'changingPin': true,
            });
      } else {
        await Navigator.pushNamedAndRemoveUntil(context,
            routeContext['route'].toString(), (Route<dynamic> route) => false,
            arguments: routeContext['args']);
      }
      return;
    }
  } catch (e, stackTrace) {
    final AppState? state = StoreProvider.state<AppState>(context);
    final String appContext =
        getEnvironmentContext(AppWrapperBase.of(context)!.appContexts);

    if (onboardActionType == OnboardActionType.login) {
      reportErrorToSentry(context, e,
          stackTrace: stackTrace, hint: 'Error logging in');
      publishEvent(
        hasFailedToLoggingEvent(appContext),
        EventObject(
          firstName: state!
              .userProfileState!.userProfile!.userBioData!.firstName!
              .getValue(),
          lastName: state.userProfileState!.userProfile!.userBioData!.lastName!
              .getValue(),
          uid: state.userProfileState!.auth!.uid,
          flavour: Flavour.CONSUMER.name,
          timestamp: DateTime.now(),
        ),
      );
    }

    if (onboardActionType == OnboardActionType.createAccount) {
      reportErrorToSentry(context, e,
          stackTrace: stackTrace, hint: 'Error signing up');
      publishEvent(
        hasFailedToSignupEvent(appContext),
        EventObject(
          firstName: state!
              .userProfileState!.userProfile!.userBioData!.firstName!
              .getValue(),
          lastName: state.userProfileState!.userProfile!.userBioData!.lastName!
              .getValue(),
          uid: state.userProfileState!.auth!.uid,
          primaryPhoneNumber: state
              .userProfileState!.userProfile!.primaryPhoneNumber!
              .getValue(),
          flavour: Flavour.CONSUMER.name,
          timestamp: DateTime.now(),
        ),
      );
    }

    // consider this a transaction rollback. if an exception is thrown, we set the user as not logged in otherwise
    // they will be considered as logged in if app is restart or hot-reloaded during development
    await store.dispatch(
      AuthStatusAction(
        signedIn: false,
        refreshToken: UNKNOWN,
        idToken: UNKNOWN,
        signedInTime: DateTime.now().toIso8601String(),
      ),
    );

    // tell the user that something went wrong
    showFeedbackBottomSheet(
      context: context,
      modalContent: UserFeedBackTexts.getErrorMessage(),
      imageAssetPath: errorIconUrl,
    );
  }
}

Function checkWaitingForFunc(BuildContext context) {
  return ({required String flag}) {
    return StoreProvider.state<AppState>(context)!.wait!.isWaitingFor(flag);
  };
}

void clearAllFlags(BuildContext context) {
  SchedulerBinding.instance!.addPostFrameCallback((_) {
    StoreProvider.dispatch(
      context,
      WaitAction<AppState>.clear(),
    );
  });
}

void callSupport() {
  launch(silPhoneNumber);
}

void chatOnWhatsApp() {
  launchWhatsApp(
    message: '',
    phone: kWhatsAppNumber,
    launch: launch(
      whatsAppUrl(
        phone: kWhatsAppNumber,
        message: '',
      ),
    ),
  );
}

void listenForConnectivityChanges(ConnectivityResult result) {
  if (result == ConnectivityResult.none) {
    InternetConnectivitySubject().connectivitySubject.add(false);
  } else {
    InternetConnectivitySubject().connectivitySubject.add(true);
  }
}

void refreshTokenAndUpdateState({
  required bool value,
  required bool signedIn,
  required BuildContext context,
  required List<AppContext> appContexts,
  required String refreshToken,
}) {
  if (value) {
    // check if user is logged in
    if (signedIn) {
      // request for a new token
      requestForANewToken(
        context: context,
        thisAppContexts: appContexts,
        refreshToken: refreshToken,
      ).then((ProcessedResponse response) {
        //check if the request was successful
        if (response.ok) {
          // update state with the new token
          updateStateAuth(context: context, processedResponse: response);
        }
      });
    }
  }
}
