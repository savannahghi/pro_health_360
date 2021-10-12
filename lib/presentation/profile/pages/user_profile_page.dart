// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/information_list_card.dart';
import 'package:myafyahub/presentation/profile/widgets/call_contact_action_widget.dart';
import 'package:myafyahub/presentation/profile/widgets/user_details_card_widget.dart';

class UserProfilePage extends StatelessWidget {
  /// [UserProfilePage] is to display the user information
  ///
  /// It takes in required [userInitials], [name], [userCCCNumber], [age], [phoneNumber],
  ///  [home] and [userProfileItems] parameters
  ///
  /// [userProfileItems] is a list of the UserProfilePage ListTile items

  final String userInitials = 'WJ';
  final String name = 'Wanyonje Joseph';
  // Client's Comprehensive Care Centre Number
  final String userCCCNumber = '12345678';
  final String age = '18';
  final String phoneNumber = '0712345678';
  final String home = 'Karen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAfyaHubAppBar(
        title: myHealthPageProfile,
        leadingWidget: SvgPicture.asset(
          backIcon,
          color: AppColors.secondaryColor,
        ),
      ),
      body: Padding(
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
                        .elementAt(index).iconAssetPath;
                    final String title =
                        userProfileItems.elementAt(index).title;
                    final String routeName =
                        userProfileItems.elementAt(index).route;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: GestureDetector(
                        onTap: () {
                          if (routeName.isNotEmpty) {
                            Navigator.pushNamed(context, routeName);
                          }
                        },
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
                          iconBackgroundColor: AppColors.listCardColor,
                          leadingIcon: Container(
                            decoration: BoxDecoration(
                              color: AppColors.listCardColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                              iconPath,
                              width: 20,
                              height: 20,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ),
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
                  const CallContactActionWidget(
                    backgroundColor: AppColors.hotlineBackgroundColor,
                    phoneNumber: hotlineNumberString,
                    textColor: Colors.white,
                    iconColor: AppColors.secondaryColor,
                    iconBackground: AppColors.whiteColor,
                  ),
                  mediumVerticalSizedBox,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
