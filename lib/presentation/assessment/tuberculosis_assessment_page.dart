// Flutter imports:

import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:shared_themes/spaces.dart';

class TuberculosisAssessmentPage extends StatelessWidget {
  const TuberculosisAssessmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: tuberculosisAssessmentTitle,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        largeVerticalSizedBox,
                        Text(
                          tuberculosisAssessmentDescription,
                          style: normalSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          experiencedACoughString,
                          style: normalSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        smallVerticalSizedBox,
                        Wrap(
                          spacing: 12.0,
                          runSpacing: 12.0,
                          children: <Widget>[
                            MoodSymptomWidget(
                              title: yesString,
                              gestureKey: yesExperienceCoughKey,
                              onTap: () {},
                            ),
                            MoodSymptomWidget(
                              title: noString,
                              gestureKey: noExperienceCoughKey,
                              isSelected: true,
                              onTap: () {},
                            ),
                          ],
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          doYouHaveFeverString,
                          style: normalSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        smallVerticalSizedBox,
                        Wrap(
                          spacing: 12.0,
                          runSpacing: 12.0,
                          children: <Widget>[
                            MoodSymptomWidget(
                              title: yesString,
                              gestureKey: yesHaveAFeverCoughKey,
                              onTap: () {},
                            ),
                            MoodSymptomWidget(
                              title: noString,
                              gestureKey: noHaveAFeverCoughKey,
                              isSelected: true,
                              onTap: () {},
                            ),
                          ],
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          noticedAnyWeighLossString,
                          style: normalSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        smallVerticalSizedBox,
                        Wrap(
                          spacing: 12.0,
                          runSpacing: 12.0,
                          children: <Widget>[
                            MoodSymptomWidget(
                              title: yesString,
                              gestureKey: yesWeightLossKey,
                              onTap: () {},
                            ),
                            MoodSymptomWidget(
                              title: noString,
                              gestureKey: noWeightLossKey,
                              isSelected: true,
                              onTap: () {},
                            ),
                          ],
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          experienceNightSweatsString,
                          style: normalSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        smallVerticalSizedBox,
                        Wrap(
                          spacing: 12.0,
                          runSpacing: 12.0,
                          children: <Widget>[
                            MoodSymptomWidget(
                              title: yesString,
                              gestureKey: yesNightSweatsKey,
                              onTap: () {},
                            ),
                            MoodSymptomWidget(
                              title: noString,
                              gestureKey: noNightSweatsKey,
                              isSelected: true,
                              onTap: () {},
                            ),
                          ],
                        ),
                        mediumVerticalSizedBox,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                right: 10,
                left: 10,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: tuberculosisAssessmentFeedbackButtonKey,
                  onPressed: () {},
                  buttonColor: AppColors.primaryColor,
                  borderColor: Colors.transparent,
                  text: submitYourAssessmentString,
                  textStyle: heavySize16Text(
                    AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
