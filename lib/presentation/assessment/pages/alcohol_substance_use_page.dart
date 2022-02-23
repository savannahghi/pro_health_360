// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class AlcoholSubstanceUsePage extends StatelessWidget {
  const AlcoholSubstanceUsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: alcoholSubstanceUseTitle,
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
                          alcoholSubstanceUseDescription,
                          style: normalSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          alcoholSubstanceUseQuestionOne,
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
                              gestureKey: yesQuestionOneKey,
                              onTap: () {},
                            ),
                            MoodSymptomWidget(
                              title: noString,
                              gestureKey: noQuestionOneKey,
                              isSelected: true,
                              onTap: () {},
                            ),
                          ],
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          alcoholSubstanceUseQuestionTwo,
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
                              gestureKey: yesQuestionTwoKey,
                              onTap: () {},
                            ),
                            MoodSymptomWidget(
                              title: noString,
                              gestureKey: noQuestionTwoKey,
                              isSelected: true,
                              onTap: () {},
                            ),
                          ],
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          alcoholSubstanceUseQuestionThree,
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
                              gestureKey: yesQuestionThreeKey,
                              onTap: () {},
                            ),
                            MoodSymptomWidget(
                              title: noString,
                              gestureKey: noQuestionThreeKey,
                              isSelected: true,
                              onTap: () {},
                            ),
                          ],
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          alcoholSubstanceUseQuestionFour,
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
                              gestureKey: yesQuestionFourKey,
                              onTap: () {},
                            ),
                            MoodSymptomWidget(
                              title: noString,
                              gestureKey: noQuestionFourKey,
                              isSelected: true,
                              onTap: () {},
                            ),
                          ],
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          alcoholSubstanceUseQuestionFive,
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
                              gestureKey: yesQuestionFiveKey,
                              onTap: () {},
                            ),
                            MoodSymptomWidget(
                              title: noString,
                              gestureKey: noQuestionFiveKey,
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
                  buttonKey: alcoholSubstanceFeedbackButtonKey,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRoutes.successfulAssessmentSubmissionPage,
                  ),
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
