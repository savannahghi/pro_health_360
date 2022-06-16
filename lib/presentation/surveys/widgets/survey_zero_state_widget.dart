import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/redux/actions/surveys/fetch_available_surveys_action.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class SurveyZeroStateWidget extends StatelessWidget {
  const SurveyZeroStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SvgPicture.asset(surveyZeroStateImage),
          mediumVerticalSizedBox,
          Text(
            noStringsAvailable,
            style: boldSize22Text(AppColors.greyTextColor),
          ),
          mediumVerticalSizedBox,
          Text(
            noStringsAvailableDescription,
            style: normalSize15Text(AppColors.greyTextColor),
            textAlign: TextAlign.center,
          ),
          size15VerticalSizedBox,
          Text(
            recheckAvailableSurveys,
            style: normalSize15Text(AppColors.greyTextColor),
            textAlign: TextAlign.center,
          ),
          size40VerticalSizedBox,
          SizedBox(
            width: double.infinity,
            height: 48,
            child: MyAfyaHubPrimaryButton(
              text: retryButtonText,
              onPressed: () {
                StoreProvider.dispatch(
                  context,
                  FetchAvailableSurveysAction(
                    client: AppWrapperBase.of(context)!.graphQLClient,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
