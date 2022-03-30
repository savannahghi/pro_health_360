// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

// Package imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tool_menu_item.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

class ScreeningToolsCarousel extends StatelessWidget {
  const ScreeningToolsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    assessmentToolsTitle,
                    style: veryBoldSize16Text(AppColors.secondaryColor),
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(verticalScrollIconSvgPath),
                      verySmallHorizontalSizedBox,
                      Text(
                        scrollForMoreString,
                        style: boldSize13Text(AppColors.greyTextColor.withOpacity(0.8)),
                      )
                    ],
                  )
                ],
              ),
              smallVerticalSizedBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  key: screeningToolsCarouselListViewKey,
                  children: <Widget>[
                    ScreeningToolMenuItem(
                      title: violenceTitle,
                      description: violenceDescription,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.violenceAssessmentPage);
                      },
                      beginButtonKey: violenceKey,
                    ),
                    ScreeningToolMenuItem(
                      title: contraceptiveTitle,
                      description: contraceptiveDescription,
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.contraceptiveAssessmentPage,
                      ),
                      beginButtonKey: contraceptiveKey,
                    ),
                    ScreeningToolMenuItem(
                      title: tuberculosisTitle,
                      description: tuberculosisDescription,
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.tuberculosisAssessmentPage,
                      ),
                      beginButtonKey: tuberculosisKey,
                    ),
                    ScreeningToolMenuItem(
                      title: alcoholSubstanceUseTitle,
                      description: alcoholSubstanceDescription,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.alcoholSubstanceUsePage);
                      },
                      beginButtonKey: alcoholUseKey,
                    ),
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
