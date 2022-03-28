// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/assessment/widgets/alcohol_assessment_information.dart';
import 'package:myafyahub/presentation/assessment/widgets/contraceptive_information.dart';
import 'package:myafyahub/presentation/assessment/widgets/tb_assessment_information.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/presentation/violence_assessment/widgets/violence_assessment_information.dart';
import 'package:shared_themes/spaces.dart';

class SuccessfulAssessmentSubmissionPage extends StatelessWidget {
  const SuccessfulAssessmentSubmissionPage({required this.screeningToolsType});

  final ScreeningToolsType screeningToolsType;

  Widget buildInformationWidget(ScreeningToolsType screeningToolsType) {
    switch (screeningToolsType) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return const ViolenceAssessmentInformation();

      case ScreeningToolsType.TB_ASSESSMENT:
        return const TBAssessmentInformation();

      case ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT:
        return const AlcoholAssessmentInformation();

      default:
        return const ContraceptivesInformation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  successfulAssessmentSubmissionImage,
                  height: 286.0,
                  width: 286.0,
                ),
                mediumVerticalSizedBox,
                const Text(
                  assessmentSubmissionSuccessfulText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                mediumVerticalSizedBox,
                buildInformationWidget(screeningToolsType),
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
