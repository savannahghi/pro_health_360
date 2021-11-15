// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/presentation/router/routes.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/feed/feed_item_bottom_row.dart';

/// [ContentItem] Displays the feed
/// [isNew] renders the new tag
class ContentItem extends StatelessWidget {
  const ContentItem({required this.contentDetails});

  final Content contentDetails;

  @override
  Widget build(BuildContext context) {
    final bool isNew = contentDetails.isNew ?? false;

    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(BWRoutes.articleDetailsPage, arguments: contentDetails),
      child: Container(
        width: 380,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 170.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(contentDetails.heroImage!),
                        ),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(7.0),
                          topLeft: Radius.circular(7.0),
                        ),
                      ),
                    ),
                    if (contentDetails.contentType == ContentType.VIDEO)
                      SvgPicture.asset(
                        playIcon,
                        width: 50,
                        height: 50,
                      ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          contentDetails.title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextThemes.normalSize16Text(
                            AppColors.secondaryColor,
                          ),
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      FeedItemBottomRow(
                        feedDate: contentDetails.createdAt!,
                        readTime: contentDetails.estimate,
                      )
                    ],
                  ),
                ),
              ],
            ),
            if (isNew)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8),
                  child: Container(
                    height: 30.0,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
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
    );
  }
}
