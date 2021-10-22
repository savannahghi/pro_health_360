import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/widgets/medical_data_item.dart';
import 'package:myafyahub/presentation/profile/widgets/medical_data_item_title.dart';
import 'package:shared_themes/spaces.dart';

/// [SettingsPage] is used to display the client's settings
///
/// the nickname will be accessed from the state
class SettingsPage extends StatelessWidget {
  final String userNickName = 'John Doe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: settingsPageTitle),
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
                    MedicalDataItem(
                      customWidth: double.infinity,
                      data: userNickName,
                    ),
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
