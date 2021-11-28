// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// [ContentItemReactionIcon] Displays reaction Icons on the feed
class ContentItemReactionIcon extends StatelessWidget {
  const ContentItemReactionIcon({
    required this.svgPath,
    this.selected = false,
    required this.count,
    required this.description,
    required this.altSvgPath,
  });
  final String svgPath;

  final bool selected;
  final String count;
  final String description;
  final String altSvgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: selected
            ? AppColors.selectedReactionBackgroundColor
            : AppColors.unSelectedReactionBackgroundColor,
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            selected ? altSvgPath : svgPath,
            width: 20,
            height: 20,
            color: selected
                ? AppColors.reactionIconRedColor
                : AppColors.secondaryColor,
          ),
          verySmallHorizontalSizedBox,
          RichText(
            text: TextSpan(
              text: selected ? '$count ' : '',
              style: TextThemes.boldSize12Text(
                selected
                    ? AppColors.reactionIconRedColor
                    : AppColors.greyTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: selected
                      ? '${description}s'
                      : '${description[0].toUpperCase()}${description.substring(1)}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
