// Flutter imports

// Flutter imports:
import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:unicons/unicons.dart';

/// [MoodSymptomWidget] Displays reaction icons on the health diary page
class MoodSymptomWidget extends StatelessWidget {
  const MoodSymptomWidget({
    this.isSelected = false,
    required this.title,
    this.onTap,
    this.gestureKey,
  });

  final bool isSelected;
  final String title;
  final Function? onTap;
  final Key? gestureKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: gestureKey,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.3)
              : AppColors.unSelectedReactionBackgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (isSelected)
              const Icon(
                UniconsLine.check,
                size: 20,
                color: AppColors.primaryColor,
              ),
            verySmallHorizontalSizedBox,
            Text(
              title,
              style: boldSize13Text(
                isSelected
                    ? AppColors.primaryColor
                    : AppColors.unSelectedReactionIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
