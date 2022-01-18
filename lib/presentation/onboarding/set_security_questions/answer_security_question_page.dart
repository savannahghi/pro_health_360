// Flutter imports:

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:afya_moja_core/text_themes.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/number_constants.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

class AnswerSecurityQuestionPage extends StatelessWidget {
  const AnswerSecurityQuestionPage();

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();
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
                style: normalSize34Text(Theme.of(context).primaryColor),
              ),
              mediumVerticalSizedBox,
              Text(
                answerCorrectlyToGainAccessString,
                style: normalSize14Text().copyWith(color: subtitleGrey),
              ),
              mediumVerticalSizedBox,
              ExpandableQuestion(
                dateController: dateController,
                question: whereWereYouBornString,
                hintText: answerHereString,
                onChanged: (String? value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value.toString())));
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
