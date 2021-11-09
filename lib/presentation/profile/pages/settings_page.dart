import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/personal_information_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// [SettingsPage] is used to display the client's settings
///
/// the nickname will be accessed from the state
class SettingsPage extends StatelessWidget {
  final String userNickName = 'John Doe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(title: settingsPageTitle),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    largeVerticalSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          nickNameString,
                          style: TextThemes.boldSize15Text(
                              AppColors.secondaryColor),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.userInitialsColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            editString,
                            textAlign: TextAlign.center,
                            style: TextThemes.normalSize14Text(
                                AppColors.whiteColor),
                          ),
                        ),
                      ],
                    ),
                    smallVerticalSizedBox,
                    PersonalInformationWidget(description: userNickName),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
