// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:misc_utilities/enums.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/profile_banner.dart';
import 'package:user_profile/contact_utils.dart';
import 'package:user_profile/contacts.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/application/redux/view_models/contact_view_model.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

/// renders [ContactDetails]
/// [ContactDetails] renders [ContactItemsCard]
/// [ContactItemsCard] renders [ContactItem] or a [message]
class ProfileContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StoreConnector<AppState, UserProfileViewModel>(
              converter: (Store<AppState> store) =>
                  UserProfileViewModel.fromStore(store),
              builder: (BuildContext context, UserProfileViewModel vm) {
                final UserProfileState userProfile = vm.userProfileState;
                final String firstName = userProfile
                        .userProfile?.userBioData?.firstName!
                        .getValue() ??
                    UNKNOWN;

                final String lastName = userProfile
                        .userProfile?.userBioData?.lastName!
                        .getValue() ??
                    UNKNOWN;

                return Hero(
                  tag: 'profile_banner',
                  child: Material(
                    child: SILProfileBanner(
                      height: 160,
                      backgroundImagePath: wellnessUmbrellaImgUrl,
                      userPhotoUrl:
                          userProfile.userProfile?.photoUploadID ?? UNKNOWN,
                      userName: sentenceCaseUserName(
                        firstName: firstName,
                        lastName: lastName,
                      ),
                      primaryPhone: userProfile.userProfile?.primaryPhoneNumber
                              ?.getValue() ??
                          'No phone number',
                      profileRoute: BWRoutes.userProfile,
                    ),
                  ),
                );
              },
            ),
            veryLargeVerticalSizedBox,
            largeVerticalSizedBox,
            BuildContactProvider(),
          ],
        ),
      ),
    );
  }
}

class BuildContactProvider extends StatefulWidget {
  @override
  BuildContactProviderState createState() => BuildContactProviderState();
}

class BuildContactProviderState extends State<BuildContactProvider> {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return buildContactProviderState;
  }

  void refreshFeed() {}

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContactViewModel>(
      converter: (Store<AppState> store) => ContactViewModel.fromStore(store),
      builder: (BuildContext context, ContactViewModel vm) {
        return ContactProvider(
          primaryEmail: vm.primaryEmail ?? EmailAddress.withValue(UNKNOWNEMAIL),
          primaryPhone: vm.primaryPhone,
          secondaryEmails: vm.secondaryEmails,
          secondaryPhones: vm.secondaryPhones,
          wait: StoreProvider.state<AppState>(context)!.wait!,
          checkWaitingFor: checkWaitingForFunc(context),
          contactUtils: ContactUtils(
            toggleLoadingIndicator: toggleLoadingIndicator,
            client: AppWrapperBase.of(context)!.graphQLClient,
            updateStateFunc: updateStateContacts,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveWidget.deviceType(context) !=
                      DeviceScreensType.Mobile
                  ? number30
                  : number0,
            ),
            child: ContactDetails(
              /// refresh the feed in the background so that the nudge disappears

              onContactSaved: refreshFeed,
            ),
          ),
        );
      },
    );
  }
}
