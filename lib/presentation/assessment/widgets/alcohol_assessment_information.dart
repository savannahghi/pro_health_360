import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class AlcoholAssessmentInformation extends StatelessWidget {
  const AlcoholAssessmentInformation();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: RichText(
            text: TextSpan(
              text: responseConfidential,
              style: normalSize14Text(
                AppColors.greyTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: facilitiesSpace,
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
