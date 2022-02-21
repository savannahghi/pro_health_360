// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class SuccessfulAssessmentSubmissionPage extends StatelessWidget {
  const SuccessfulAssessmentSubmissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 28),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                SvgPicture.asset(
                  successfulAssessmentSubmissionImage,
                  height: 286.0,
                  width: 286.0,
                ),
                const SizedBox(height: 20),
                const Text(
                  assessmentSubmissionSuccessfulText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const <Widget>[
                    Flexible(
                      child: Text(
                        assessmentSubmissionSuccessfulDescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                largeVerticalSizedBox,
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    text: okThanksText,
                    textColor: AppColors.whiteColor,
                    buttonColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.screeningToolsListPage,
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
