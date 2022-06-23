import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pro_health_360/application/redux/actions/surveys/fetch_available_surveys_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/entities/surveys/survey.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/surveys/widgets/survey_item.dart';
import 'package:pro_health_360/presentation/surveys/widgets/survey_zero_state_widget.dart';

class SurveysPage extends StatelessWidget {
  const SurveysPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: surveys),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: StoreConnector<AppState, AppStateViewModel>(
            converter: (Store<AppState> store) {
              return AppStateViewModel.fromStore(store);
            },
            onInit: (Store<AppState> store) {
              store.dispatch(
                FetchAvailableSurveysAction(
                  client: AppWrapperBase.of(context)!.graphQLClient,
                ),
              );
            },
            builder: (BuildContext context, AppStateViewModel state) {
              final List<Survey> availableSurveys =
                  state.appState.miscState!.availableSurveysList ?? <Survey>[];
              if (state.wait!.isWaitingFor(fetchAvailableSurveysFlag)) {
                return Container(
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  child: const PlatformLoader(),
                );
              }
              if (availableSurveys.isEmpty) {
                return const SurveyZeroStateWidget();
              }

              final List<Widget> surveysWidgetList = <Widget>[];
              availableSurveys.map(
                (Survey survey) {
                  surveysWidgetList.add(
                    Column(
                      children: <Widget>[
                        SurveyItem(
                          gestureKey: Key(
                            survey.title!,
                          ),
                          url: survey.link!,
                          title: survey.title!,
                        ),
                        verySmallVerticalSizedBox,
                      ],
                    ),
                  );
                },
              ).toList();
              return Column(
                children: <Widget>[
                  SvgPicture.asset(surveysImage),
                  size15VerticalSizedBox,
                  Text(
                    surveysTitle,
                    style: normalSize14Text(AppColors.greyTextColor),
                  ),
                  largeVerticalSizedBox,
                  ...surveysWidgetList,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
