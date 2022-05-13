import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/redux/actions/surveys/fetch_available_surveys_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
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
            final MiscState miscState = state.appState.miscState!;
            return Column(
              children: <Widget>[
                SvgPicture.asset(surveysImage),
                size15VerticalSizedBox,
                Text(
                  surveysTitle,
                  style: normalSize14Text(AppColors.greyTextColor),
                ),
                largeVerticalSizedBox,
                ListView.builder(
                  shrinkWrap: true,
                  cacheExtent: 4,
                  itemCount: miscState.availableSurveysList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        SurveyItem(
                          gestureKey: Key(
                            miscState.availableSurveysList![index].title!,
                          ),
                          url: miscState.availableSurveysList![index].link!,
                          title: miscState.availableSurveysList![index].title!,
                        ),
                        verySmallVerticalSizedBox,
                      ],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
