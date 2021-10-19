// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

// Package imports:
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/widgets/expandable_content.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

class ProfileFaqsPage extends StatelessWidget {
  const ProfileFaqsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: faqsText),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  veryLargeHorizontalSizedBox,
                  Text(
                    frequentlyAskedQuestions,
                    style: TextThemes.normalSize34Text(
                        Theme.of(context).primaryColor),
                  ),
                  mediumVerticalSizedBox,
                  const ExpandableContent(
                    title: howDoIUpdateMyProfileText,
                    content: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: number15,
                          right: number15,
                          bottom: number15,
                        ),
                        child: Text(
                          loremIpsumText,
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  smallVerticalSizedBox,
                  const ExpandableContent(
                    title: howDoICheckMyMedicalInfoText,
                    content: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: number15,
                          right: number15,
                          bottom: number15,
                        ),
                        child: Text(
                          loremIpsumText,
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  smallVerticalSizedBox,
                  const ExpandableContent(
                    title: howDoIUpdateMyNicknameText,
                    content: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: number15,
                          right: number15,
                          bottom: number15,
                        ),
                        child: Text(
                          loremIpsumText,
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  smallVerticalSizedBox,
                  const ExpandableContent(
                    title: howDoIRescheduleAnAppointmentText,
                    content: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: number15,
                          right: number15,
                          bottom: number15,
                        ),
                        child: Text(
                          loremIpsumText,
                          style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  veryLargeVerticalSizedBox,
                  veryLargeVerticalSizedBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
