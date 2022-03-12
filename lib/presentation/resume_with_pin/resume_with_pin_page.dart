import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class ResumeWithPinPage extends StatelessWidget {
  const ResumeWithPinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SvgPicture.asset(securitySvgAsset),
              Text(
                welcomeBackUserText('John'),
                style: const TextStyle(
                  color: AppColors.resumeWithPinTitleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                resumeWithPinText,
                style: TextStyle(
                  color: AppColors.unSelectedReactionIconColor,
                  fontSize: 16,
                ),
              ),
              PINInputField(
                key: const Key('pin_input_field'),
                maxLength: 6,
                onDone: (String value) {},
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('logout_button'),
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(primary: AppColors.primaryColor),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(logoutButtonText),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
