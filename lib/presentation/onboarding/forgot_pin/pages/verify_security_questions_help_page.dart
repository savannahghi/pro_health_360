import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

class VerifySecurityQuestionsHelpPage extends StatefulWidget {
  @override
  State<VerifySecurityQuestionsHelpPage> createState() =>
      _VerifySecurityQuestionsHelpPageState();
}

class _VerifySecurityQuestionsHelpPageState
    extends State<VerifySecurityQuestionsHelpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? cccNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                veryLargeVerticalSizedBox,
                SvgPicture.asset(
                  pinRequestSentImage,
                ),
                largeVerticalSizedBox,
                Text(
                  doYouNeedHelpString,
                  style: heavySize20Text(),
                  textAlign: TextAlign.center,
                ),
                smallVerticalSizedBox,
                Text(
                  verifySecurityQuestionHelpMessageString,
                  style: normalSize14Text(
                    darkGreyTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                mediumVerticalSizedBox,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    cccNumberString,
                    style: boldSize14Text(),
                    textAlign: TextAlign.start,
                  ),
                ),
                smallVerticalSizedBox,
                CustomTextField(
                  formFieldKey: cccInputKey,
                  customFillColor: AppColors.greyTextColor.withOpacity(0.08),
                  maxLength: 10,
                  borderColor: Colors.transparent,
                  validator: cccNumberValidator,
                  focusedBorderColor: Colors.transparent,
                  autovalidateMode: AutovalidateMode.disabled,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (String val) {
                    setState(() {
                      cccNumber = val;
                    });
                  },
                ),
                smallVerticalSizedBox,
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: askForHelpButtonKey,
                    text: askForHelpString,
                    onPressed: () {
                      final bool? isFormValid =
                          _formKey.currentState?.validate();
                      if (isFormValid != null &&
                          isFormValid &&
                          cccNumber != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(comingSoonText),
                          ),
                        );
                      }
                    },
                  ),
                ),
                smallVerticalSizedBox,
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: tryAgainButtonKey,
                    text: tryAgainString,
                    buttonColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    textStyle: normalSize14Text(AppColors.redColor),
                    borderColor: Colors.transparent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}