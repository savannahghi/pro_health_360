// Flutter imports

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';

/// [MoodSymptomWidget] Displays reaction icons on the health diary page
class MoodSymptomWidget extends StatelessWidget {
  const MoodSymptomWidget({this.isSelected = false, required this.title});

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              style: TextThemes.boldSize13Text(
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
