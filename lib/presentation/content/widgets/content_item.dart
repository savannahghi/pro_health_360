// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/presentation/content/widgets/estimated_read_time_badge_widget.dart';
import 'package:myafyahub/presentation/content/widgets/reaction_item.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';

/// [ContentItem] Displays the feed
/// [isNew] renders the new tag
class ContentItem extends StatelessWidget {
  const ContentItem({required this.contentDetails, this.isNew = false});

  final Content contentDetails;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: feedContentItemKey,
      onTap: () => Navigator.of(context)
          .pushNamed(BWRoutes.contentDetailPage, arguments: contentDetails),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
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
                    if (contentDetails.heroImage != null &&
                        contentDetails.heroImage!.url != UNKNOWN)
                      Stack(
                        children: <Widget>[
                          // Hero image
                          Container(
                            height: 170.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  contentDetails.heroImage!.url!,
                                ),
                              ),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(7.0),
                                topLeft: Radius.circular(7.0),
                              ),
                            ),
                          ),
                          // Reading estimate
                          if (contentDetails.estimate != null)
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: EstimatedReadTimeBadge(
                                estimateReadTime: contentDetails.estimate!,
                              ),
                            ),
                        ],
                      ),
                    // A video playback icon if there is a video
                    if (contentDetails.contentType == ContentType.AUDIOVIDEO)
                      SizedBox(
                        key: feedVideoPlayIconKey,
                        child: SvgPicture.asset(
                          playIcon,
                          width: 50,
                          height: 50,
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                contentDetails.title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextThemes.boldSize16Text(
                                  AppColors.secondaryColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: sortDate(
                                dateTextStyle: TextThemes.normalSize12Text(
                                  AppColors.greyTextColor,
                                ),
                                context: context,
                                loadedDate: contentDetails.metadata!.createdAt!,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      if (contentDetails.authorName != null)
                        Text(
                          contentDetails.authorName!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextThemes.boldSize12Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      // Reactions
                      Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 4),
                        child: Row(
                          children: <Widget>[
                            ReactionItem(
                              iconUrl: heartIconUrl,
                              count: contentDetails.likeCount,
                            ),
                            ReactionItem(
                              iconUrl: shareIconUrl,
                              count: contentDetails.shareCount,
                            ),
                            ReactionItem(
                              iconUrl: saveIconUrl,
                              count: contentDetails.bookmarkCount,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isNew)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: Colors.redAccent[700],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  margin: const EdgeInsets.all(8),
                  child: Text(
                    newString,
                    style: TextThemes.boldSize16Text(Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}