// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/core/widgets/pin_input_field_widget.dart';
import 'package:myafyahub/presentation/onboarding/widgets/my_afya_hub_onboarding_scaffold.dart';

class VerifyPhonePage extends StatefulWidget {
  final int otp;
  const VerifyPhonePage({required this.otp});

  @override
  _VerifyPhonePageState createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  bool isValid = false;
  TextEditingController otpEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void checkValidInput(String value) {
      if (widget.otp == int.parse(value)) {
        setState(() {
          isValid = true;
        });
      } else {
        setState(() {
          isValid = false;
        });
      }
    }

    return MyAfyaHubOnboardingScaffold(
      title: verifyPhoneNumberTitle,
      description: verifyPhoneNumberDescription,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            enterOTPString,
            style: TextThemes.boldSize16Text(AppColors.secondaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Center(
              child: Column(
                children: <Widget>[
                  PINInputField(
                    maxLength: 4,
                    onDone: checkValidInput,
                    controller: otpEditingController,
                  ),
                  smallVerticalSizedBox,
                  if (!isValid && otpEditingController.value.text.isNotEmpty)
                    Text(
                      invalidOTPString,
                      style: TextThemes.boldSize16Text(Colors.red),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: MyAfyaHubPrimaryButton(
                customRadius: 4,
                text: confirmOTPButtonString,
                buttonColor: isValid ? AppColors.secondaryColor : Colors.grey,
                borderColor: isValid ? AppColors.secondaryColor : Colors.grey,
                onPressed: !isValid
                    ? null
                    : () {
                        Navigator.pushReplacementNamed(
                          context,
                          BWRoutes.termsAndConditions,
                        );
                      },
              ),
            ),
          )
        ],
      ),
    );
  }
}
