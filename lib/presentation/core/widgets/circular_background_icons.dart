// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

class CircularBackGroundIcons extends StatelessWidget {
  final Color backgroundColor;
  final IconData loadIcon;
  final double iconBackgroundPadding;
  final Color? iconColor;

  const CircularBackGroundIcons({
    required this.backgroundColor,
    required this.loadIcon,
    required this.iconBackgroundPadding,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(iconBackgroundPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      child: Icon(
        loadIcon,
        color: iconColor ?? AppColors.whiteColor,
      ),
    );
  }
}
