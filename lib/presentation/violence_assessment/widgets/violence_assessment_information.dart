import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class ViolenceAssessmentInformation extends StatelessWidget {
  const ViolenceAssessmentInformation();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: RichText(
            text: TextSpan(
              text: yourResponseWillBeConfidential,
              style: normalSize14Text(
                AppColors.greyTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: weAlsoUrgeYou,
                  style: normalSize14Text(
                    AppColors.greyTextColor,
                  ),
                ),
                TextSpan(
                  text: visitTheClinicSoon,
                  style: veryHeavySize14Text(
                    AppColors.greyTextColor,
                  ),
                ),
                TextSpan(
                  text: asFormsOfGBVSting,
                  style: normalSize14Text(
                    AppColors.greyTextColor,
                  ),
                ),
                TextSpan(
                  text: sexualAssault,
                  style: veryHeavySize14Text(
                    AppColors.greyTextColor,
                  ),
                ),
                TextSpan(
                  text: requireFirstAidServices,
                  style: normalSize14Text(
                    AppColors.greyTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
