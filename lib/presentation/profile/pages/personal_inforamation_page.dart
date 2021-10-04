import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/personal_information_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class PersonalInformationPage extends StatelessWidget {
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: <Widget>[
              //parent/caregiver/guardian details
              Align(
                alignment: Alignment.topLeft,
                child: Text(myProfileParentText,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor)),
              ),
              smallVerticalSizedBox,
              const PersonalInformationWidget(description: name),
              verySmallVerticalSizedBox,
              const PersonalInformationWidget(description: phoneNumber),
              verySmallVerticalSizedBox,
              const PersonalInformationWidget(description: relationText),
              largeVerticalSizedBox,

              //preferred language
              Align(
                alignment: Alignment.topLeft,
                child: Text(preferredLanguage,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor)),
              ),
              smallVerticalSizedBox,
              const PersonalInformationWidget(description: english),
              largeVerticalSizedBox,

              //preferred clinic
              Align(
                alignment: Alignment.topLeft,
                child: Text(preferredClinic,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor)),
              ),
              smallVerticalSizedBox,
              const PersonalInformationWidget(description: clinic),
              largeVerticalSizedBox,

              //preferred communication
              Align(
                alignment: Alignment.topLeft,
                child: Text(preferredCommunication,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor)),
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
