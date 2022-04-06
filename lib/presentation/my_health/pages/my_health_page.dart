// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/client_profile_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/my_health/widgets/profile_health_details_widget.dart';
import 'package:myafyahub/presentation/profile/health_timeline/my_health_timeline.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class MyHealthPage extends StatefulWidget {
  @override
  State<MyHealthPage> createState() => _MyHealthPageState();
}

class _MyHealthPageState extends State<MyHealthPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      if (shouldInputPIN(context)) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.pinInputPage,
        );
      }
    });
  }

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
                    Navigator.pushNamed(context, AppRoutes.userProfilePage),
                child: StoreConnector<AppState, ClientProfileViewModel>(
                  converter: (Store<AppState> store) =>
                      ClientProfileViewModel.fromStore(store),
                  builder: (BuildContext context, ClientProfileViewModel vm) {
                    final User? userProfileState = vm.clientState?.user;
                    final String firstName = userProfileState?.firstName ?? '';
                    final String lastName = userProfileState?.lastName ?? '';

                    return InformationListCard(
                      title: Text(
                        myHealthPageProfile,
                        style: boldSize16Text(AppColors.secondaryColor),
                      ),
                      alternateLeadingIcon: Container(
                        padding: const EdgeInsets.all(13.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor.withOpacity(0.1),
                        ),
                        child: Center(
                          child: Text(
                            extractNamesInitials(
                              name: getDisplayName(userProfileState),
                            ),
                            style: boldSize20Text(
                              AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      body: Text(
                        '$firstName $lastName',
                        style: normalSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                    );
                  },
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
                        AppRoutes.myHealthDiaryPage,
                      ),
                      child: InformationListCard(
                        title: Text(
                          myHealthPageHealthDiary,
                          style: normalSize12Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        alternateLeadingIcon: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            healthDiaryIcon,
                            width: 20,
                            height: 20,
                            color: AppColors.primaryColor,
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
                        AppRoutes.appointmentsPage,
                      ),
                      child: InformationListCard(
                        title: Text(
                          myHealthPageAppointments,
                          style: normalSize12Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        alternateLeadingIcon: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            appointmentIcon,
                            width: 20,
                            height: 20,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              size15VerticalSizedBox,
              Row(
                children: <Widget>[
                  Flexible(
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.medicalData,
                      ),
                      child: InformationListCard(
                        title: Text(
                          medicalDataTitle,
                          style: normalSize12Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        alternateLeadingIcon: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            medicalDataIcon,
                            width: 20,
                            height: 20,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  smallHorizontalSizedBox,
                  const Flexible(
                    child: SizedBox(
                      width: double.infinity,
                    ),
                  )
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
