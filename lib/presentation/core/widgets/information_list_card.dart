import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class InformationListCard extends StatelessWidget {
  const InformationListCard({
    required this.title,
    this.body,
    this.leadingIcon,
    this.iconColor,
    this.iconBackgroundColor,
    double? borderRadius,
  }) : borderRadius = borderRadius ?? 8;

  final Text title;
  final Widget? body;
  final IconData? leadingIcon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final double borderRadius;

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
    }

    return Container(
      padding: leadingIcon != null
          ? const EdgeInsets.all(8)
          : const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: <Widget>[
          ...leadingItems,
          Flexible(
            flex: leadingIcon != null ? 8 : 1,
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
