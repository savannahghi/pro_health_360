// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/custom_client.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/medical_data/fetch_next_refill_data_action.dart';
import 'package:myafyahub/application/redux/actions/medical_data/fetch_viral_load_data_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/client_profile_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/entities/viral_load/viral_load_node.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/my_health/widgets/profile_health_details_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class MyHealthPage extends StatefulWidget {
  const MyHealthPage({this.graphQlClient});
  final IGraphQlClient? graphQlClient;
  @override
  State<MyHealthPage> createState() => _MyHealthPageState();
}

class _MyHealthPageState extends State<MyHealthPage> {
  late IGraphQlClient client;

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
      bottomNavIndex: 3,
      appBar: const CustomAppBar(
        title: myHealthPageTitle,
        showBackButton: false,
        bottomNavIndex: 3,
      ),
      body: StoreConnector<AppState, ClientProfileViewModel>(
        onInit: (Store<AppState> store) {
          final List<AppContext> contexts =
              AppWrapperBase.of(context)!.appContexts;
          final AppSetupData appSetupData = getAppSetupData(contexts.last);
          final String graphqlEndpoint = appSetupData.clinicalEndpoint;
          final String refreshTokenEndpoint =
              appSetupData.customContext?.refreshTokenEndpoint ?? '';

          final String idToken = store.state.credentials?.idToken ?? '';
          final String userID = StoreProvider.state<AppState>(context)
                  ?.clientState
                  ?.user
                  ?.userId ??
              '';

          if (widget.graphQlClient != null) {
            client = widget.graphQlClient!;
          } else {
            client = CustomClient(
              idToken,
              graphqlEndpoint,
              context: context,
              refreshTokenEndpoint: refreshTokenEndpoint,
              userID: userID,
            );
          }

          store.dispatch(
            FetchViralLoadDataAction(httpClient: client),
          );

          store.dispatch(
            FetchNextRefillDataAction(
              httpClient: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
        },
        converter: (Store<AppState> store) =>
            ClientProfileViewModel.fromStore(store),
        builder: (BuildContext context, ClientProfileViewModel vm) {
          final User? userProfileState = vm.clientState?.user;
          final String firstName = userProfileState?.firstName ?? '';
          final String lastName = userProfileState?.lastName ?? '';
          final List<ViralLoadNode?> viralLoadData =
              vm.clientState?.viralLoadData?.edges ?? <ViralLoadNode>[];

          final String nextRefill =
              vm.clientState?.nextRefillData?.nextRefill ?? '';
          final Map<String, String> nextRefillDate =
              extractNextRefillDate(nextRefill);

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.userProfilePage),
                    child: InformationListCard(
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
                    ),
                  ),
                  size15VerticalSizedBox,
                  if (vm.wait!.isWaitingFor(fetchViralLoadDataFlag))
                    Container(
                      height: 300,
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      child: const PlatformLoader(),
                    ),
                  if (!vm.wait!.isWaitingFor(fetchViralLoadDataFlag) &&
                      (viralLoadData.isNotEmpty || nextRefill.isNotEmpty))
                    Row(
                      children: <Widget>[
                        if (viralLoadData.isNotEmpty)
                          Expanded(
                            child: ProfileHealthDetailsWidget(
                              svgPath: viralLoadIcon,
                              title: myHealthViralLoad,
                              description:
                                  viralLoadData.first?.node?.valueString ?? '',
                              descriptionSubScript:
                                  myHealthViralLoadReadingUnit,
                            ),
                          ),
                        if (viralLoadData.isNotEmpty) smallHorizontalSizedBox,
                        if (nextRefill.isNotEmpty)
                          Expanded(
                            child: ProfileHealthDetailsWidget(
                              svgPath: nextRefillIcon,
                              title: myHealthNextRefill,
                              description: nextRefillDate['day'] ?? '',
                              descriptionSubScript:
                                  nextRefillDate['month'] ?? '',
                            ),
                          ),
                        if (viralLoadData.isEmpty) smallHorizontalSizedBox,
                        if (nextRefill.isEmpty || viralLoadData.isEmpty)
                          const Spacer(),
                      ],
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
                      Expanded(
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
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRoutes.myHealthTimeline),
                          child: InformationListCard(
                            title: Text(
                              healthTimelineText,
                              style: normalSize12Text(AppColors.greyTextColor),
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
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
