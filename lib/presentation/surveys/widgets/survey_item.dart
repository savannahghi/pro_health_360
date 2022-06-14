import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import 'package:myafyahub/presentation/core/theme/theme.dart';

class SurveyItem extends StatelessWidget {
  const SurveyItem({
    required this.gestureKey,
    required this.title,
    required this.url,
  });

  final String title;
  final String url;
  final Key gestureKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: gestureKey,
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        final String encodedUrl = Uri.encodeFull(url);
        Navigator.of(context).pushNamed(
          AppRoutes.customWebviewPage,
          arguments: <String, dynamic>{
            'url': encodedUrl,
            'appBarTitle': surveys
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.14),
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: boldSize18Text(AppColors.blackColor.withOpacity(0.8)),
            ),
            smallVerticalSizedBox,
          ],
        ),
      ),
    );
  }
}
