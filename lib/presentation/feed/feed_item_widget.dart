// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/feed/feed_details.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/feed/feed_item_bottom_row.dart';

/// [FeedItem] Displays the feed
/// [isNew] renders the new tag
class FeedItem extends StatelessWidget {
  final FeedDetails feedDetails;

  const FeedItem({
    required this.feedDetails,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNew = feedDetails.isNew ?? false;
    return GestureDetector(
      child: Container(
        width: 370,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 170.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(feedDetails.coverImageUrl),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7.0),
                          ),
                        ),
                      ),
                      if (feedDetails.type == FeedType.Video)
                        SvgPicture.asset(
                          playIcon,
                          width: 50,
                          height: 50,
                        ),
                    ],
                  ),
                  smallVerticalSizedBox,
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      feedDetails.header,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextThemes.normalSize16Text(AppColors.secondaryColor),
                    ),
                  ),
                  smallVerticalSizedBox,
                  FeedItemBottomRow(
                    feedDate: feedDetails.date,
                    readTime: feedDetails.readTime,
                  )
                ],
              ),
            ),
            if (isNew)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 30.0,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                      color: Colors.redAccent[700],
                    ),
                    child: Center(
                      child: Text(
                        newString,
                        style: TextThemes.boldSize16Text(Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      onTap: () => navigateToArticleDetailsPage(
        context,
        authorName: feedDetails.authorName,
        bodyText: feedDetails.bodyContent,
        coverImagePath: feedDetails.coverImageUrl,
        date: feedDetails.date,
        titleText: feedDetails.header,
        authorDisplayPic: feedDetails.authorDisplayPic,
      ),
    );
  }
}
