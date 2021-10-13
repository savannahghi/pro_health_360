// Flutter imports:
import 'package:flutter/material.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';
import 'package:afya_moja_core/checkbox_component.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/information_list_card.dart';
import 'package:afya_moja_core/buttons.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              // Terms and Conditions Card

              InformationListCard(
                leadingIcon: const Center(
                  child: Icon(
                    UniconsLine.file_lock_alt,
                    size: 32,
                    color: AppColors.secondaryColor,
                  ),
                ),
                title: Text(
                  portalTermsText,
                  style: TextThemes.normalSize16Text(
                      Theme.of(context).primaryColor),
                ),
                body: Text(
                  readAndAcceptText,
                  style: TextThemes.normalSize14Text(Colors.grey),
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              // Terms and Conditions scrollable view
              Expanded(
                child: Scrollbar(
                  isAlwaysShown: true,
                  thickness: 10.0,
                  radius: const Radius.circular(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Terms and Conditions will be available soon',
                            style: TextThemes.normalSize18Text(
                                    AppColors.secondaryColor.withOpacity(0.5))
                                .copyWith(height: 1.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Accepts terms check box
              CheckBoxComponent(
                text: acceptTermsText,
                value: isAgreed,
                onChanged: (bool? value) {
                  setState(() {
                    isAgreed = value!;
                  });
                },
              ),

              // Continue button
              SizedBox(
                height: 48,
                width: double.infinity,
                child: MyAfyaHubPrimaryButton(
                  text: 'Continue',
                  buttonColor: AppColors.secondaryColor,
                  onPressed: () {
                    if (isAgreed) {
                      Navigator.pushReplacementNamed(
                          context, BWRoutes.securityQuestionsPage);
                    } else {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: const Text(acceptTermsErrorMessage),
                          duration:
                              const Duration(seconds: kShortSnackBarDuration),
                          action: dismissSnackBar(closeString, white, context),
                        ));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
