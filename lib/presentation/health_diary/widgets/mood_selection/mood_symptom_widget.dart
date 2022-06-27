// Flutter imports
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/presentation/core/theme/theme.dart';
// Package imports:
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
  final VoidCallback? onTap;
  final Key? gestureKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: gestureKey,
      onTap: () => onTap?.call(),
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
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: isSelected
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
