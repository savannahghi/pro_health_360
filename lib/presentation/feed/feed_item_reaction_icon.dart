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
  const FeedItemReactionIcon({required this.svgPath});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
        color: Colors.white,
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
