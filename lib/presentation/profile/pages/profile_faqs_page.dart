// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:afya_moja_core/buttons.dart';

class ProfileFaqsPage extends StatelessWidget {
  const ProfileFaqsPage();

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    return Scaffold(
      appBar: const CustomAppBar(title: faqsText),
      backgroundColor: authBackgroundColor,
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
                  ExpandableQuestion(
                    question: howDoIUpdateMyProfileText,
                    hintText: answerHereString,
                    onChanged: (String value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    },
                  ),
                  smallVerticalSizedBox,
                  ExpandableQuestion(
                    question: howDoICheckMyMedicalInfoText,
                    hintText: answerHereString,
                    onChanged: (String value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    },
                  ),
                  smallVerticalSizedBox,
                  ExpandableQuestion(
                    question: howDoIUpdateMyNicknameText,
                    hintText: answerHereString,
                    onChanged: (String value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    },
                  ),
                  smallVerticalSizedBox,
                  ExpandableQuestion(
                    question: howDoIRescheduleAnAppointmentText,
                    hintText: answerHereString,
                    onChanged: (String value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    },
                  ),
                  veryLargeVerticalSizedBox,
                  veryLargeVerticalSizedBox,
                  SizedBox(
                      width: isLargeScreen ? number300 : double.infinity,
                      height: number52,
                      child: const MyAfyaHubPrimaryButton(
                        text: saveAndContinueButtonText,
                        buttonColor: AppColors.secondaryColor,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
