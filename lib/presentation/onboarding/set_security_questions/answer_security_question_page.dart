// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class AnswerSecurityQuestionPage extends StatelessWidget {
  const AnswerSecurityQuestionPage();

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.authBackgroundColor,
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
                    height: 52,
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
