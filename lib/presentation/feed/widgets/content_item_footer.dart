// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'content_item_reaction_icon.dart';

/// [ContentItemFooter] Displays the bottom row on feed
class ContentItemFooter extends StatelessWidget {
  const ContentItemFooter({
    required this.datePublished,
    this.estimatedReadingTime,
  });

  final String datePublished;
  final int? estimatedReadingTime;

  @override
  Widget build(BuildContext context) {
    final Widget formattedDate = sortDate(
      dateTextStyle: TextThemes.normalSize12Text(Colors.grey),
      context: context,
      loadedDate: datePublished,
      showYear: false,
    );
    final String readingTime = contentReadDuration(estimatedReadingTime!);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            formattedDate,
            const Text('·'),
            verySmallHorizontalSizedBox,
            if (estimatedReadingTime != null)
              Padding(
                padding: const EdgeInsets.only(left: 2.5),
                child: Text(
                  readingTime,
                  style: TextThemes.normalSize12Text(Colors.grey),
                ),
              ),
          ],
        ),
        Row(
          children: <Widget>[
            const ContentItemReactionIcon(svgPath: heartIconUrl),
            verySmallHorizontalSizedBox,
            const ContentItemReactionIcon(svgPath: shareIconUrl),
            verySmallHorizontalSizedBox,
            const ContentItemReactionIcon(svgPath: saveIconUrl)
          ],
        )
      ],
    );
  }
}
