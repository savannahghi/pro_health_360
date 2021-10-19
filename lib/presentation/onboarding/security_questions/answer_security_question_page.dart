// Flutter imports:
import 'package:afya_moja_core/inputs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/number_constants.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:afya_moja_core/buttons.dart';

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
                    ),
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
