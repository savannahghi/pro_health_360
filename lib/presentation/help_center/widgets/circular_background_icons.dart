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
    Key? key,
    required this.backgroundColor,
    required this.loadIcon,
    required this.iconBackgroundPadding,
    this.iconColor,
  }) : super(key: key);

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
