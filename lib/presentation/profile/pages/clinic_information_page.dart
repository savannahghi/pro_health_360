// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/widgets/call_contact_action_widget.dart';
import 'package:myafyahub/presentation/profile/widgets/clinic_information_item_widget.dart';

/// [ClinicInformationPage] is to display information of the clinic a client is registered to
///
/// It takes in required [contactNumber], [CHV], [treatmentBuddy], [age],
/// and [keyProvider] parameters of type String
///
class ClinicInformationPage extends StatelessWidget {
  final String CHV = 'Name';
  final String contactNumber = '0712345678';
  final String keyProvider = 'Name';
  final String treatmentBuddy = 'Name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(title: clinicInfoPageTitle),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mediumVerticalSizedBox,
              Text(
                clinicContactString,
                style: TextThemes.boldSize14Text(AppColors.secondaryColor),
              ),
              smallVerticalSizedBox,
              CallContactActionWidget(phoneNumber: contactNumber),
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
    );
  }
}
