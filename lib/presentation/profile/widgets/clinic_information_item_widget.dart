// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [CallContactActionWidget] is a shared widget used in [ClinicInformationPage]
///
/// It takes in required [titleText] and [bodyText} parameters
///
class ClinicInformationItemWidget extends StatelessWidget {
  const ClinicInformationItemWidget({
    required this.titleText,
    required this.bodyText,
  });
  final String titleText;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          bodyText,
          style: TextThemes.boldSize14Text(
            AppColors.secondaryColor,
          ),
        ),
        smallVerticalSizedBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  titleText,
                  style:
                      TextThemes.normalSize14Text(AppColors.darkGreyTextColor),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
