// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/profile/widgets/call_contact_action_widget.dart';
import 'package:myafyahub/presentation/profile/widgets/clinic_information_item_widget.dart';

class ClinicInformationPage extends StatelessWidget {
  /// [ClinicInformationPage] is to display information of the clinic a client is registered to
  ///
  /// It takes in required [contactNumber], [CHV], [treatmentBuddy], [age],
  /// and [keyProvider] parameters of type String
  ///
  const ClinicInformationPage(
      {required this.contactNumber,
      required this.CHV,
      required this.treatmentBuddy,
      required this.keyProvider});

  final String contactNumber;
  final String CHV;
  final String treatmentBuddy;
  final String keyProvider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAfyaHubAppBar(
        trailingWidget: Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: SvgPicture.asset(
            notificationIcon,
            color: AppColors.secondaryColor,
            width: 20,
          ),
        ),
        title: myProfileString,
        leadingWidget: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: SvgPicture.asset(
            backIcon,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  mediumVerticalSizedBox,
                  Text(
                    clinicContactString,
                    style: TextThemes.boldSize14Text(
                      AppColors.secondaryColor,
                    ),
                  ),
                  smallVerticalSizedBox,
                  CallContactActionWidget(
                    phoneNumber: contactNumber,
                  ),
                  size15VerticalSizedBox,
                  ClinicInformationItemWidget(
                    bodyText: chvString,
                    titleText: CHV,
                  ),
                  size15VerticalSizedBox,
                  ClinicInformationItemWidget(
                    bodyText: treatmentBuddyString,
                    titleText: treatmentBuddy,
                  ),
                  size15VerticalSizedBox,
                  ClinicInformationItemWidget(
                    bodyText: keyProvider,
                    titleText: keyProviderString,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
