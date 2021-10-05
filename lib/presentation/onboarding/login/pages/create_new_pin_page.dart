import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/custom_text_field.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/onboarding/widgets/my_afya_hub_header_scaffold.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/application/core/services/utils.dart';
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
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
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
                    const SizedBox(
                      height: Sizing.size110,
                    ),
                    largeVerticalSizedBox,
                    const MyAfyaHubScaffoldHeader(
                      title: createNewPINTitleString,
                      description: createNewPINSubTitleString,
                    ),
                    largeVerticalSizedBox,
                    Text(
                      pinString,
                      style: TextThemes.boldSize14Text(AppColors.greyTextColor),
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
                    Text(
                      confirmPinString,
                      style: TextThemes.boldSize14Text(AppColors.greyTextColor),
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
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: MyAfyaHubPrimaryButton(
                            buttonKey: createPINContinueButtonKey,
                            onPressed: () {
                              if (!confirmPinValidator(pin, confirmPin)) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(pinMustMatchString),
                                  duration: Duration(seconds: 2),
                                ));
                                return;
                              }
                              if (_formKey.currentState!.validate()) {
                                return;
                              }
                            },
                            buttonColor: AppColors.secondaryColor,
                            borderColor: Colors.transparent,
                            text: saveAndContinueButtonText,
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
