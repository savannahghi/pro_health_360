import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:shared_themes/spaces.dart';

class HealthAssessmentPage extends StatelessWidget {
  const HealthAssessmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: healthAssessmentTitle,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                healthAssessmentSubtitle,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              largeVerticalSizedBox,
              Text(
                healthAssessmentDescription,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              largeVerticalSizedBox,
              smallVerticalSizedBox,

              // question one
              Text(
                healthAssessmentQuestionOne,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: notAtAllString,
                    isSelected: true,
                    gestureKey: questionOneNotAtAllDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: severalDays,
                    gestureKey: questionOneSeveralDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: moreThanHalfTheDaysString,
                    gestureKey: questionOneMoreThanHalfKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: nearlyEveryDay,
                    gestureKey: questionOneNearlyEverydayKey,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,

              // question two
              Text(
                healthAssessmentQuestionTwo,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: notAtAllString,
                    gestureKey: questionTwoNotAtAllDaysKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: severalDays,
                    gestureKey: questionTwoSeveralDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: moreThanHalfTheDaysString,
                    gestureKey: questionTwoMoreThanHalfKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: nearlyEveryDay,
                    gestureKey: questionTwoNearlyEverydayKey,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,

              // question three
              Text(
                healthAssessmentQuestionThree,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: notAtAllString,
                    gestureKey: questionThreeNotAtAllDaysKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: severalDays,
                    gestureKey: questionThreeSeveralDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: moreThanHalfTheDaysString,
                    gestureKey: questionThreeMoreThanHalfKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: nearlyEveryDay,
                    gestureKey: questionThreeNearlyEverydayKey,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,

              // question four
              Text(
                healthAssessmentQuestionFour,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: notAtAllString,
                    gestureKey: questionFourNotAtAllDaysKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: severalDays,
                    gestureKey: questionFourSeveralDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: moreThanHalfTheDaysString,
                    gestureKey: questionFourMoreThanHalfKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: nearlyEveryDay,
                    gestureKey: questionFourNearlyEverydayKey,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,

              // question five
              Text(
                healthAssessmentQuestionFive,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: notAtAllString,
                    gestureKey: questionFiveNotAtAllDaysKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: severalDays,
                    gestureKey: questionFiveSeveralDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: moreThanHalfTheDaysString,
                    gestureKey: questionFiveMoreThanHalfKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: nearlyEveryDay,
                    gestureKey: questionFiveNearlyEverydayKey,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,

              // question six
              Text(
                healthAssessmentQuestionSix,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: notAtAllString,
                    gestureKey: questionSixNotAtAllDaysKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: severalDays,
                    gestureKey: questionSixSeveralDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: moreThanHalfTheDaysString,
                    gestureKey: questionSixMoreThanHalfKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: nearlyEveryDay,
                    gestureKey: questionSixNearlyEverydayKey,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,

              // question seven
              Text(
                healthAssessmentQuestionSeven,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: notAtAllString,
                    gestureKey: questionSevenNotAtAllDaysKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: severalDays,
                    gestureKey: questionSevenSeveralDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: moreThanHalfTheDaysString,
                    gestureKey: questionSevenMoreThanHalfKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: nearlyEveryDay,
                    gestureKey: questionSevenNearlyEverydayKey,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,

              // question eight
              Text(
                healthAssessmentQuestionEight,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: notAtAllString,
                    gestureKey: questionEightNotAtAllDaysKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: severalDays,
                    gestureKey: questionEightSeveralDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: moreThanHalfTheDaysString,
                    gestureKey: questionEightMoreThanHalfKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: nearlyEveryDay,
                    gestureKey: questionEightNearlyEverydayKey,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,

              // question nine
              Text(
                healthAssessmentQuestionNine,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: notAtAllString,
                    gestureKey: questionNineNotAtAllDaysKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: severalDays,
                    gestureKey: questionNineSeveralDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: moreThanHalfTheDaysString,
                    gestureKey: questionNineMoreThanHalfKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: nearlyEveryDay,
                    gestureKey: questionNineNearlyEverydayKey,
                    onTap: () {},
                  ),
                ],
              ),
              mediumVerticalSizedBox,
              const Divider(),
              mediumVerticalSizedBox,
              // question ten
              Text(
                healthAssessmentQuestionTen,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
              ),
              size15VerticalSizedBox,
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: <Widget>[
                  MoodSymptomWidget(
                    title: notAtAllString,
                    gestureKey: questionTenNotAtAllDaysKey,
                    isSelected: true,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: severalDays,
                    gestureKey: questionTenSeveralDaysKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: moreThanHalfTheDaysString,
                    gestureKey: questionTenMoreThanHalfKey,
                    onTap: () {},
                  ),
                  MoodSymptomWidget(
                    title: nearlyEveryDay,
                    gestureKey: questionTenNearlyEverydayKey,
                    onTap: () {},
                  ),
                ],
              ),
              largeVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                child: MyAfyaHubPrimaryButton(
                  text: submitAssessment,
                  borderColor: Colors.transparent,
                  buttonKey: submitHealthAssessmentKey,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
