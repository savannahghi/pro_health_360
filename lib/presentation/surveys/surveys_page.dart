import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/spaces.dart';

import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/surveys/widgets/survey_item.dart';

class SurveysPage extends StatelessWidget {
  const SurveysPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: surveys),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(surveysImage),
              size15VerticalSizedBox,
              Text(
                surveysTitle,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              largeVerticalSizedBox,
              const SurveyItem(
                gestureKey: healthSurveyKey,
                url:
                    'https://mycarehub.odk.savannahghi.org/-/single/7YNzF5TjcVpp86Q2D5C4EIL3EGQjYkW?st=uUMj9fDZBC8l41CCkLSkiLPkko8cpM4ocE5hABkcCLSZAJc6zKB4aCYYwr5LtFTk',
                title: healthSurvey,
                description: healthSurveyDescription,
              ),
              verySmallVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
