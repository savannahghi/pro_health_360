// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:launch_review/launch_review.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/app_review_action.dart';
import 'package:myafyahub/application/redux/actions/logout_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/entities/core/icon_details.dart';
import 'package:myafyahub/domain/core/entities/library/library_content_item.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_actions.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_details.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/circular_background_icons.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:unicons/unicons.dart';
import 'package:user_profile/contact_utils.dart';
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
                BWRoutes.phoneLogin, (Route<dynamic> route) => false);
          },
          context: context),
    );
  };
}

String getDisplayName(UserProfileState state) {
  final String firstName =
      state.userProfile?.userBioData?.firstName?.getValue() ?? UNKNOWN;
  final String formattedFirstName = firstName.replaceAll(' ', '');

  final String lastName =
      state.userProfile?.userBioData?.lastName?.getValue() ?? UNKNOWN;
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

Future<void> updateStateContacts(
    {required BuildContext context,
    required StateContactType type,
    String? value}) async {
  final UserProfileState profile =
      StoreProvider.state<AppState>(context)!.userProfileState!;
  switch (type) {
    case StateContactType.retireSecondaryPhone:
      final List<PhoneNumber>? phones =
          profile.userProfile!.secondaryPhoneNumbers;
      phones!.remove(PhoneNumber.withValue(value!));

      StoreProvider.dispatch(
        context,
        UpdateUserProfileAction(
          profile: UserProfile(secondaryPhoneNumbers: phones),
        ),
      );
      break;
    case StateContactType.retireSecondaryEmail:
      final List<EmailAddress>? emails =
          profile.userProfile!.secondaryEmailAddresses;

      emails!.remove(EmailAddress.withValue(value!));
      StoreProvider.dispatch(
        context,
        UpdateUserProfileAction(
          profile: UserProfile(secondaryEmailAddresses: emails),
        ),
      );

      break;
    case StateContactType.setPrimaryPhone:
      final List<PhoneNumber>? phones =
          profile.userProfile!.secondaryPhoneNumbers;

      phones!.remove(PhoneNumber.withValue(value!));

      if (profile.userProfile!.primaryPhoneNumber != null) {
        phones.add(profile.userProfile!.primaryPhoneNumber!);
      }
      StoreProvider.dispatch(
        context,
        UpdateUserProfileAction(
          profile: UserProfile(
              secondaryPhoneNumbers: phones,
              primaryPhoneNumber: PhoneNumber.withValue(value)),
        ),
      );
      break;
    case StateContactType.setPrimaryEmail:
      final List<EmailAddress>? emails =
          profile.userProfile!.secondaryEmailAddresses;

      emails!.remove(EmailAddress.withValue(value!));

      if (profile.userProfile!.primaryEmailAddress != null) {
        emails.add(profile.userProfile!.primaryEmailAddress!);
      }
      StoreProvider.dispatch(
        context,
        UpdateUserProfileAction(
          profile: UserProfile(
            secondaryEmailAddresses: emails,
            primaryEmailAddress: EmailAddress.withValue(value),
          ),
        ),
      );
      break;
    case StateContactType.primaryEmail:
      StoreProvider.dispatch(
        context,
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryEmailAddress: EmailAddress.withValue(value!),
          ),
        ),
      );

      break;
    case StateContactType.secondaryPhones:
      final List<PhoneNumber> phones = <PhoneNumber>[
        PhoneNumber.withValue(value!)
      ];

      phones.addAll(StoreProvider.state<AppState>(context)!
          .userProfileState!
          .userProfile!
          .secondaryPhoneNumbers!);

      StoreProvider.dispatch(
        context,
        UpdateUserProfileAction(
          profile: UserProfile(
            secondaryPhoneNumbers: phones,
          ),
        ),
      );
      break;
    default:
      final List<EmailAddress> emails = <EmailAddress>[
        EmailAddress.withValue(value!)
      ];

      emails.addAll(StoreProvider.state<AppState>(context)!
          .userProfileState!
          .userProfile!
          .secondaryEmailAddresses!);
      StoreProvider.dispatch(
        context,
        UpdateUserProfileAction(
          profile: UserProfile(
            secondaryEmailAddresses: emails,
          ),
        ),
      );
  }
}

Future<String> getUploadID({
  required Map<String, dynamic> fileData,
  required BuildContext context,
}) async {
  try {
    /// initialize the http client from [AppWrapperBase]
    final IGraphQlClient _httpClient =
        AppWrapperBase.of(context)!.graphQLClient;

    /// initialize the [uploadFileEndpoint]
    final String endPoint =
        AppWrapperBase.of(context)!.customContext!.uploadFileEndPoint;

    final ProcessedResponse processedResponse = processHttpResponse(
        await _httpClient.callRESTAPI(
            endpoint: endPoint, variables: fileData, method: httpPOST),
        context);

    if (processedResponse.ok == true &&
        json.decode(processedResponse.response.body)['id'] != null) {
      final Map<String, dynamic> body =
          json.decode(processedResponse.response.body) as Map<String, dynamic>;
      return body['id']!.toString();
    } else {
      throw processedResponse.response;
    }
  } catch (e, stackTrace) {
    reportErrorToSentry(context, e,
        stackTrace: stackTrace, hint: 'Failed To Get UploadID');
    return 'err';
  }
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
                    child: Text(message,
                        textAlign: TextAlign.center,
                        style: TextThemes.normalSize18Text(
                          AppColors.blackColor,
                        )),
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
                          }),
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
      });
}

void showMedicationBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  showModalBottomSheet(
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: context,
      builder: (BuildContext ctx) {
        return Container(
          key: actionsContainerKey,
          child: child,
        );
      });
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

double getWidthOfSymmetricalWidgetsOnLargeDevice() {
  return 420 / 2 - 20;
}

double getWidthOfSymmetricalWidgetsSmallDevices(
    {required BuildContext context}) {
  return (MediaQuery.of(context).size.width -
          preferredPaddingOnStretchedScreens(context: context) * 2 -
          number10) /
      2;
}

bool isSmallScreenAndOnLandscape({required BuildContext context}) {
  if (ResponsiveWidget.isLandscape(context: context) &&
      getDeviceType(context) == DeviceScreensType.Mobile) {
    return true;
  }
  return false;
}

bool isLargeScreenAndOnLandscape({required BuildContext context}) {
  if (ResponsiveWidget.isLargeScreen(context) &&
      ResponsiveWidget.isLandscape(context: context)) {
    return true;
  }
  return false;
}

String sentenceCaseUserName(
    {required String firstName, required String lastName}) {
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
                        )),
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
      });
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
      Text('$postDay ', style: dateTextStyle),
      Text('$postMonth ', style: dateTextStyle),
      Text('$postYear ', style: dateTextStyle),
      if (showTime) Text('at ', style: dateTextStyle) else const SizedBox(),
      smallHorizontalSizedBox,
      if (showTime)
        Text(postDayTime, style: dateTextStyle)
      else
        const SizedBox(),
    ],
  );
}

String removeHyphens(String sentence) {
  return titleCase(sentence.toString().replaceAll('-', ' ').toLowerCase());
}

Widget SILLoaderWithText() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SILPlatformLoader(),
        smallVerticalSizedBox,
        Text(
          loadingText,
          style: TextThemes.boldSize12Text(),
        ),
      ],
    ),
  );
}

Widget LibraryIconButton({
  required BuildContext context,
  required Color backgroundColor,
  required Color iconColor,
}) {
  return GestureDetector(
    key: libraryIconButtonKey,
    onTap: () => Navigator.pop(context),
    child: Container(
      padding: const EdgeInsets.only(
        right: 24,
        left: 18,
        top: 48,
      ),
      child: CircularBackGroundIcons(
        backgroundColor: backgroundColor,
        iconBackgroundPadding: 12,
        loadIcon: UniconsLine.multiply,
        iconColor: iconColor,
      ),
    ),
  );
}

void libraryContentNavigation(
    BuildContext context, LibraryContentItemData libraryContentItem) {
  Navigator.pushNamed(context, BWRoutes.libraryContent,
      arguments: libraryContentItem);
}

LibraryContentItemData listLibraryDataItems(
    int index, List<dynamic> libContent) {
  final String libraryContentTitle = libContent[index]['title'].toString();
  final String image = libContent[index]['featureImage'].toString();
  final String readingTime = libContent[index]['readingTime'].toString();
  final String libraryBody = libContent[index]['html'].toString();
  final String libraryPublishedDate =
      libContent[index]['publishedAt'].toString();
  final String libraryContentTags =
      libContent[index]['tags'][0]['name'].toString();
  final String formattedLibraryContentTag = removeHyphens(libraryContentTags);

  final LibraryContentItemData libraryContentItemData = LibraryContentItemData(
      image, readingTime, libraryBody, formattedLibraryContentTag,
      libraryContentPublishDate: libraryPublishedDate,
      libraryContentTitle: libraryContentTitle);
  return libraryContentItemData;
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

dynamic reportErrorToSentry(BuildContext? context, dynamic error,
    {dynamic stackTrace, String? hint}) {
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
      if (state.userProfileState?.isSignedIn != null &&
          state.userProfileState!.isSignedIn!) {
        errorTrace = <String, dynamic>{
          'phoneNumber': state
              .userProfileState!.userProfile!.primaryPhoneNumber!
              .getValue(),
          'error': errorTrace,
        };
      }
    } catch (e) {
      errorTrace = error;
    }
  }
  Sentry.captureException(errorTrace, hint: hint);
}

void updateAppReviewVariables({
  required BuildContext context,
  required String lastLaunchDate,
  required int launches,
  required int days,
}) {
  final DateTime dateToday = DateTime.now();
  late DateTime convertedLastLaunchDate;
  if (lastLaunchDate.isEmpty) {
    lastLaunchDate = dateToday.toString();
  }
  convertedLastLaunchDate = DateTime.parse(lastLaunchDate);
  if (dateToday.difference(convertedLastLaunchDate).inDays > number0) {
    days++;
    lastLaunchDate = convertedLastLaunchDate.toString();
  }
  launches++;
  StoreProvider.dispatch<AppState>(
    context,
    AppReviewAction(
        days: days, lastLaunchDate: lastLaunchDate, launches: launches),
  );
}

Future<void> showRatingBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    isDismissible: false,
    enableDrag: false,
    context: context,
    builder: (BuildContext context) => Padding(
      padding: const EdgeInsets.all(number2),
      child: Container(
        key: ratingDialogKey,
        decoration: const BoxDecoration(color: Colors.white),
        constraints: const BoxConstraints(maxWidth: 420),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              mediumVerticalSizedBox,
              Column(
                children: <Widget>[
                  Text(
                    dialogTitle,
                    style: TextThemes.normalSize18Text(Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  smallVerticalSizedBox,
                  Text(
                    dialogSubtitle,
                    style: TextThemes.normalSize18Text(Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              size40VerticalSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  5,
                  (_) => const Icon(Icons.star, color: Colors.orange, size: 32),
                ),
              ),
              size40VerticalSizedBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: number20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: number48,
                        child: SILSecondaryButton(
                            onPressed: () {
                              Navigator.pop(context);
                              StoreProvider.dispatch<AppState>(
                                context,
                                AppReviewAction(launches: 0),
                              );
                            },
                            text: later),
                      ),
                    ),
                    const SizedBox(width: number20),
                    Expanded(
                      child: SizedBox(
                        height: number48,
                        child: SILPrimaryButton(
                            onPressed: () {
                              StoreProvider.dispatch<AppState>(
                                context,
                                AppReviewAction(
                                  shouldRateApp: false,
                                ),
                              );
                              Navigator.pop(context);
                              LaunchReview.launch(
                                androidAppId: googlePlayIdentifier,
                                iOSAppId: appStoreID,
                              );
                            },
                            text: rateNow),
                      ),
                    ),
                  ],
                ),
              ),
              size40VerticalSizedBox,
            ],
          ),
        ),
      ),
    ),
  );
}

Map<String, String>? getCountry(Country country) {
  switch (country) {
    case Country.kenya:
      return supportedCountries['kenya'];
    case Country.uganda:
      return supportedCountries['uganda'];
    case Country.tanzania:
      return supportedCountries['tanzania'];
    case Country.belgium:
      return supportedCountries['belgium'];
    case Country.uk:
      return supportedCountries['uk'];
    default:
      return supportedCountries['usa'];
  }
}

Map<String, Map<String, String>> supportedCountries =
    <String, Map<String, String>>{
  'kenya': <String, String>{
    'code': '+254',
    'initial': 'KE',
    'name': 'Kenya',
    'flag': 'packages/shared_ui_components/assets/ke.png',
  },
  'uganda': <String, String>{
    'code': '+255',
    'initial': 'UG',
    'name': 'Uganda',
    'flag': 'packages/shared_ui_components/assets/ug.png',
  },
  'tanzania': <String, String>{
    'code': '+256',
    'initial': 'TZ',
    'name': 'Tanzania',
    'flag': 'packages/shared_ui_components/assets/tz.png',
  },
  'usa': <String, String>{
    'code': '+1',
    'initial': 'USA',
    'name': 'United States',
    'flag': 'packages/shared_ui_components/assets/us.png',
  },
  'uk': <String, String>{
    'code': '+44',
    'initial': 'UK',
    'name': 'United Kingdom',
    'flag': 'packages/shared_ui_components/assets/uk.png',
  },
  'belgium': <String, String>{
    'code': '+32',
    'initial': 'BEL',
    'name': 'Belgium',
    'flag': 'packages/shared_ui_components/assets/bel.png',
  },
};
dynamic selectCountryModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          child: Wrap(
            children: <Widget>[
              for (Map<String, String> country in supportedCountries.values)
                ListTile(
                  leading: Image.asset(
                    country['flag']!,
                    height: 25,
                  ),
                  title: Text(country['name']!),
                  onTap: () {
                    Navigator.of(context).pop(popValue(country['name']!));
                  },
                ),
            ],
          ),
        );
      });
}

Country popValue(String name) {
  switch (name) {
    case 'Kenya':
      return Country.kenya;
    case 'Uganda':
      return Country.uganda;
    case 'Tanzania':
      return Country.tanzania;
    case 'Belgium':
      return Country.belgium;
    case 'United Kingdom':
      return Country.uk;
    default:
      return Country.us;
  }
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
    title: 'Concent',
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
    route: '');

final NotificationActions rescheduleAction = NotificationActions(
    icon: IconDetails(iconUrlSvgPath: calendarIcon),
    name: 'Reschedule',
    route: '');

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
        'You have a tele consult with doctor Wellman. Click  Here to schedule the call ',
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
      'firstName': 'John',
      'gender': 'unknown',
      'lastName': 'Doe'
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
