// Flutter imports:
import 'package:flutter/material.dart';

class InformationListCard extends StatelessWidget {
  ///[InformationListCard] displays the information widget
  ///
  ///[alternateLeadingIcon] will only display if [leadingIcon] is not declared

  const InformationListCard({
    required this.title,
    this.body,
    this.leadingIcon,
    this.iconBackgroundColor,
    this.alternateLeadingIcon,
    double? borderRadius,
  }) : borderRadius = borderRadius ?? 8;

  final Text title;
  final Widget? body;
  final Widget? leadingIcon;
  final Color? iconBackgroundColor;
  final Widget? alternateLeadingIcon;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final List<Widget> leadingItems = <Widget>[];
    if (alternateLeadingIcon != null && leadingIcon == null) {
      leadingItems.addAll(<Widget>[
        alternateLeadingIcon!,
        const SizedBox(width: 12),
      ]);
    }

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
            child: leadingIcon,
          ),
        ),
        const SizedBox(width: 12),
      ]);
    }

    return Container(
      padding: leadingIcon != null || alternateLeadingIcon != null
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
            flex: leadingIcon != null || alternateLeadingIcon != null ? 8 : 1,
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
