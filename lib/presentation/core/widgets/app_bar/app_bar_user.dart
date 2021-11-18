// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
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
            final User? user = vm.clientProfile?.user;

            final String? avatar = user?.avatar;

            // a sanity check for the photo url
            final bool isAvatarInvalid = avatar!.isEmpty || avatar == UNKNOWN;

            return Container(
              padding: EdgeInsets.all(isAvatarInvalid ? 2 : 0),
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
                  child: isAvatarInvalid
                      ? Text(
                          extractNamesInitials(
                            name: getDisplayName(user),
                          ),
                          style: TextThemes.boldSize14Text(
                            AppColors.secondaryColor,
                          ),
                        )
                      : CircleAvatar(backgroundImage: AssetImage(avatar)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
