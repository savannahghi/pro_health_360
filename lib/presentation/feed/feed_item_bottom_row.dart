// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'feed_item_reaction_icon.dart';

/// [FeedItemBottomRow] Displays the bottom row on feed
class FeedItemBottomRow extends StatelessWidget {
  final String feedDate;
  final String? readTime;

  const FeedItemBottomRow({
    required this.feedDate,
    this.readTime,
  });

  @override
  Widget build(BuildContext context) {
    final Widget formattedDate = sortDate(
      dateTextStyle: TextThemes.normalSize15Text(Colors.grey),
      context: context,
      loadedDate: feedDate,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            formattedDate,
            if (readTime != null)
              Padding(
                padding: const EdgeInsets.only(left: 2.5),
                child: Text(
                  contentReadDuration(readTime!),
                  style: TextThemes.normalSize15Text(Colors.grey),
                ),
              ),
          ],
        ),
        Row(
          children: <Widget>[
            const FeedItemReactionIcon(svgPath: heartIconUrl),
            verySmallHorizontalSizedBox,
            const FeedItemReactionIcon(svgPath: shareIconUrl),
            verySmallHorizontalSizedBox,
            const FeedItemReactionIcon(svgPath: saveIconUrl)
          ],
        )
      ],
    );
  }
}
