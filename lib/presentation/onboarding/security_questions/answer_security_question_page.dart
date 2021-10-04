import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/inputs.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class AnswerSecurityQuestionPage extends StatelessWidget {
  const AnswerSecurityQuestionPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: authBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              veryLargeHorizontalSizedBox,
              Text(
                answerSecurityQuestionString,
                style:
                    TextThemes.normalSize34Text(Theme.of(context).primaryColor),
              ),
              mediumVerticalSizedBox,
              Text(
                answerCorrectlyToGainAccessString,
                style:
                    TextThemes.normalSize14Text().copyWith(color: subtitleGrey),
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
              const Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                      width: double.infinity,
                      height: number52,
                      child: MyAfyaHubPrimaryButton(
                        text: continueString,
                        buttonColor: AppColors.secondaryColor,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
