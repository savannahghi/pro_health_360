// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:misc_utilities/number_constants.dart';
import 'package:misc_utilities/responsive_widget.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/inputs.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/onboarding/widgets/my_afya_hub_onboarding_scaffold.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class SecurityQuestionsPage extends StatelessWidget {
  const SecurityQuestionsPage();

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    return MyAfyaHubOnboardingScaffold(
      title: setSecurityQuestionsString,
      description: securityQuestionsDescriptionString,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.6,
        child: Stack(children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
              ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: isLargeScreen ? number300 : double.infinity,
              height: number52,
              child: MyAfyaHubPrimaryButton(
                text: saveAndContinueButtonText,
                buttonColor: AppColors.secondaryColor,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, BWRoutes.createPin);
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
