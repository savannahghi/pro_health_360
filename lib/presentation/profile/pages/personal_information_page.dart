// Flutter imports:
import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/widgets/personal_information_secondary_widget.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/personal_information_widget.dart';

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: personalInfoPageTitle),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: <Widget>[
              // parent/caregiver/guardian details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        myProfileCaregiverText,
                        style: TextThemes.boldSize16Text(
                          AppColors.secondaryColor,
                        ),
                      ),
                      Text(
                        myProfileCaregiverDescriptionText,
                        style: TextThemes.normalSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.userInitialsColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      editString,
                      textAlign: TextAlign.center,
                      style: TextThemes.normalSize14Text(AppColors.whiteColor),
                    ),
                  ),
                ],
              ),

              smallVerticalSizedBox,
              const PersonalInformationSecondaryWidget(
                fieldName: name,
                fieldValue: janeDoe,
              ),
              verySmallVerticalSizedBox,
              const PersonalInformationSecondaryWidget(
                fieldName: phoneNumber,
                fieldValue: hotlineNumberString,
              ),
              verySmallVerticalSizedBox,
              const PersonalInformationSecondaryWidget(
                fieldName: relationText,
                fieldValue: father,
              ),
              largeVerticalSizedBox,

              //preferred language
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    preferredLanguage,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.userInitialsColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      editString,
                      textAlign: TextAlign.center,
                      style: TextThemes.normalSize14Text(AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
              smallVerticalSizedBox,
              const PersonalInformationWidget(description: english),
              largeVerticalSizedBox,

              //preferred clinic
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    preferredClinic,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.userInitialsColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      editString,
                      textAlign: TextAlign.center,
                      style: TextThemes.normalSize14Text(AppColors.whiteColor),
                    ),
                  ),
                ],
              ),

              smallVerticalSizedBox,
              const PersonalInformationWidget(description: clinic),
              largeVerticalSizedBox,

              //preferred communication
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    preferredCommunication,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.userInitialsColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      editString,
                      textAlign: TextAlign.center,
                      style: TextThemes.normalSize14Text(AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
              smallVerticalSizedBox,
              const PersonalInformationWidget(description: inApp),
            ],
          ),
        ),
      ),
    );
  }
}
