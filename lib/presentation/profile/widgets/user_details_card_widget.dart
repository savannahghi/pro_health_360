// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class UserDetailsCard extends StatelessWidget {
  /// [UserDetailsCard] is a shared widget used in [UserProfilePage]
  ///
  /// It takes in required [userInitials], [name], [userCCCNumber], [age], [phoneNumber]
  /// and [home] parameters
  const UserDetailsCard({
    Key? key,
    required this.cccNumber,
    required this.age,
    required this.home,
  }) : super(key: key);

  final String cccNumber;
  final String age;

  ///
  final String home;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ClientProfileViewModel>(
      converter: (Store<AppState> store) =>
          ClientProfileViewModel.fromStore(store),
      builder: (BuildContext context, ClientProfileViewModel vm) {
        final User? user = vm.clientState?.user;

        final String phone = user?.primaryContact?.value ?? UNKNOWN;

        final String name = getDisplayName(user);

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.userDetailsCardBackgroundColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.userInitialsColor,
                ),
                child: Text(
                  extractNamesInitials(name: name),
                  style: const TextStyle(
                    fontSize: 22,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              smallHorizontalSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    'CCC No: $cccNumber',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    'Age: $age yrs',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  largeVerticalSizedBox,
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        phoneCallIcon,
                        color: AppColors.whiteColor,
                        width: 14,
                        height: 18,
                      ),
                      size15HorizontalSizedBox,
                      Text(
                        phone,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  size15VerticalSizedBox,
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        homeLocationIcon,
                        color: AppColors.whiteColor,
                        width: 15,
                        height: 15,
                      ),
                      size15HorizontalSizedBox,
                      Text(
                        home,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  mediumVerticalSizedBox,
                  GestureDetector(
                    key: requestCorrectionButtonKey,
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(comingSoonText),
                        duration: Duration(seconds: 2),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        requestCorrectionString,
                        style: TextThemes.boldSize13Text(
                          Colors.white,
                        ),
                      ),
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
}
