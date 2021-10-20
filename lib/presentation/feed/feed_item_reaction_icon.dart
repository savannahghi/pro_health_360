// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [FeedItemReactionIcon] Displays reaction Icons on the feed
class FeedItemReactionIcon extends StatelessWidget {
  final String svgPath;
  final Color backgroundColor;
  const FeedItemReactionIcon({required this.svgPath, this.backgroundColor = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
        color: backgroundColor,
      ),
      child: Center(
        child: SvgPicture.asset(
          svgPath,
          width: 15,
          height: 15,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
