// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as local_notifications;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/redux/actions/bookmark_content_action.dart';
import 'package:myafyahub/application/redux/actions/bottom_nav_action.dart';
import 'package:myafyahub/application/redux/actions/content/update_reactions_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_content_like_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_input_details_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/content/content_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/entities/core/screening_question.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/entities/core/user_profile_item_obj.dart';
import 'package:myafyahub/domain/core/entities/health_diary/mood_item_data.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_enums.dart';
import 'package:myafyahub/domain/core/entities/profile/caregiver_information.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart' as enums;
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_themes/spaces.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

AppSetupData getAppSetupData(AppContext context) {
  switch (context) {
    case AppContext.AppTest:
      return devAppSetupData;
    case AppContext.AppDemo:
      return demoAppSetupData;
    case AppContext.AppProd:
      return prodAppSetupData;
    case AppContext.AppE2E:
      return devAppSetupData;
    default:
      return devAppSetupData;
  }
}

String getDisplayName(User? user) {
  final String firstName = user?.firstName ?? UNKNOWN;
  String formattedFirstName = firstName.replaceAll(' ', '');

  if (formattedFirstName.isEmpty) {
    formattedFirstName = UNKNOWN;
  }

  final String lastName = user?.lastName ?? UNKNOWN;
  String formattedLastName = lastName.replaceAll(' ', '');

  if (formattedLastName.isEmpty) {
    formattedLastName = UNKNOWN;
  }

  return '$formattedFirstName $formattedLastName';
}

String? securityQuestionValidator(String? value) {
  if (value != null && (value.isEmpty || value == UNKNOWN)) {
    return 'A Response is required';
  }
  return null;
}

String formatSecurityQuestionDate(
  dynamic dateValue, {
  String? format = datePickerFormat,
}) {
  late String date;
  if (dateValue.toString().contains(' ')) {
    final String _d = dateValue.toString();
    date = DateFormat.yMMMMd('en_GB')
        .parseLoose(_d.replaceAll(',', ''))
        .toString();
  } else {
    date = dateValue.toString();
  }
  return DateFormat(format).format(DateTime.parse(date));
}

String sentenceCaseUserName({
  required String firstName,
  required String lastName,
}) {
  if (firstName.isNotEmpty && lastName.isNotEmpty) {
    if (firstName.length > 1 && lastName.length > 1) {
      return '${upperCaseFirstLetter(firstName)} ${upperCaseFirstLetter(lastName)}';
    }
    return '$firstName $lastName';
  }
  return '$firstName $lastName';
}

String upperCaseFirstLetter(String word) {
  return '${word.substring(0, 1).toUpperCase()}${word.substring(1).toLowerCase()}';
}

Future<dynamic> showFeedbackBottomSheet({
  required BuildContext context,
  required String modalContent,
  required String imageAssetPath,
}) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        key: feedbackBottomSheet,
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          constraints: const BoxConstraints(
            maxWidth: 420,
          ),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset(
                        imageAssetPath,
                        height: 34.0,
                        width: 34.0,
                      ),
                      mediumHorizontalSizedBox,
                      Flexible(
                        child: Text(
                          modalContent,
                          style: normalSize14Text(),
                        ),
                      ),
                    ],
                  ),
                ),
                smallHorizontalSizedBox,
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Image(
                      key: feedbackBottomSheetCloseIconKey,
                      image: AssetImage(closeIconUrl),
                      color: Colors.black54,
                      height: 16.0,
                      width: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Map<String, String> extractNextRefillDate(String loadedDate) {
  final DateTime parsedDate =
      DateTime?.tryParse(loadedDate)?.toLocal() ?? DateTime.now();
  final String postDay = DateFormat.d().format(parsedDate);
  final String postMonth = DateFormat.MMM().format(parsedDate);

  return <String, String>{
    'day': postDay,
    'month': postMonth,
  };
}

String getEnvironmentContext(List<AppContext> contexts) {
  if (contexts.contains(AppContext.AppProd)) {
    return 'prod';
  }
  if (contexts.contains(AppContext.AppDemo)) {
    return 'demo';
  }
  return 'test';
}

dynamic reportErrorToSentry(
  BuildContext? context,
  dynamic error, {
  dynamic stackTrace,
  String? hint,
}) {
  dynamic errorTrace = error;
  if (error.runtimeType == http.Response) {
    error as http.Response;
    errorTrace = <String, dynamic>{
      'request': error.request.toString(),
      'body': error.body,
      'statusCode': error.statusCode,
    };
  }
  if (context != null) {
    try {
      final AppState state = StoreProvider.state<AppState>(context)!;
      final Contact? contact = state.clientState?.user?.primaryContact;

      final bool isSignedIn = state.clientState?.isSignedIn ?? false;

      if (isSignedIn) {
        errorTrace = <String, dynamic>{
          'phoneNumber': contact?.value ?? UNKNOWN,
          'error': errorTrace,
        };
      }
    } catch (e) {
      errorTrace = error;
    }
  }
  Sentry.captureException(errorTrace, hint: hint);
}

final List<UserProfileItemObj> userProfileItems = <UserProfileItemObj>[
  UserProfileItemObj(
    iconAssetPath: profileIcon,
    route: AppRoutes.personalInfo,
    title: 'Personal information',
  ),
  UserProfileItemObj(
    iconAssetPath: clinicIcon,
    route: AppRoutes.clinicInformationPage,
    title: 'Clinic information',
  ),
  UserProfileItemObj(
    iconAssetPath: surveyItemImage,
    route: AppRoutes.surveysPage,
    title: 'Surveys',
  ),
  UserProfileItemObj(
    iconAssetPath: communityIconSvgPath,
    route: AppRoutes.groupInvitesPage,
    title: 'Conversations invites',
  ),
  UserProfileItemObj(
    iconAssetPath: mySavedIcon,
    route: AppRoutes.savedPosts,
    title: 'My saved content',
  ),
  UserProfileItemObj(
    iconAssetPath: faqsIcon,
    route: AppRoutes.profileFaqsPage,
    title: 'FAQs',
  ),
  UserProfileItemObj(
    iconAssetPath: helpCircleIcon,
    route: AppRoutes.consent,
    title: 'Consent',
  ),
  UserProfileItemObj(
    iconAssetPath: feedbackIcon,
    route: AppRoutes.feedbackPage,
    title: 'Feedback',
  ),
  UserProfileItemObj(
    iconAssetPath: settingsIcon,
    route: AppRoutes.settingsPage,
    title: 'Settings',
  ),
];

String tooManyTriesString(int timeLeft) {
  final DateFormat f = DateFormat('mm:ss');
  final String convertedTime =
      f.format(DateTime.fromMillisecondsSinceEpoch(timeLeft * 1000));

  return 'Too many tries, try again in $convertedTime minutes';
}

bool shouldInputPIN(BuildContext context) {
  final String? signedInTimeFromState =
      StoreProvider.state<AppState>(context)?.credentials?.signedInTime;

  final String lastUserSignInTime =
      signedInTimeFromState == UNKNOWN || signedInTimeFromState == null
          ? DateTime.now().toString()
          : signedInTimeFromState;

  final DateTime signedInTime = DateTime.parse(lastUserSignInTime);

  final String? pinInputTimeFromState =
      StoreProvider.state<AppState>(context)!.miscState!.healthPagePINInputTime;

  final String lastPINInputTime = pinInputTimeFromState ?? UNKNOWN;

  final int differenceFromSignIn =
      DateTime.now().difference(signedInTime).inMinutes;

  final int differenceFromLastInput = lastPINInputTime != UNKNOWN
      ? DateTime.now().difference(DateTime.parse(lastPINInputTime)).inMinutes
      : 0;

  return (differenceFromSignIn > 20 && lastPINInputTime == UNKNOWN) ||
      differenceFromLastInput > 20;
}

EditInformationItem getEditCareGiverInfo({
  required CaregiverInformation caregiverInformation,
}) {
  return EditInformationItem(
    title: myProfileCaregiverText,
    description: myProfileCaregiverDescriptionText,
    editInformationInputItem: <EditInformationInputItem>[
      EditInformationInputItem(
        fieldName: firstName,
        hintText: caregiverInformation.firstName ?? jane,
        inputType: EditInformationInputType.Text,
        inputController: TextEditingController(),
        apiFieldValue: 'firstName',
      ),
      EditInformationInputItem(
        fieldName: lastName,
        hintText: caregiverInformation.lastName ?? doe,
        inputType: EditInformationInputType.Text,
        inputController: TextEditingController(),
        apiFieldValue: 'lastName',
      ),
      EditInformationInputItem(
        fieldName: phoneNumber,
        hintText: caregiverInformation.phoneNumber ?? hotlineNumberString,
        inputType: EditInformationInputType.Text,
        inputController: TextEditingController(),
        apiFieldValue: 'phoneNumber',
      ),
      EditInformationInputItem(
        fieldName: relationText,
        hintText: relationText,
        inputType: EditInformationInputType.DropDown,
        inputController: TextEditingController(),
        dropdownValue: caregiverInformation.caregiverType!.name,
        dropDownOptionList: CaregiverType.values
            .map<String>((CaregiverType type) => type.name)
            .toList(),
        apiFieldValue: 'caregiverType',
      ),
    ],
  );
}

EditInformationInputItem nickNameInputItem(String userNickName) =>
    EditInformationInputItem(
      fieldName: nickNameFieldName,
      hintText: userNickName,
      inputType: EditInformationInputType.Text,
      inputController: TextEditingController(),
    );

EditInformationItem nickNameEditInfo(String userNickName) =>
    EditInformationItem(
      title: nickNameString,
      editInformationInputItem: <EditInformationInputItem>[
        nickNameInputItem(userNickName)
      ],
    );

CaregiverType caregiverTypeFromJson(String? caregiverTypeString) {
  if (caregiverTypeString == null || caregiverTypeString.isEmpty) {
    return CaregiverType.HEALTHCARE_PROFESSIONAL;
  }

  switch (caregiverTypeString.toUpperCase()) {
    case 'FATHER':
      return CaregiverType.FATHER;
    case 'MOTHER':
      return CaregiverType.MOTHER;
    case 'SIBLING':
      return CaregiverType.SIBLING;
    default:
      return CaregiverType.HEALTHCARE_PROFESSIONAL;
  }
}

String caregiverTypeToJson(CaregiverType? caregiverType) {
  switch (caregiverType) {
    case CaregiverType.FATHER:
      return 'FATHER';
    case CaregiverType.MOTHER:
      return 'MOTHER';
    case CaregiverType.SIBLING:
      return 'SIBLING';
    default:
      return 'HEALTHCARE_PROFESSIONAL';
  }
}

ObservationStatus observationStatusFromJson(String? observationStatusString) {
  if (observationStatusString == null || observationStatusString.isEmpty) {
    return ObservationStatus.Unknown;
  }

  return ObservationStatus.values.where((ObservationStatus observationStatus) {
    return observationStatus.name.toLowerCase() ==
        observationStatusString.replaceAll('-', ' ').toLowerCase();
  }).first;
}

MedicationStatusCodes medicationStatusCodesFromJson(
  String? medicationStatusString,
) {
  if (medicationStatusString == null || medicationStatusString.isEmpty) {
    return MedicationStatusCodes.unknown;
  }

  return MedicationStatusCodes.values.where((MedicationStatusCodes code) {
    return code.name.toLowerCase() ==
        medicationStatusString.replaceAll('-', ' ').toLowerCase();
  }).first;
}

void navigateToNewPage({
  required BuildContext context,
  required String route,
  int? bottomNavIndex,
}) {
  if (bottomNavIndex != null) {
    StoreProvider.dispatch<AppState>(
      context,
      BottomNavAction(currentBottomNavIndex: bottomNavIndex),
    );
  }
  Navigator.pushReplacementNamed(
    context,
    route,
  );
}

String returnCurrentYear() {
  final DateTime now = DateTime.now();
  return DateFormat('y').format(now);
}

Future<void> updateLikeStatus({
  required BuildContext context,
  required int contentID,
  required bool isLiked,
  bool updateLikeCount = false,
  required ContentDisplayedType contentDisplayedType,
}) async {
  StoreProvider.dispatch(
    context,
    UpdateReactionStatusAction(
      contentID: contentID,
      hasLiked: !isLiked,
      updateLikeCount: updateLikeCount,
      contentDisplayedType: contentDisplayedType,
    ),
  );

  await StoreProvider.dispatch(
    context,
    UpdateContentLikeStatusAction(
      contentID: contentID,
      context: context,
      isLiked: isLiked,
    ),
  );
}

Future<void> updateBookmarkStatus({
  required BuildContext context,
  required int contentID,
  required ContentDisplayedType contentDisplayedType,
}) async {
  //update save status locally
  StoreProvider.dispatch(
    context,
    UpdateReactionStatusAction(
      contentID: contentID,
      hasSaved: true,
      contentDisplayedType: contentDisplayedType,
    ),
  );

  await StoreProvider.dispatch(
    context,
    BookmarkContentAction(
      contentID: contentID,
      context: context,
    ),
  );
}

MoodItemData getMoodColor(String? mood) {
  if (mood == null) {
    return MoodItemData.initial();
  }

  switch (mood) {
    case veryHappyString:
      return MoodItemData(
        color: AppColors.greenHappyColor,
        svgIconUrl: excitedIconSvgPath,
      );
    case happyString:
      return MoodItemData(
        color: AppColors.greenHappyColor,
        svgIconUrl: happyIconSvgPath,
      );
    case neutralString:
      return MoodItemData(
        color: AppColors.mehMoodColor,
        svgIconUrl: mehIconSvgPath,
      );
    case sadString:
      return MoodItemData(
        color: AppColors.warningColor,
        svgIconUrl: sadIconSvgPath,
      );
    case verySadString:
      return MoodItemData(
        color: AppColors.verySadColor,
        svgIconUrl: verySadIconSvgPath,
      );
    default:
      return MoodItemData.initial();
  }
}

bool getHasLiked({
  required int contentID,
  required ContentDisplayedType contentDisplayedType,
  required ContentViewModel vm,
}) {
  final List<Content?> contentItems =
      getContentList(contentDisplayedType: contentDisplayedType, vm: vm);
  if (contentItems.isNotEmpty) {
    return contentItems
        .firstWhere(
          (Content? element) => element?.contentID == contentID,
          orElse: () => Content.initial(),
        )!
        .hasLiked!;
  }
  return false;
}

int getLikeCount({
  required int contentID,
  required ContentDisplayedType contentDisplayedType,
  required ContentViewModel vm,
}) {
  final List<Content?> contentItems =
      getContentList(contentDisplayedType: contentDisplayedType, vm: vm);

  if (contentItems.isNotEmpty) {
    return contentItems
            .firstWhere(
              (Content? element) => element?.contentID == contentID,
              orElse: () => Content.initial(),
            )!
            .likeCount ??
        0;
  }
  return 0;
}

bool getHasSaved({
  required int contentID,
  required ContentDisplayedType contentDisplayedType,
  required ContentViewModel vm,
}) {
  final List<Content?> contentItems =
      getContentList(contentDisplayedType: contentDisplayedType, vm: vm);
  if (contentItems.isNotEmpty) {
    return contentItems
        .firstWhere(
          (Content? element) => element?.contentID == contentID,
          orElse: () => Content.initial(),
        )!
        .hasSaved!;
  }
  return false;
}

List<Content?> getContentList({
  required ContentDisplayedType contentDisplayedType,
  required ContentViewModel vm,
}) {
  switch (contentDisplayedType) {
    case ContentDisplayedType.FEED:
      return vm.feedContentState?.contentItems ?? <Content?>[];
    case ContentDisplayedType.BOOKMARK:
      return vm.savedContentState?.savedContentItems ?? <Content?>[];

    case ContentDisplayedType.RECENT:
      return vm.recentContentState?.contentItems ?? <Content?>[];
    default:
      return <Content?>[];
  }
}

int getNewLikeCount({
  required bool? hasLiked,
  required int likeCount,
}) {
  if (hasLiked != null) {
    return hasLiked ? likeCount + 1 : likeCount - 1;
  }
  return likeCount;
}

void pinInputTimerStatus({required BuildContext context}) {
  bool resumeTimer;
  final String maxTryTime =
      StoreProvider.state<AppState>(context)?.miscState?.maxTryTime ?? '';

  if (maxTryTime.isNotEmpty && maxTryTime != UNKNOWN) {
    final DateTime? parsedMaxTryTime = DateTime.tryParse(maxTryTime);
    if (parsedMaxTryTime != null &&
        DateTime.now().difference(parsedMaxTryTime).inSeconds <
            startTimer - 2) {
      resumeTimer = true;
    } else {
      StoreProvider.dispatch(
        context,
        UpdatePINInputDetailsAction(
          maxTryTime: '',
          pinInputTries: 0,
        ),
      );
      resumeTimer = false;
    }
  } else {
    resumeTimer = false;
  }

  StoreProvider.dispatch(
    context,
    UpdatePINInputDetailsAction(resumeTimer: resumeTimer),
  );
}

const int startTimer = 300;

void showTextSnackbar(
  ScaffoldMessengerState scaffoldMessengerState, {
  required String content,
  SnackBarAction? action,
}) {
  scaffoldMessengerState
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: closeString,
          textColor: Colors.white,
          onPressed: () => scaffoldMessengerState.hideCurrentSnackBar(),
        ),
      ),
    );
}

bool allQuestionsAnswered(List<ScreeningQuestion>? questions) {
  if (questions != null) {
    for (final ScreeningQuestion question in questions) {
      if (question.answer == null) return false;
    }
    return true;
  }
  return false;
}

String getFeedBackTypeDescription(FeedBackType feedBackType) {
  switch (feedBackType) {
    case FeedBackType.GENERAL_FEEDBACK:
      return generalFeedBack;

    default:
      return servicesOffered;
  }
}

String getFeedBackValidationMessage({
  required FeedBackType feedBackType,
  required String feedBackText,
  required int selectedRating,
  String? searchString,
}) {
  final bool serviceEntered = searchString?.isEmpty ?? true;
  if (selectedRating == 0) {
    return 'Please select a rating';
  } else if (feedBackType == enums.FeedBackType.SERVICES_OFFERED &&
      serviceEntered) {
    return 'Please enter the name of service';
  } else {
    return 'Please share your thoughts';
  }
}

NotificationActionInfo getNotificationInfo(NotificationType notificationType) {
  switch (notificationType) {
    case NotificationType.COMMUNITIES:
      return NotificationActionInfo(
        actionTitle: 'View Conversations',
        route: AppRoutes.communityListPage,
      );
    case NotificationType.APPOINTMENT:
      return NotificationActionInfo(
        actionTitle: 'View Appointments',
        route: AppRoutes.appointmentsPage,
      );
    default:
      return NotificationActionInfo(actionTitle: null, route: null);
  }
}

Future<void> handleNotification(
  RemoteMessage message,
  stream.StreamChatClient chatClient,
) async {
  final Map<String, dynamic> data = message.data;

  if (data['type'] == 'message.new') {
    final local_notifications.FlutterLocalNotificationsPlugin
        flutterLocalNotificationsPlugin = await setupLocalNotifications();
    final String messageId = data['id'] as String;
    final stream.GetMessageResponse response =
        await chatClient.getMessage(messageId);

    final String? channelName = response.channel?.extraData['Name'] as String?;

    const local_notifications.NotificationDetails notificationDetails =
        local_notifications.NotificationDetails(
      android: local_notifications.AndroidNotificationDetails(
        'new_message',
        'New message notifications channel',
      ),
    );
    flutterLocalNotificationsPlugin.show(
      1,
      newChatMessageTitle(
        response.message.user?.name,
        channelName,
      ),
      response.message.text,
      notificationDetails,
    );
  }
}

Future<FlutterLocalNotificationsPlugin> setupLocalNotifications() async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  return flutterLocalNotificationsPlugin;
}

Future<void> logUserEvent({
  required String name,
  Map<String, dynamic>? parameters,
  required AppState? state,
  required AnalyticsEventType eventType,
}) async {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  final Map<String, dynamic> enrichedParams = <String, dynamic>{};

  // Get the user ID and their names
  final String? userID = state!.clientState!.user!.userId;
  final String? userNames = state.clientState!.user!.name;

  if (userID == UNKNOWN || userNames == UNKNOWN) {
    return;
  }

  enrichedParams.addAll(<String, dynamic>{
    'userID': userID,
    'userNames': userNames,
    'eventType': describeEnum(eventType),
  });

  if (parameters != null) {
    enrichedParams.addAll(parameters);
  }

  await analytics.logEvent(name: name, parameters: enrichedParams);
}

/// calculates someone's age from the date of birth
String calculateAge(String dateOfBirth) {
  if (dateOfBirth.isEmpty || dateOfBirth == UNKNOWN) {
    return 'No age recorded';
  }
  final DateTime parsedDate = DateTime.parse(dateOfBirth);

  return (DateTime.now().difference(parsedDate).inDays / 365)
      .round()
      .toString();
}
