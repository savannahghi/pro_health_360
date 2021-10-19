import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:afya_moja_core/buttons.dart';
import 'package:myafyahub/presentation/profile/widgets/medical_data_item.dart';
import 'package:myafyahub/presentation/profile/widgets/medical_data_item_title.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class SettingsPage extends StatelessWidget {
  /// [SettingsPage] is used to display and edit user Nickname
  ///
  /// It takes in required [userNickName] parameter of type String
  ///
  final String userNickName = 'Name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: settingsText),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: double.infinity,
            color: Theme.of(context).backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    largeVerticalSizedBox,
                    const MedicalDataItemTitle(title: nickNameString),
                    const MedicalDataItem(
                      customWidth: double.infinity,
                      data: nickNameString,
                      description: editString,
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: MyAfyaHubPrimaryButton(
                      customPadding: const EdgeInsets.symmetric(
                        horizontal: 140,
                        vertical: 12,
                      ),
                      textStyle: TextThemes.normalSize15Text(Colors.white),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(comingSoonText),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      buttonColor: AppColors.secondaryColor,
                      borderColor: Colors.transparent,
                      text: saveString,
                    ),
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
