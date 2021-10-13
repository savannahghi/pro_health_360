// Flutter imports:
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/buttons.dart';
import 'package:myafyahub/presentation/router/routes.dart';
// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// [CreateNewPINPage] has two [CustomTextField] to create new user PIN
///
/// The [CustomTextField] for confirm PIN validates if it matches the
/// PIN entered in the above [CustomTextField]

class CreateNewPINPage extends StatefulWidget {
  @override
  _CreateNewPINPageState createState() => _CreateNewPINPageState();
}

class _CreateNewPINPageState extends State<CreateNewPINPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController pinController = TextEditingController();
  late String pin = '';
  late String confirmPin = '';

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: createNewPINTitleString,
      description: createNewPINSubTitleString,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.6,
        child: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    pinString,
                    style: TextThemes.boldSize14Text(AppColors.greyTextColor),
                  ),
                ),
                verySmallVerticalSizedBox,
                CustomTextField(
                  formFieldKey: pinInputKey,
                  borderColor: Colors.grey[200],
                  maxLength: 4,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  validator: userPinValidator,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (String val) {
                    setState(() {
                      pin = val.toString();
                    });
                  },
                ),
                verySmallVerticalSizedBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    confirmPinString,
                    style: TextThemes.boldSize14Text(AppColors.greyTextColor),
                  ),
                ),
                verySmallVerticalSizedBox,
                CustomTextField(
                  formFieldKey: confirmPinInputKey,
                  borderColor: Colors.grey[200],
                  maxLength: 4,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  validator: userPinValidator,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (String val) {
                    setState(() {
                      confirmPin = val.toString();
                    });
                  },
                ),
              ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: MyAfyaHubPrimaryButton(
                  buttonKey: createPINContinueButtonKey,
                  onPressed: () {
                    if (!confirmPinValidator(pin, confirmPin)) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(pinMustMatchString),
                        duration: Duration(seconds: 2),
                      ));
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                          context, BWRoutes.congratulationsPage,
                          arguments: <String, String>{
                            'duration': '2 years',
                          });
                    }
                  },
                  buttonColor: AppColors.secondaryColor,
                  borderColor: Colors.transparent,
                  text: saveAndContinueButtonText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
