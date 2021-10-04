import 'package:myafyahub/application/redux/states/app_state.dart';

import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';

import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/application/core/services/utils.dart';

import 'package:domain_objects/value_objects.dart';

import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class MyAfyaHubAppbarUser extends StatelessWidget {
  const MyAfyaHubAppbarUser({Key? key}) : super(key: key);

  void editProfileNavigation(BuildContext context) {
    // navigate to the user profile here
    Navigator.pushNamed(context, BWRoutes.userProfile);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: silAppBarGestureKey,
      onTap: () => editProfileNavigation(context),
      child: StoreConnector<AppState, UserProfileViewModel>(
        converter: (Store<AppState> store) =>
            UserProfileViewModel.fromStore(store),
        builder: (BuildContext context, UserProfileViewModel vm) {
          final UserProfileState userProfileState = vm.userProfileState;
          final String? photoUrl = userProfileState.userProfile!.photoUploadID;
          return Container(
            padding: EdgeInsets.all(photoUrl == UNKNOWN ? 2 : 0),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.whiteColor),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, gradient: getAppGradient(context)),
              child: Center(
                child: photoUrl == UNKNOWN
                    ? Text(
                        extractNamesInitials(
                            name: getDisplayName(userProfileState)),
                        style: TextThemes.boldSize14Text(AppColors.whiteColor),
                      )
                    : CircleAvatar(backgroundImage: AssetImage(photoUrl!)),
              ),
            ),
          );
        },
      ),
    );
  }
}
