// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class AppbarUser extends StatelessWidget {
  const AppbarUser({Key? key}) : super(key: key);

  void editProfileNavigation(BuildContext context) {
    // navigate to the user profile here
    Navigator.pushNamed(context, BWRoutes.userProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        key: appBarUserKey,
        onTap: () => editProfileNavigation(context),
        child: StoreConnector<AppState, ClientProfileViewModel>(
          converter: (Store<AppState> store) =>
              ClientProfileViewModel.fromStore(store),
          builder: (BuildContext context, ClientProfileViewModel vm) {
            final UserProfileState userProfileState = vm.clientProfile;
            final String? photoUrl =
                userProfileState.userProfile!.photoUploadID;

            // a sanity check for the photo url
            final bool isUploadUrlInvalid =
                photoUrl!.isEmpty || photoUrl == UNKNOWN;

            return Container(
              padding: EdgeInsets.all(isUploadUrlInvalid ? 2 : 0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
              ),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: isUploadUrlInvalid
                      ? Text(
                          extractNamesInitials(
                            name: getDisplayName(userProfileState),
                          ),
                          style: TextThemes.boldSize14Text(
                            AppColors.secondaryColor,
                          ),
                        )
                      : CircleAvatar(backgroundImage: AssetImage(photoUrl)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
