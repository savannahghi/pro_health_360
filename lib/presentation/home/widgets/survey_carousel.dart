import 'package:flutter/material.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tool_menu_item.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

class SurveyCarousel extends StatelessWidget {
  const SurveyCarousel();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    surveys,
                    style: veryBoldSize16Text(AppColors.secondaryColor),
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(verticalScrollIconSvgPath),
                      verySmallHorizontalSizedBox,
                      Text(
                        scrollForMoreString,
                        style: boldSize13Text(
                          AppColors.greyTextColor.withOpacity(0.8),
                        ),
                      )
                    ],
                  )
                ],
              ),
              smallVerticalSizedBox,
              SizedBox(
                height: 170,
                child: ListView(
                  shrinkWrap: true,
                  cacheExtent: 4,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    HomePageCarouselItem(
                      title: 'PHQ-9',
                      description: 'A survey to assess your mental health',
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.surveysPage);
                      },
                      beginButtonKey: phq9surveyKey,
                      buttonTitle: respondString,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
