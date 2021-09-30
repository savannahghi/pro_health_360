import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

class InformationListCard extends StatelessWidget {
  const InformationListCard({
    required this.title,
    this.body,
    this.leadingIcon,
    this.iconColor,
    this.iconBackgroundColor,
    double? borderRadius,
    this.iconAssetPath,
  }) : borderRadius = borderRadius ?? 8;

  final Text title;
  final Widget? body;
  final IconData? leadingIcon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final double borderRadius;
  final String? iconAssetPath;

  @override
  Widget build(BuildContext context) {
    final List<Widget> leadingItems = <Widget>[];
    if (leadingIcon != null) {
      leadingItems.addAll(<Widget>[
        Flexible(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: iconBackgroundColor ?? Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                leadingIcon,
                size: 32,
                color: iconColor ?? AppColors.secondaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
      ]);
    } else if (iconAssetPath != null) {
      leadingItems.addAll(<Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColors.listCardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              iconAssetPath!,
              width: 20,
              height: 20,
              color: iconColor ?? AppColors.secondaryColor,
            ),
          ),
        ),
        mediumHorizontalSizedBox,
      ]);
    }

    return Container(
      padding: leadingIcon != null ? const EdgeInsets.all(8)
          : iconAssetPath != null ? const EdgeInsets.all(6)
          : const EdgeInsets.all(16),
          
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: <Widget>[
          ...leadingItems,
          Flexible(
            flex: leadingIcon != null && iconAssetPath != null ? 8 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: title,
                ),
                if (body != null) body!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
