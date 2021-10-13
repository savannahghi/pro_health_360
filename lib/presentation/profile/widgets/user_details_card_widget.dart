// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:afya_moja_core/buttons.dart';

class UserDetailsCard extends StatelessWidget {
  /// [UserDetailsCard] is a shared widget used in [UserProfilePage]
  ///
  /// It takes in required [userInitials], [name], [userCCCNumber], [age], [phoneNumber]
  /// and [home] parameters
  const UserDetailsCard(
      {Key? key,
      required this.userInitials,
      required this.name,
      required this.cccNumber,
      required this.age,
      required this.phoneNumber,
      required this.home})
      : super(key: key);
  final String userInitials;
  final String name;
  final String cccNumber;
  final String age;
  final String phoneNumber;

  ///
  final String home;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
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
              userInitials,
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
                    fontWeight: FontWeight.w500),
              ),
              smallVerticalSizedBox,
              Text(
                'CCC No: $cccNumber',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              smallVerticalSizedBox,
              Text(
                'Age: $age yrs',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
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
                    phoneNumber,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
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
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              mediumVerticalSizedBox,
              const MyAfyaHubPrimaryButton(
                text: correctionRequestString,
                textColor: Colors.white,
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }
}
