import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class ViolenceAssessmentPage extends StatelessWidget {
  const ViolenceAssessmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: violenceAssessmentTitle,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                violenceAssessmentSubtitle,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              largeVerticalSizedBox,
              Text(
                emotionalViolence,
                style: veryBoldSize18Text(
                  AppColors.greyTextColor,
                ),
              ),
              smallVerticalSizedBox,
              Text(
                emotionalViolenceQuestion,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: yesString,
                    gestureKey: yesEmotionalAssessmentKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: noString,
                    gestureKey: noEmotionalAssessmentKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,
              Text(
                physicalViolence,
                style: veryBoldSize18Text(
                  AppColors.greyTextColor,
                ),
              ),
              smallVerticalSizedBox,
              Text(
                physicalViolenceQuestion,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: yesString,
                    gestureKey: yesPhysicalAssessmentKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: noString,
                    gestureKey: noPhysicalAssessmentKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,
              Text(
                sexualViolence,
                style: veryBoldSize18Text(
                  AppColors.greyTextColor,
                ),
              ),
              smallVerticalSizedBox,
              Text(
                sexualViolenceQuestion,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: yesString,
                    gestureKey: yesSexualAssessmentKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: noString,
                    gestureKey: noSexualAssessmentKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,
              Text(
                intimatePartnerViolence,
                style: veryBoldSize18Text(
                  AppColors.greyTextColor,
                ),
              ),
              smallVerticalSizedBox,
              Text(
                intimatePartnerViolenceQuestion,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: yesString,
                    gestureKey: yesIntimateAssessmentKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: noString,
                    gestureKey: noIntimateAssessmentKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                child: MyAfyaHubPrimaryButton(
                  text: submitAssessment,
                  buttonKey: submitViolenceAssessmentKey,
                  buttonColor: AppColors.primaryColor,
                  borderColor: Colors.transparent,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRoutes.successfulAssessmentSubmissionPage,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
