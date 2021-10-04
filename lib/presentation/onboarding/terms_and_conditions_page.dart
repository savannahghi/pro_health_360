import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/information_list_card.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

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
                leadingIcon: UniconsLine.file_lock_alt,
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
              Row(
                children: const <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text(
                    acceptTermsText,
                    style: TextStyle(color: AppColors.secondaryColor),
                  ),
                ],
              ),

              // Continue button
              const SizedBox(
                height: 48,
                width: double.infinity,
                child: MyAfyaHubPrimaryButton(
                  text: 'Continue',
                  buttonColor: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}