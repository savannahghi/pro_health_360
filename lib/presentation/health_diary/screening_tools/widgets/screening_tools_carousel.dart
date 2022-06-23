// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/redux/actions/screening_tools/fetch_available_screening_tools_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/screening_tools/screening_tools_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/screening_tool.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

// Package imports:
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/health_diary/screening_tools/widgets/screening_tool_menu_item.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';

class ScreeningToolsCarousel extends StatelessWidget {
  const ScreeningToolsCarousel();

  String getNextNavigationRoute(ScreeningToolsType toolsType) {
    switch (toolsType) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return AppRoutes.violenceAssessmentPage;

      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        return AppRoutes.contraceptiveAssessmentPage;

      case ScreeningToolsType.TB_ASSESSMENT:
        return AppRoutes.tuberculosisAssessmentPage;

      default:
        return AppRoutes.alcoholSubstanceUsePage;
    }
  }

  Key getSCreeningToolsBeginKey(ScreeningToolsType toolsType) {
    switch (toolsType) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return violenceKey;

      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        return contraceptiveKey;

      case ScreeningToolsType.TB_ASSESSMENT:
        return tuberculosisKey;

      default:
        return alcoholUseKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ScreeningToolsViewModel>(
      converter: (Store<AppState> store) {
        return ScreeningToolsViewModel.fromStore(store);
      },
      onInit: (Store<AppState> store) {
        store.dispatch(
          FetchAvailableScreeningToolsAction(
            client: AppWrapperBase.of(context)!.graphQLClient,
          ),
        );
      },
      builder: (BuildContext context, ScreeningToolsViewModel vm) {
        final int itemCount =
            vm.availableScreeningTools?.availableScreeningTools?.length ?? 0;

        return (vm.availableScreeningTools?.errorFetchingQuestions ?? false) ||
                (vm.availableScreeningTools?.timeoutFetchingQuestions ?? false)
            ? const SizedBox()
            : Column(
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
                              assessmentToolsTitle,
                              style:
                                  veryBoldSize16Text(AppColors.secondaryColor),
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
                          child: ListView.builder(
                            shrinkWrap: true,
                            cacheExtent: 4,
                            scrollDirection: Axis.horizontal,
                            itemCount: itemCount,
                            itemBuilder: (BuildContext context, int index) {
                              final ScreeningTool screeningTool = vm
                                  .availableScreeningTools!
                                  .availableScreeningTools![index];

                              final ScreeningToolsType toolsType =
                                  screeningTool.toolType!;

                              return HomePageCarouselItem(
                                type: HomePageCarouselItemType.SCREENING_TOOL,
                                title: screeningTool.title!,
                                description: screeningTool.description!,
                                onTap: () async {
                                  AnalyticsService().logEvent(
                                    name: viewScreeningToolEvent,
                                    eventType: AnalyticsEventType.NAVIGATION,
                                    parameters: <String, String>{
                                      'screeningToolType': toolsType.name
                                    },
                                  );
                                  Navigator.of(context).pushNamed(
                                    getNextNavigationRoute(toolsType),
                                  );
                                },
                                buttonTitle: beginString,
                                beginButtonKey:
                                    getSCreeningToolsBeginKey(toolsType),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}
