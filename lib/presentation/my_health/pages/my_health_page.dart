// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/information_list_card.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/my_health/widgets/profile_health_details_widget.dart';
import 'package:myafyahub/presentation/profile/widgets/my_health_timeline.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class MyHealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: myHealthPageTitle,
        showBackButton: false,
      ),
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
                      child: StoreConnector<AppState, ClientProfileViewModel>(
                        converter: (Store<AppState> store) =>
                            ClientProfileViewModel.fromStore(store),
                        builder:
                            (BuildContext context, ClientProfileViewModel vm) {
                          final User? userProfileState = vm.clientState?.user;

                          return Text(
                            extractNamesInitials(
                              name: getDisplayName(userProfileState),
                            ),
                            style: TextThemes.boldSize20Text(
                              AppColors.secondaryColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  body: Text(
                    myHealthPagePatient,
                    style: TextThemes.normalSize14Text(
                      AppColors.greyTextColor,
                    ),
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
                        context,
                        BWRoutes.myHealthDiaryPage,
                      ),
                      child: InformationListCard(
                        title: Text(
                          myHealthPageHealthDiary,
                          style: TextThemes.normalSize12Text(
                            AppColors.secondaryColor,
                          ),
                        ),
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
                        context,
                        BWRoutes.appointmentsPage,
                      ),
                      child: InformationListCard(
                        title: Text(
                          myHealthPageAppointments,
                          style: TextThemes.normalSize12Text(
                            AppColors.secondaryColor,
                          ),
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
              const SizedBox(height: 20),
              const MyHealthTimeline(),
            ],
          ),
        ),
      ),
    );
  }
}
