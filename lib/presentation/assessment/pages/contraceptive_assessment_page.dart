import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/assessment/widgets/contraceptive_information.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class ContraceptiveAssessmentPage extends StatelessWidget {
  const ContraceptiveAssessmentPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: contraceptiveAssessmentTitle,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: contraceptiveAssessmentDescription,
                        style: normalSize14Text(
                          AppColors.greyTextColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ifYouIntendToUse,
                            style: normalSize14Text(
                              AppColors.greyTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              size15VerticalSizedBox,
              Text(
                lastMenstrualPeriodString,
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
                    title: thisMonthString,
                    gestureKey: thisMonthKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: lastMonthString,
                    isSelected: true,
                    gestureKey: lastMonthKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: notStartedYetString,
                    gestureKey: notStartedYetKey,
                    onTap: () {},
                  ),
                ],
              ),
              mediumVerticalSizedBox,
              Text(
                areYouPregnantString,
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
                    gestureKey: yesPregnantKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: noString,
                    gestureKey: noPregnantKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
              mediumVerticalSizedBox,
              Text(
                areYouOnFamilyPlanningString,
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
                    gestureKey: yesOnFamilyPlanningKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: noString,
                    gestureKey: noOnFamilyPlanningKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
              mediumVerticalSizedBox,
              Text(
                wouldYouLikeToUseFamilyPlanningString,
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
                    gestureKey: yesToUseFamilyPlanningKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: noString,
                    gestureKey: noToUseFamilyPlanningKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,
              const ContraceptivesInformation(),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: contraceptiveAssessmentFeedbackButtonKey,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRoutes.successfulAssessmentSubmissionPage,
                    arguments: <String, dynamic>{
                      'screeningToolsType': ScreeningToolsType.Contraceptives
                    },
                  ),
                  buttonColor: AppColors.primaryColor,
                  borderColor: Colors.transparent,
                  text: submitYourAssessmentString,
                  textStyle: heavySize16Text(
                    AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
