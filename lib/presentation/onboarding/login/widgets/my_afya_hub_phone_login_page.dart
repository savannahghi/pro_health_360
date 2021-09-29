import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/my_afya_hub_phone_input_field.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/onboarding/widgets/my_afya_hub_header_scaffold.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// [MyAfyaHubPhoneLoginPage] is parsed in [PhoneNumberLoginPage]
///
/// It consists of [MyAfyaHubPhoneInput] used to user input PhoneNumber,
///  [CustomTextField] to input PIN and [MyAfyaHubPrimaryButton] as submit button
class MyAfyaHubPhoneLoginPage extends StatefulWidget {
  @override
  _MyAfyaHubPhoneLoginPageState createState() =>
      _MyAfyaHubPhoneLoginPageState();
}

class _MyAfyaHubPhoneLoginPageState extends State<MyAfyaHubPhoneLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController phoneNumberInputController =
      TextEditingController();

  TextEditingController pinController = TextEditingController();
  String? phoneNumber;
  String? pin;


  @override
  void dispose() {
    pinController.dispose();
    phoneNumberInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.timeLineBackroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        preferredPaddingOnStretchedScreens(context: context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    veryLargeVerticalSizedBox,
                    veryLargeVerticalSizedBox,
                    const MyAfyaHubScaffoldHeader(
                      title: loginPageTitleString,
                      description: loginPageSubTitleString,
                    ),
                    largeVerticalSizedBox,
                    Text(
                      phoneNumberString,
                      style: TextThemes.boldSize14Text(AppColors.greyTextColor),
                    ),
                    MyAfyaHubPhoneInput(
                      phoneNumberFormatter: formatPhoneNumber,
                      inputController: phoneNumberInputController,
                      labelText: enterPhoneNumberString,
                      onChanged: (String? val) {
                        setState(() {
                          phoneNumber = val?.toString();
                        });
                      },
                    ),
                    largeVerticalSizedBox,
                    Text(
                      pinString,
                      style: TextThemes.boldSize14Text(AppColors.greyTextColor),
                    ),
                    CustomTextField(
                      formFieldKey: pinInputKey,
                      borderColor: Colors.grey[200],
                      maxLength: 4,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      labelText: enterYourString,
                      validator: userPinValidator,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (String val) {
                        pin = val.toString();
                      },
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: MyAfyaHubPrimaryButton(
                            buttonKey: phoneLoginContinueButtonKey,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                return;
                              }
                            },
                            buttonColor: AppColors.secondaryColor,
                            borderColor: Colors.transparent,
                            text: continueString,
                          ),
                        ),
                      ),
                    ),
                    mediumVerticalSizedBox,
                    largeVerticalSizedBox,
                  ],
                ),
              ),
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
