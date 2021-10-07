// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class BuildProfileFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () async {
              logoutUser(context: context)();
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.logout,
                        color: AppColors.redColor,
                        key: logoutIconKey,
                      ),
                      size15HorizontalSizedBox,
                      Text(
                        'Logout',
                        style: TextThemes.boldSize14Text(AppColors.redColor),
                      ),
                    ],
                  ),
                  const Icon(CupertinoIcons.chevron_right, size: 20),
                ],
              ),
            ),
          );
        }),
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  copyrightString,
                  style: TextThemes.normalSize10Text(Colors.grey),
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(
                  '$appVersionString $APPVERSION',
                  style: TextThemes.normalSize9Text(Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
