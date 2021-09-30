import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/information_list_card.dart';
import 'package:myafyahub/presentation/profile/widgets/user_details_card_widget.dart';
import 'package:shared_themes/spaces.dart';

class UserProfilePage extends StatelessWidget {
  /// [UserProfilePage] is to display the user information
  ///
  /// It takes in required [userInitials], [name], [userCCCNumber], [age], [phoneNumber],
  ///  [home] and [userProfileItems] parameters
  ///
  /// [userProfileItems] is a list of the UserProfilePage ListTile items
  const UserProfilePage({
    required this.userInitials,
    required this.name,
    required this.userCCCNumber,
    required this.age,
    required this.phoneNumber,
    required this.home,
    required this.userProfileItems,
  });

  final String userInitials;
  final String name;
  // Client's Comprehensive Care Centre Number
  final String userCCCNumber;
  final String age;
  final String phoneNumber;
  final String home;
  final List<Map<String, dynamic>> userProfileItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    largeVerticalSizedBox,
                    UserDetailsCard(
                      userInitials: userInitials,
                      name: name,
                      cccNumber: userCCCNumber,
                      age: age,
                      phoneNumber: phoneNumber,
                      home: home,
                    ),
                    largeVerticalSizedBox,
                    ...List<Widget>.generate(userProfileItems.length,
                        (int index) {
                      final String iconPath = userProfileItems
                          .elementAt(index)['iconPath']
                          .toString();
                      final String title =
                          userProfileItems.elementAt(index)['title'].toString();
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: InformationListCard(
                          title: Text(
                            title,
                            maxLines: 2,
                            style: const TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                          iconColor: AppColors.secondaryColor,
                          iconBackgroundColor: AppColors.listCardColor,
                          iconAssetPath: iconPath,
                        ),
                      );
                    }),
                    mediumVerticalSizedBox,
                    const Text(
                      hotlineString,
                      style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    smallVerticalSizedBox,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.hotlineBackgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            hotlineNumberString,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: GestureDetector(
                              key: hotlineCallButtonKey,
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    phoneCallIcon,
                                    color: AppColors.secondaryColor,
                                    width: 14,
                                    height: 14,
                                  ),
                                  smallHorizontalSizedBox,
                                  const Text(
                                    callString,
                                    style: TextStyle(
                                      color: AppColors.secondaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    mediumVerticalSizedBox,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
