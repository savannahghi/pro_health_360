// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:chewie/chewie.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/video_player_initializer.dart';
import 'package:myafyahub/application/redux/actions/bookmark_content_action.dart';
import 'package:myafyahub/application/redux/actions/bottom_nav_action.dart';
import 'package:myafyahub/application/redux/actions/content/update_reactions_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_content_like_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_input_details_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/client_profile_view_model.dart';
import 'package:myafyahub/application/redux/view_models/content/content_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/entities/core/screening_question.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/entities/core/user_profile_item_obj.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/health_diary/mood_item_data.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_enums.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_details.dart';
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
import 'package:video_player/video_player.dart';

Future<bool> onWillPopCallback() {
  return Future<bool>.value(false);
}

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

// Parses date then converts it to the format 18 May 2021 at 12:00 AM
Widget humanizeDate({
  required TextStyle dateTextStyle,
  required String loadedDate,
  bool showTime = false,
  bool showYear = true,
}) {
  if (loadedDate != UNKNOWN && loadedDate.isNotEmpty) {
    final DateTime parsedDate =
        DateTime.tryParse(loadedDate)?.toLocal() ?? DateTime.now();

    final String postDayTime = DateFormat.jm().format(parsedDate);
    final String postDay = DateFormat.d().format(parsedDate);
    final String postMonth = DateFormat.MMM().format(parsedDate);
    final String postYear = DateFormat.y().format(parsedDate);

    return Row(
      children: <Widget>[
        Text(
          '$postDay $postMonth ${showYear ? postYear : ''}${showTime ? ' at $postDayTime' : ''}',
          style: dateTextStyle,
        ),
      ],
    );
  }

  return const SizedBox();
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

final NotificationActions calendarAction = NotificationActions(
  icon: IconDetails(iconUrlSvgPath: calendarIcon),
  name: 'Add to Calendar',
  route: '',
);

List<NotificationDetails> notifications = <NotificationDetails>[
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultVideoNotificationIcon),
    description:
        'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join goog/meet.consult',
    date: formatSecurityQuestionDate(feedDate),
    actions: <NotificationActions>[calendarAction],
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultNotificationIcon),
    description:
        'You have a teleconsult with doctor Wellman. Click  Here to schedule the call ',
    date: formatSecurityQuestionDate(feedDate),
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: wellnessSurveyNotificationIcon),
    description: 'Wellness Survey',
    date: formatSecurityQuestionDate(feedDate),
  ),
];

String tooManyTriesString(int timeLeft) {
  final DateFormat f = DateFormat('mm:ss');
  final String convertedTime =
      f.format(DateTime.fromMillisecondsSinceEpoch(timeLeft * 1000));

  return 'Too may tries, try again in $convertedTime minutes';
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

final EditInformationInputItem phoneInputItem = EditInformationInputItem(
  fieldName: phoneNumber,
  hintText: hotlineNumberString,
  inputType: EditInformationInputType.Text,
  inputController: TextEditingController(),
  apiFieldValue: 'phoneNumber',
);

final EditInformationInputItem relationInputItem = EditInformationInputItem(
  fieldName: relationText,
  hintText: relationText,
  inputType: EditInformationInputType.DropDown,
  inputController: TextEditingController(),
  dropDownOptionList: CaregiverType.values
      .map<String>((CaregiverType type) => type.name)
      .toList(),
  apiFieldValue: 'caregiverType',
);

EditInformationItem careGiverEditInfo({
  required ClientProfileViewModel vm,
}) =>
    EditInformationItem(
      title: myProfileCaregiverText,
      description: myProfileCaregiverDescriptionText,
      editInformationInputItem: <EditInformationInputItem>[
        EditInformationInputItem(
          fieldName: firstName,
          hintText: vm.clientState?.careGiverInformation?.firstName ?? janeDoe,
          inputType: EditInformationInputType.Text,
          inputController: TextEditingController(),
          apiFieldValue: 'firstName',
        ),
        EditInformationInputItem(
          fieldName: lastName,
          hintText: vm.clientState?.careGiverInformation?.lastName ?? janeDoe,
          inputType: EditInformationInputType.Text,
          inputController: TextEditingController(),
          apiFieldValue: 'lastName',
        ),
        EditInformationInputItem(
          fieldName: phoneNumber,
          hintText: vm.clientState?.careGiverInformation?.phoneNumber ??
              hotlineNumberString,
          inputType: EditInformationInputType.Text,
          inputController: TextEditingController(),
          apiFieldValue: 'phoneNumber',
        ),
        EditInformationInputItem(
          fieldName: relationText,
          hintText: relationText,
          inputType: EditInformationInputType.DropDown,
          inputController: TextEditingController(),
          dropDownOptionList: CaregiverType.values
              .map<String>((CaregiverType type) => type.name)
              .toList(),
          apiFieldValue: 'caregiverType',
        ),
      ],
    );

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

Gender genderFromJson(String? genderString) {
  if (genderString == null || genderString.isEmpty || genderString == UNKNOWN) {
    return Gender.unknown;
  }
  return Gender.values.where((Gender gender) {
    return gender.name.toLowerCase() == genderString.toLowerCase();
  }).first;
}

String genderToJson(Gender? gender) {
  return gender?.name ?? Gender.unknown.name;
}

CaregiverType caregiverTypeFromJson(String? caregiverTypeString) {
  if (caregiverTypeString == null || caregiverTypeString.isEmpty) {
    return CaregiverType.Sibling;
  }

  return CaregiverType.values.where((CaregiverType caregiverType) {
    return caregiverType.name.toLowerCase() ==
        caregiverTypeString.toLowerCase();
  }).first;
}

String caregiverTypeToJson(CaregiverType? caregiverType) {
  return caregiverType?.name.toUpperCase() ??
      CaregiverType.Sibling.name.toUpperCase();
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
  required enums.ContentDisplayedType contentDisplayedType,
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
  required enums.ContentDisplayedType contentDisplayedType,
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

Future<ChewieController> initializeChewieController({
  required String dataSource,
}) {
  return VideoPlayerInitializer().initializePlayer(
    videoPlayerController: VideoPlayerController.network(dataSource),
    autoPlay: false,
  );
}

bool getHasLiked({
  required int contentID,
  required enums.ContentDisplayedType contentDisplayedType,
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
  required enums.ContentDisplayedType contentDisplayedType,
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
  required enums.ContentDisplayedType contentDisplayedType,
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
  required enums.ContentDisplayedType contentDisplayedType,
  required ContentViewModel vm,
}) {
  switch (contentDisplayedType) {
    case enums.ContentDisplayedType.FEED:
      return vm.feedContentState?.contentItems ?? <Content?>[];
    case enums.ContentDisplayedType.BOOKMARK:
      return vm.savedContentState?.savedContentItems ?? <Content?>[];

    case enums.ContentDisplayedType.RECENT:
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
    case FeedBackType.GENERAL:
      return generalFeedBack;

    default:
      return servicesOffered;
  }
}
