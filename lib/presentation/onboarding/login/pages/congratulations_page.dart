import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/important_information_link_widget.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/onboarding/widgets/my_afya_hub_onboarding_scaffold.dart';
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

    return MyAfyaHubOnboardingScaffold(
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
              style: TextThemes.boldSize16Text(Theme.of(context).primaryColor),
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
                buttonColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                onPressed: () {
                  if (_congratulationsFormKey.currentState!.validate()) {}
                },
              ),
            )
          ],
        ));
  }
}
