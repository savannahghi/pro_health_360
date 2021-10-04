import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/inputs.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class SecurityQuestionsPage extends StatelessWidget {
  const SecurityQuestionsPage();

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    return Scaffold(
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
                    setSecurityQuestionsString,
                    style: TextThemes.normalSize34Text(
                        Theme.of(context).primaryColor),
                  ),
                  mediumVerticalSizedBox,
                  Text(
                    securityQuestionsDescriptionString,
                    style: TextThemes.normalSize14Text()
                        .copyWith(color: subtitleGrey),
                  ),
                  mediumVerticalSizedBox,
                  ExpandableQuestion(
                    question: whereWereYouBornString,
                    hintText: answerHereString,
                    onChanged: (String value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    },
                  ),
                  smallVerticalSizedBox,
                  ExpandableQuestion(
                    question: whatsTheNameOfYourPetString,
                    hintText: answerHereString,
                    onChanged: (String value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    },
                  ),
                  smallVerticalSizedBox,
                  ExpandableQuestion(
                    question: whatsYourFavouriteFoodString,
                    hintText: answerHereString,
                    onChanged: (String value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    },
                  ),
                  smallVerticalSizedBox,
                  ExpandableQuestion(
                    question: whereDidYouFirstLiveString,
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
