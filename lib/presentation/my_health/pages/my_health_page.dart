// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/information_list_card.dart';
import 'package:myafyahub/presentation/my_health/widgets/profile_health_details_widget.dart';

class MyHealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAfyaHubAppBar(
        title: myHealthPageTitle,
        leadingWidget: SvgPicture.asset(
          backIcon,
          color: AppColors.secondaryColor,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, BWRoutes.userProfilePage),
                child: InformationListCard(
                  title: Text(
                    myHealthPageProfile,
                    style: TextThemes.boldSize16Text(AppColors.secondaryColor),
                  ),
                  alternateLeadingIcon: Container(
                    padding: const EdgeInsets.all(13.5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.cyan,
                    ),
                    child: Center(
                      child: Text(
                        initials,
                        style: TextThemes.boldSize20Text(
                          AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                  body: Text(
                    myHealthPagePatient,
                    style: TextThemes.normalSize14Text(AppColors.secondaryColor),
                  ),
                ),
              ),
              size15VerticalSizedBox,
              Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const <Widget>[
                    ProfileHealthDetailsWidget(
                      svgPath: viralLoadIcon,
                      title: myHealthViralLoad,
                      description: myHealthViralLoadReading,
                      descriptionSubScript: myHealthViralLoadReadingUnit,
                    ),
                    ProfileHealthDetailsWidget(
                      svgPath: nextRefillIcon,
                      title: myHealthNextRefill,
                      description: myHealthNextRefillDate,
                      descriptionSubScript: myHealthNextRefillMonth,
                    ),
                  ],
                ),
              ),
              size15VerticalSizedBox,
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, BWRoutes.myHealthDiaryPage),
                      child: InformationListCard(
                        title: Text(myHealthPageHealthDiary,
                            style: TextThemes.normalSize14Text(
                                AppColors.secondaryColor)),
                        alternateLeadingIcon: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            healthDiaryIcon,
                            width: 20,
                            height: 20,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                    
                  ),
                  smallHorizontalSizedBox,
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, BWRoutes.appointmentsPage),
                      child: InformationListCard(
                        title: Text(
                          myHealthPageAppointments,
                          style: TextThemes.normalSize14Text(
                              AppColors.secondaryColor),
                        ),
                        alternateLeadingIcon: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            appointmentIcon,
                            width: 20,
                            height: 20,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
