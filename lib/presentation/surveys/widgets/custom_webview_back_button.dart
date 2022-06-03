import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/redux/actions/surveys/verify_survey_submission_action.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class CustomWebviewBackButton extends StatelessWidget {
  const CustomWebviewBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.whiteColor,
      child: InkWell(
        key: appBarBackButtonKey,
        borderRadius: BorderRadius.circular(50),
        splashColor: Theme.of(context).colorScheme.secondary,
        onTap: () async {
          if (Navigator.canPop(context)) {
            StoreProvider.dispatch(
              context,
              VerifySurveySubmissionAction(
                client: AppWrapperBase.of(context)!.graphQLClient,
              ),
            );

            Navigator.of(context).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(
            backIconPath,
            color: AppColors.secondaryColor,
            width: 24,
          ),
        ),
      ),
    );
  }
}
