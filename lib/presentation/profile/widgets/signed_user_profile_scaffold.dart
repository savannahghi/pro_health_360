// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/profile_banner.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/core/profile_page_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/profile/pages/contact_details.dart';
import 'package:myafyahub/presentation/profile/widgets/build_profile_footer.dart';
import 'package:myafyahub/presentation/profile/widgets/profile_item_builder.dart';
import 'package:myafyahub/presentation/profile/widgets/profile_separator.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class SignedUserProfileScaffold extends StatefulWidget {
  const SignedUserProfileScaffold();

  @override
  _SignedUserProfileScaffoldState createState() =>
      _SignedUserProfileScaffoldState();
}

class _SignedUserProfileScaffoldState extends State<SignedUserProfileScaffold> {
  ProfileSubject profileSubject = ProfileSubject();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (ResponsiveWidget.deviceType(context) !=
                DeviceScreensType.Mobile) ...<Widget>{
              /// [Tablet] Widgets
              IntrinsicHeight(
                child: Row(
                  key: profileMasterDetailRowKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// [Main] Content
                    SizedBox(
                      width: !ResponsiveWidget.isLandscape(context: context)
                          ? number300
                          : number400,
                      child: ProfileMasterDetail(
                        selection: profileSubject.selection.valueOrNull!,
                      ),
                    ),
                    const VerticalDivider(
                      width: 0,
                      color: Colors.grey,
                    ),

                    /// [Detail] Content
                    ProfileDetail(
                      selection: profileSubject.selection.valueOrNull!,
                    )
                  ],
                ),
              ),
            } else ...<Widget>{
              /// [Mobile] Widgets

              ProfileMasterDetail(
                selection: profileSubject.selection.valueOrNull!,
              ),
            }
          ],
        ),
      ),
    );
  }
}

// navigates when profile item is clicked
Future<void> _navigateToItemPage({
  required BuildContext context,
  required ProfileItems profileItem,
}) async {
  if (profileItem.onTapRoute == BWRoutes.resumeWithPin) {
    // dispatch action to set [isChangingPin] to true
    StoreProvider.dispatch<AppState>(
      context,
      UpdatePinStatusAction(isChangingPin: true),
    );
    await Navigator.pushNamed(context, BWRoutes.resumeWithPin);
  } else {
    await Navigator.pushNamed(context, profileItem.onTapRoute!);
  }
}

/// used for [detail view] in master detail ui
class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    Key? key,
    required ValueNotifier<ProfileItems> selection,
  })  : _selection = selection,
        super(key: key);

  final ValueNotifier<ProfileItems> _selection;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<ProfileItems>(
        valueListenable: _selection,
        builder:
            (BuildContext context, ProfileItems profileItem, Widget? child) {
          // returns default page detail when profile is open for the first time
          if (profileItem.text == contactInfo) {
            return Column(
              children: <Widget>[
                veryLargeVerticalSizedBox,
                Text(profileItem.text),
                veryLargeVerticalSizedBox,
                BuildContactProvider(),
              ],
            );
          }

          // returns profile page detail when profile item is clicked
          return Column(
            children: <Widget>[
              veryLargeVerticalSizedBox,
              Text(profileItem.text),
              largeVerticalSizedBox,
              if (profileItem.tabletWidget != null) profileItem.tabletWidget!,
            ],
          );
        },
      ),
    );
  }
}

/// used for [master view] in master detail ui
class ProfileMasterDetail extends StatefulWidget {
  const ProfileMasterDetail({
    Key? key,
    required this.selection,
  }) : super(key: key);

  final ValueNotifier<ProfileItems> selection;

  @override
  _ProfileMasterDetailState createState() => _ProfileMasterDetailState();
}

class _ProfileMasterDetailState extends State<ProfileMasterDetail> {
  ProfileSubject profileSubject = ProfileSubject();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /// [ProfileBanner] section
        StoreConnector<AppState, UserProfileViewModel>(
          converter: (Store<AppState> store) =>
              UserProfileViewModel.fromStore(store),
          builder: (BuildContext context, UserProfileViewModel vm) {
            final UserProfileState userProfile = vm.userProfileState;
            final String firstName =
                userProfile.userProfile?.userBioData?.firstName?.getValue() ??
                    UNKNOWN;
            final String lastName =
                userProfile.userProfile?.userBioData?.lastName?.getValue() ??
                    UNKNOWN;

            return Hero(
              tag: 'profile_banner',
              child: Material(
                child: SILProfileBanner(
                  editable: true,
                  backgroundImagePath: wellnessBackgroundImgUrl,
                  userPhotoUrl:
                      userProfile.userProfile?.photoUploadID ?? UNKNOWN,
                  userName: sentenceCaseUserName(
                    firstName: firstName,
                    lastName: lastName,
                  ),
                  primaryPhone:
                      userProfile.userProfile?.primaryPhoneNumber?.getValue() ??
                          UNKNOWN,
                  profileRoute: BWRoutes.editProfileSettingsPage,
                ),
              ),
            );
          },
        ),
        veryLargeVerticalSizedBox,
        mediumVerticalSizedBox,

        /// [Account] section
        const ProfileSeparator(text: accountSection),

        ProfileItemBuilder(
          context: context,
          onSelect: (ProfileItems val) {
            if (ResponsiveWidget.deviceType(context) ==
                DeviceScreensType.Mobile) {
              _navigateToItemPage(context: context, profileItem: val);
            } else {
              if (val.onTapRoute != null) {
                if (val.onTapRoute == BWRoutes.resumeWithPin) {
                  // dispatch action to set [isChangingPin] to true
                  StoreProvider.dispatch<AppState>(
                    context,
                    UpdatePinStatusAction(isChangingPin: true),
                  );
                  Navigator.pushNamed(context, val.onTapRoute!);
                }
              }

              if (val.text != changePINSettings &&
                  val.text != termsOfServiceSettings) {
                setState(() {
                  widget.selection.value = val;
                });

                profileSubject.selectedTile.add(val.text);
              }

              profileSubject.color.add(Colors.purple[100]!);
            }
          },
          section: ProfileItemType.account,
        ),

        /// [Legal] section
        const ProfileSeparator(text: legalSection),

        ProfileItemBuilder(
          context: context,
          onSelect: (ProfileItems val) {
            if (ResponsiveWidget.deviceType(context) ==
                DeviceScreensType.Mobile) {
              _navigateToItemPage(context: context, profileItem: val);
            } else {
              if (val.onTapRoute != null) {
                if (val.onTapRoute == BWRoutes.webView) {
                  Navigator.pushNamed(context, val.onTapRoute!);
                }
              }

              setState(() {
                widget.selection.value = val;
              });

              profileSubject.selectedTile.add(val.text);

              profileSubject.color.add(Colors.purple[100]!);
            }
          },
          section: ProfileItemType.legal,
        ),
        BuildProfileFooter(),
      ],
    );
  }
}
