// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/fetch_available_screening_tools_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/screening_tools/screening_tools_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/screening_tool.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

// Package imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tool_menu_item.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

class ScreeningToolsCarousel extends StatefulWidget {
  const ScreeningToolsCarousel();

  @override
  State<ScreeningToolsCarousel> createState() => _ScreeningToolsCarouselState();
}

class _ScreeningToolsCarouselState extends State<ScreeningToolsCarousel> {
  @override
  void didChangeDependencies() {
    StoreProvider.dispatch(
      context,
      FetchAvailableScreeningToolsAction(
        client: AppWrapperBase.of(context)!.graphQLClient,
      ),
    );
    super.didChangeDependencies();
  }

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
                child: StoreConnector<AppState, ScreeningToolsViewModel>(
                  converter: (Store<AppState> store) {
                    return ScreeningToolsViewModel.fromStore(store);
                  },
                  builder: (BuildContext context, ScreeningToolsViewModel vm) {
                    final int itemCount = vm.availableScreeningTools
                            ?.availableScreeningTools?.length ??
                        0;
                    return (vm.availableScreeningTools
                                    ?.errorFetchingQuestions ??
                                false) ||
                            (vm.availableScreeningTools
                                    ?.timeoutFetchingQuestions ??
                                false)
                        ? const SizedBox()
                        : ListView.builder(
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

                              return ScreeningToolMenuItem(
                                title: screeningTool.title!,
                                description: screeningTool.description!,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    getNextNavigationRoute(toolsType),
                                  );
                                },
                                beginButtonKey:
                                    getSCreeningToolsBeginKey(toolsType),
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
