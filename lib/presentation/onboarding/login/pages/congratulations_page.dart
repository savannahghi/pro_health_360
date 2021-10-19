// Flutter imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/important_information_link_widget.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:myafyahub/presentation/router/routes.dart';
// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class CongratulationsPage extends StatefulWidget {
  final String duration;

  const CongratulationsPage({
    required this.duration,
  });

  @override
  _CongratulationsPageState createState() => _CongratulationsPageState();
}

class _CongratulationsPageState extends State<CongratulationsPage> {
  String? name;
  final GlobalKey<FormState> _congratulationsFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = MediaQuery.of(context).size.width / 6;

    return OnboardingScaffold(
      title: congratulationsPageTitle(widget.duration),
      description: congratulationsPageDescription,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            nickNameString,
            style: TextThemes.boldSize16Text(Colors.grey),
          ),
          smallVerticalSizedBox,
          Form(
            key: _congratulationsFormKey,
            child: CustomTextField(
              formFieldKey: nameInputKey,
              borderColor: Colors.grey.withOpacity(0.5),
              maxLines: 1,
              keyboardType: TextInputType.name,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return nameInputValidateString;
                }
              },
              onChanged: (String val) {
                setState(() {
                  name = val;
                });
              },
            ),
          ),
          SizedBox(height: sizedBoxHeight),
          Text(
            importantInformationString,
            style: TextThemes.boldSize16Text(AppColors.secondaryColor),
          ),
          smallVerticalSizedBox,
          ImportantInformationWidget(),
          verySmallVerticalSizedBox,
          ImportantInformationWidget(),
          verySmallVerticalSizedBox,
          ImportantInformationWidget(),
          largeVerticalSizedBox,
          SizedBox(
            width: double.infinity,
            height: 52,
            child: MyAfyaHubPrimaryButton(
              customRadius: 4,
              text: continueButtonText,
              buttonColor: AppColors.secondaryColor,
              borderColor: AppColors.secondaryColor,
              onPressed: () async {
                if (_congratulationsFormKey.currentState!.validate()) {
                  final UserProfile userProfile =
                      UserProfile.fromJson(loginResponse['profile']!);

                  await StoreProvider.dispatch<AppState>(
                    context,
                    UpdateUserProfileAction(
                      profile: userProfile,
                      userBioData: userProfile.userBioData,
                    ),
                  );

                  Navigator.pushReplacementNamed(
                    context,
                    BWRoutes.home,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
