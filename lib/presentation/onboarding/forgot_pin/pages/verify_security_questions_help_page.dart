import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

class VerifySecurityQuestionsHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              veryLargeVerticalSizedBox,
              SvgPicture.asset(
                pinRequestSentImage,
              ),
              largeVerticalSizedBox,
              Text(
                doYouNeedHelpString,
                style: heavySize20Text(),
                textAlign: TextAlign.center,
              ),
              smallVerticalSizedBox,
              Text(
                verifySecurityQuestionHelpMessageString,
                style: normalSize14Text(
                  darkGreyTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              mediumVerticalSizedBox,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  cccNumberString,
                  style: boldSize14Text(),
                  textAlign: TextAlign.start,
                ),
              ),
              smallVerticalSizedBox,
              CustomTextField(
                customFillColor: AppColors.greyTextColor.withOpacity(0.08),
                borderColor: Colors.transparent,
                focusedBorderColor: Colors.transparent,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              smallVerticalSizedBox,
              const SizedBox(
                width: double.infinity,
                height: 48,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: askForHelpButtonKey,
                  text: askForHelpString,
                ),
              ),
              smallVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                height: 48,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: askForHelpButtonKey,
                  text: tryAgainString,
                  buttonColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  textStyle: normalSize14Text(AppColors.redColor),
                  borderColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
