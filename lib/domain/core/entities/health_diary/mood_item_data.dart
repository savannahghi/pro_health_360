// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class MoodItemData {
  MoodItemData({required this.color, required this.svgIconUrl});

  final Color color;
  final String svgIconUrl;

  factory MoodItemData.initial() => MoodItemData(
        color: AppColors.secondaryColor,
        svgIconUrl: happyIconSvgPath,
      );
}
