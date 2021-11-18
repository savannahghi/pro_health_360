// Dart imports:
import 'dart:async';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/number_constants.dart';

// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/redux/actions/health_page_pin_input_action.dart';
import 'package:myafyahub/application/redux/actions/logout_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/entities/core/icon_details.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_actions.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_details.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/auth.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/infrastructure/endpoints.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:unicons/unicons.dart';
import 'package:myafyahub/domain/core/entities/core/user_profile_item_obj.dart';

Future<bool> onWillPopCallback() {
  return Future<bool>.value(false);
}

Gender genderFromString(String g) {
  if (g.toLowerCase() == Gender.male.name.toLowerCase()) {
    return Gender.male;
  }
  if (g.toLowerCase() == Gender.female.name.toLowerCase()) {
    return Gender.female;
  }

  return Gender.unknown;
}

AppSetupData getAppSetupData(AppContext context) {
  switch (context) {
    case AppContext.AppTest:
      return devAppSetupData;
    case AppContext.AppDemo:
      return devAppSetupData;
    case AppContext.AppProd:
      return prodAppSetupData;
    case AppContext.AppE2E:
      return devAppSetupData;
    default:
      return devAppSetupData;
  }
}

Function() logoutUser({required BuildContext context}) {
  return () async {
    StoreProvider.dispatch(
      context,
      LogoutAction(
        navigationCallback: () async {
          await Navigator.of(context).pushNamedAndRemoveUntil(
            BWRoutes.phoneLogin,
            (Route<dynamic> route) => false,
          );
        },
        context: context,
      ),
    );
  };
}

String getDisplayName(User? user) {
  final String firstName = user?.firstName ?? UNKNOWN;
  final String formattedFirstName = firstName.replaceAll(' ', '');

  final String lastName = user?.lastName ?? UNKNOWN;
  final String formattedLastName = lastName.replaceAll(' ', '');

  return '$formattedFirstName $formattedLastName';
}

/// [showToast] show a toast on the app
void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: AppColors.primaryColor.withOpacity(0.5),
    textColor: AppColors.whiteColor,
    fontSize: 16.0,
  );
}

String? userPinValidator(dynamic val) {
  final String value = val as String;
  if (value.isEmpty) {
    return 'A PIN is required';
  }
  if (!RegExp(r'^-?[0-9]+$').hasMatch(value)) {
    return 'Only digits are allowed, 0-9';
  }
  if (value.length < 4) {
    return 'Enter a four digit PIN';
  }
  return null;
}

void genericBottomSheet({
  required BuildContext context,
  required String message,
  required bool isError,
  bool showSecondaryButton = false,
  Color? buttonColor,
  Color? borderColor,
  EdgeInsets? customPadding,

  // used in the primary action button
  String? primaryActionText,
  Function? primaryActionCallback,

  // used in the primary action button
  String? secondaryActionText,
  Function? secondaryActionCallback,

  // used in the third action button
  String? tertiaryActionText,
  Function? tertiaryActionCallback,
}) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext bc) {
      return Container(
        key: bottomSheetKey,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: ListView(
          key: genericBottomSheetWidgetKey,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shrinkWrap: true,
          children: <Widget>[
            mediumVerticalSizedBox,
            Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 24.0,
                  backgroundColor:
                      isError ? AppColors.redColor : AppColors.greenColor,
                  child: Icon(
                    isError ? UniconsLine.times : UniconsLine.check,
                    size: 36.0,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
                mediumVerticalSizedBox,
                Padding(
                  padding: veryLargeHorizontalPadding,
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextThemes.normalSize18Text(
                      AppColors.blackColor,
                    ),
                  ),
                ),
                largeVerticalSizedBox,
                if (primaryActionCallback != null)
                  Container(
                    padding: veryLargeHorizontalPadding,
                    height: 52,
                    width: double.infinity,
                    child: SILPrimaryButton(
                      buttonColor: buttonColor,
                      borderColor: borderColor,
                      customPadding: customPadding,
                      buttonKey: primaryBottomSheetButtonKey,
                      text: primaryActionText,
                      textColor: AppColors.whiteColor,
                      onPressed: () {
                        primaryActionCallback();
                      },
                    ),
                  ),
                smallVerticalSizedBox,
                if (showSecondaryButton || secondaryActionCallback != null)
                  Container(
                    padding: veryLargeHorizontalPadding,
                    width: double.infinity,
                    child: SILNoBorderButton(
                      buttonKey: secondaryBottomSheetButtonKey,
                      text: secondaryActionText ?? 'Close',
                      textColor: buttonColor ??
                          Theme.of(context).colorScheme.secondary,
                      onPressed: secondaryActionCallback ??
                          () {
                            Navigator.pop(context);
                          },
                    ),
                  ),
                smallVerticalSizedBox,
                if (tertiaryActionCallback != null)
                  Container(
                    padding: veryLargeHorizontalPadding,
                    width: double.infinity,
                    child: SILNoBorderButton(
                      buttonKey: tertiaryBottomSheetButtonKey,
                      text: tertiaryActionText ?? 'Complete',
                      textColor: AppColors.whiteColor,
                      onPressed: tertiaryActionCallback,
                    ),
                  ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

/// [preferredPaddingOnStretchedScreens] function is used to calculate give a
/// constant size in width of the items to be displayed on the screen
/// First it gets the width of the device
/// Subtracts `420` which is a one size fit all constant for widgets on a
///  stretched view/display
/// The difference is then divided by `2` to get the size that will be feed to
/// our padding so that the widgets take up a width of `420`
double preferredPaddingOnStretchedScreens({required BuildContext context}) {
  final double deviceWidth = MediaQuery.of(context).size.width;
  if (deviceWidth >= number420) {
    final double paddingSize = (deviceWidth - number420) / number2;

    if (paddingSize <= number15) {
      return number15;
    }
    return paddingSize;
  } else {
    return number15;
  }
}

String sentenceCaseUserName({
  required String firstName,
  required String lastName,
}) {
  if (firstName.isNotEmpty && lastName.isNotEmpty) {
    if (firstName.length > 1 && lastName.length > 1) {
      return '${firstName[0].toUpperCase()}${firstName.substring(1)} ${lastName[0].toUpperCase()}${lastName.substring(1)}';
    }
    return '$firstName $lastName';
  }
  return '$firstName $lastName';
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
                      GestureDetector(
                        child: SvgPicture.asset(
                          imageAssetPath,
                          height: 34.0,
                          width: 34.0,
                        ),
                      ),
                      mediumHorizontalSizedBox,
                      Flexible(
                        child: Text(
                          modalContent,
                          style: TextThemes.normalSize14Text(),
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
Widget sortDate({
  required TextStyle dateTextStyle,
  required BuildContext context,
  required String loadedDate,
  bool showTime = false,
}) {
  final DateTime parsedDate = DateTime.parse(loadedDate);
  final String postDayTime = DateFormat.jm().format(parsedDate);
  final String postDay = DateFormat.d().format(parsedDate);
  final String postMonth = DateFormat.MMMM().format(parsedDate);
  final String postYear = DateFormat.y().format(parsedDate);

  return Row(
    children: <Widget>[
      Text('$postDay $postMonth $postYear', style: dateTextStyle),
      if (showTime) Text('at ', style: dateTextStyle) else const SizedBox(),
      smallHorizontalSizedBox,
      if (showTime)
        Text(postDayTime, style: dateTextStyle)
      else
        const SizedBox(),
    ],
  );
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
      final Contact? contact =
          state.userState?.clientState?.clientProfile?.user?.contacts
              ?.where(
                (Contact contact) => contact.contactType == ContactType.PRIMARY,
              )
              .first;

      final bool isSignedIn =
          state.userState?.clientState?.clientProfile?.isSignedIn ?? false;

      if (isSignedIn) {
        errorTrace = <String, dynamic>{
          'phoneNumber': contact?.contact ?? UNKNOWN,
          'error': errorTrace,
        };
      }
    } catch (e) {
      errorTrace = error;
    }
  }
  Sentry.captureException(errorTrace, hint: hint);
}

bool confirmPinValidator(String pin, String confirmPin) {
  if (pin != confirmPin) {
    return false;
  }
  return true;
}

final List<UserProfileItemObj> userProfileItems = <UserProfileItemObj>[
  UserProfileItemObj(
    iconAssetPath: profileIcon,
    route: BWRoutes.personalInfo,
    title: 'Personal information',
  ),
  UserProfileItemObj(
    iconAssetPath: medicalDataIcon,
    route: BWRoutes.medicalData,
    title: 'Medical data',
  ),
  UserProfileItemObj(
    iconAssetPath: clinicIcon,
    route: BWRoutes.clinicInformationPage,
    title: 'Clinic information',
  ),
  UserProfileItemObj(
    iconAssetPath: mySavedIcon,
    route: BWRoutes.savedPosts,
    title: 'My Saved',
  ),
  UserProfileItemObj(
    iconAssetPath: faqsIcon,
    route: BWRoutes.profileFaqsPage,
    title: 'FAQs',
  ),
  UserProfileItemObj(
    iconAssetPath: helpCircleIcon,
    route: BWRoutes.consent,
    title: 'Consent',
  ),
  UserProfileItemObj(
    iconAssetPath: feedbackIcon,
    route: BWRoutes.feedbackPage,
    title: 'Feedback',
  ),
  UserProfileItemObj(
    iconAssetPath: settingsIcon,
    route: BWRoutes.settingsPage,
    title: 'Settings',
  ),
];

final NotificationActions calendarAction = NotificationActions(
  icon: IconDetails(iconUrlSvgPath: calendarIcon),
  name: 'Add to Calendar',
  route: '',
);

final NotificationActions rescheduleAction = NotificationActions(
  icon: IconDetails(iconUrlSvgPath: calendarIcon),
  name: 'Reschedule',
  route: '',
);

List<NotificationDetails> notifications = <NotificationDetails>[
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultVideoNotificationIcon),
    description:
        'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join goog/meet.consult',
    date: feedDate,
    actions: <NotificationActions>[calendarAction],
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultNotificationIcon),
    description:
        'You have a teleconsult with doctor Wellman. Click  Here to schedule the call ',
    date: feedDate,
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: wellnessSurveyNotificationIcon),
    description: 'Wellness Survey',
    date: feedDate,
  ),
];

String tooManyTriesString(int timeLeft) {
  final DateFormat f = DateFormat('mm:ss');
  final String convertedTime =
      f.format(DateTime.fromMillisecondsSinceEpoch(timeLeft * 1000));

  return 'Too may tries, try again in $convertedTime minutes';
}

//Mock UserProfile
final Map<String, Map<String, dynamic>?> loginResponse =
    <String, Map<String, Object?>?>{
  'profile': <String, dynamic>{
    'primaryEmailAddress': null,
    'primaryPhone': '+254712654897',
    'covers': <Map<String, dynamic>>[
      <String, dynamic>{
        'payer_name': 'JICK',
        'payer_slade_code': 123,
        'member_number': '123255',
        'member_name': 'Bewell Test'
      }
    ],
    'secondaryEmailAddresses': null,
    'secondaryPhoneNumbers': <String>['+254712654897', '+254712654897'],
    'suspended': false,
    'terms_accepted': true,
    'userBioData': <String, dynamic>{
      'dateOfBirth': '1996-02-07',
      'firstName': 'Abiud',
      'gender': 'unknown',
      'lastName': 'Orina'
    },
    'userName': '@suspicious_ishizaka8254254',
    'verifiedIdentifiers': <Map<String, dynamic>>[
      <String, dynamic>{
        'loginProvider': 'PHONE',
        'timeStamp': '2021-02-19T10:04:39.795501Z',
      }
    ],
  },
};

List<NotificationDetails> upcomingAppointments = <NotificationDetails>[
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: teleConsultVideoNotificationIcon),
    description:
        'Your Teleconsult with Dr Tibu for 11am on 12/12/2021 has been set. Click this link to join goog/meet.consult',
    date: feedDate,
    actions: <NotificationActions>[calendarAction],
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: hospitalIcon),
    description:
        'Hospital appointment for Ruaka community center 11am on 12/12/2021',
    date: '3 days ago',
    actions: <NotificationActions>[calendarAction],
  ),
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: syringeIcon),
    description:
        'Bloodwork appointment for Ruaka community center 11am on 12/12/2021',
    date: '3 days ago',
    actions: <NotificationActions>[calendarAction, rescheduleAction],
  ),
];

List<NotificationDetails> pastAppointments = <NotificationDetails>[
  NotificationDetails(
    icon: IconDetails(iconUrlSvgPath: syringeIcon),
    status: 'MISSED',
    description:
        'Teleconsult with Dr Tibu for 11am on 12/12/2021 has been set. Click this link to join goog/meet.consult',
    date: feedDate,
    actions: <NotificationActions>[calendarAction, rescheduleAction],
  ),
  ...upcomingAppointments
];

bool shouldInputPIN(BuildContext context) {
  // final DateTime signedInTime = DateTime.parse(
  //   StoreProvider.state<AppState>(context)!.clientProfile!.signedInTime!,
  // );

  // TODO: store signed in time in the app state
  final DateTime signedInTime = DateTime.now();

  final String lastPINInputTime = StoreProvider.state<AppState>(context)!
          .miscState!
          .healthPagePINInputTime ??
      '';

  final int differenceFromSignIn =
      DateTime.now().difference(signedInTime).inMinutes;

  final int differenceFromLastInput = lastPINInputTime.isNotEmpty
      ? DateTime.now().difference(DateTime.parse(lastPINInputTime)).inMinutes
      : 0;

  if (differenceFromSignIn > 20 && lastPINInputTime.isEmpty) {
    StoreProvider.dispatch(
      context,
      HealthPagePINInputAction(
        lastPINInputTime: DateTime.now().toString(),
      ),
    );
    return true;
  } else {
    if (differenceFromLastInput > 20) {
      StoreProvider.dispatch(
        context,
        HealthPagePINInputAction(lastPINInputTime: ''),
      );
      return true;
    } else {
      return false;
    }
  }
}

final EditInformationInputItem nameInputItem = EditInformationInputItem(
  fieldName: name,
  hintText: janeDoe,
  inputType: EditInformationInputType.Text,
  inputController: TextEditingController(),
);

final EditInformationInputItem phoneInputItem = EditInformationInputItem(
  fieldName: phoneNumber,
  hintText: hotlineNumberString,
  inputType: EditInformationInputType.Text,
  inputController: TextEditingController(),
);

final EditInformationInputItem relationInputItem = EditInformationInputItem(
  fieldName: relationText,
  hintText: relationText,
  inputType: EditInformationInputType.DropDown,
  inputController: TextEditingController(),
  dropDownOptionList: <String>[
    father,
    mother,
    sibling,
  ],
);

final EditInformationItem careGiverEditInfo = EditInformationItem(
  title: myProfileCaregiverText,
  description: myProfileCaregiverDescriptionText,
  editInformationInputItem: <EditInformationInputItem>[
    nameInputItem,
    phoneInputItem,
    relationInputItem,
  ],
);

final EditInformationInputItem preferredLanguageInputItem =
    EditInformationInputItem(
  fieldName: selectYourPreferredLanguage,
  hintText: selectYourPreferredLanguage,
  inputType: EditInformationInputType.DropDown,
  inputController: TextEditingController(),
  dropDownOptionList: <String>[
    english,
    swahili,
  ],
);

final EditInformationItem preferredLanguageEditInfo = EditInformationItem(
  title: preferredLanguage,
  editInformationInputItem: <EditInformationInputItem>[
    preferredLanguageInputItem
  ],
);

final EditInformationInputItem preferredClinicInputItem =
    EditInformationInputItem(
  fieldName: selectYourPreferredClinic,
  hintText: selectYourPreferredClinic,
  inputType: EditInformationInputType.DropDown,
  inputController: TextEditingController(),
  dropDownOptionList: <String>[
    clinic,
    equityAfiaUmoja,
    kenyattaHospital,
  ],
);

final EditInformationItem preferredClinicEditInfo = EditInformationItem(
  title: preferredClinic,
  editInformationInputItem: <EditInformationInputItem>[
    preferredClinicInputItem
  ],
);

final EditInformationInputItem preferredCommunicationInputItem =
    EditInformationInputItem(
  fieldName: selectYourPreferredCommunication,
  hintText: selectYourPreferredCommunication,
  inputType: EditInformationInputType.DropDown,
  inputController: TextEditingController(),
  dropDownOptionList: <String>[
    inApp,
    whatsAppText,
    textString,
  ],
);

final EditInformationItem preferredCommunicationEditInfo = EditInformationItem(
  title: communicationChannel,
  editInformationInputItem: <EditInformationInputItem>[
    preferredCommunicationInputItem
  ],
);

final EditInformationInputItem nickNameInputItem = EditInformationInputItem(
  fieldName: nickNameFieldName,
  hintText: janeDoe,
  inputType: EditInformationInputType.Text,
  inputController: TextEditingController(),
);

final EditInformationItem nickNameEditInfo = EditInformationItem(
  title: nickNameString,
  editInformationInputItem: <EditInformationInputItem>[nickNameInputItem],
);

Future<void> customFetchData({
  required StreamController<dynamic> streamController,
  required BuildContext context,
  required String queryString,
  required Map<String, dynamic> variables,
  required String logTitle,
  String? logDescription,
}) async {
  streamController.add(<String, dynamic>{'loading': true});

  final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

  _client
    ..endpoint = dGraphEndpoint
    ..idToken = dGraphToken;

  /// fetch the data from the api
  final Response response = await _client.query(
    queryString,
    variables,
  );

  final Map<String, dynamic> payLoad = _client.toMap(response);
  final String? error = parseError(payLoad);

  if (error != null) {
    return streamController
        .addError(<String, dynamic>{'error': _client.parseError(payLoad)});
  }

  return (payLoad['data'] != null)
      ? streamController.add(payLoad['data'])
      : streamController.add(null);
}
