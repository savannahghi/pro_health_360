import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/consent_confirmation/widgets/consent_confirmation_dialog.dart';
import 'package:shared_themes/spaces.dart';

class ConsentConfirmationPage extends StatelessWidget {
  const ConsentConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              largeVerticalSizedBox,
              SvgPicture.asset(consentConfirmationImage),
              Text(
                optOutOfMyCareHub,
                style: veryBoldSize20Text(AppColors.primaryColor),
              ),
              mediumVerticalSizedBox,
              Text(
                youAreChoosingToOptOut,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              smallVerticalSizedBox,
              Text(
                yourProfileWillBeDeleted,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              verySmallVerticalSizedBox,
              Text(
                youWillNotLogin,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              Text(
                areYouStillSure,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              veryLargeVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: abortConsentButtonKey,
                  text: noGoBack,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              smallVerticalSizedBox,
              SizedBox(
                width: double.infinity,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: continueConsentButtonKey,
                  text: yesContinue,
                  buttonColor: AppColors.primaryColor.withOpacity(0.1),
                  textColor: AppColors.lightRedTextColor,
                  borderColor: Colors.transparent,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ConsentConfirmationDialog();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
