// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/presentation/feed/widgets/read_time_badge_widget.dart';
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
                    if (contentDetails.heroImage != null &&
                        contentDetails.heroImage!.url != UNKNOWN)
                      Stack(
                        children: <Widget>[
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
                          if (contentDetails.estimate != null)
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: ReadTimeBadge(
                                estimateReadTime: contentDetails.estimate!,
                              ),
                            ),
                        ],
                      ),
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
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 18.0,
                          bottom: 4.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  heartIconUrl,
                                  width: 20,
                                  height: 20,
                                  color: AppColors.secondaryColor,
                                ),
                                verySmallHorizontalSizedBox,
                                Text(
                                  '234',
                                  style: TextThemes.normalSize12Text(
                                    AppColors.greyTextColor,
                                  ),
                                )
                              ],
                            ),
                            smallHorizontalSizedBox,
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  shareIconUrl,
                                  width: 20,
                                  height: 20,
                                  color: AppColors.secondaryColor,
                                ),
                                verySmallHorizontalSizedBox,
                                Text(
                                  '234',
                                  style: TextThemes.normalSize12Text(
                                    AppColors.greyTextColor,
                                  ),
                                )
                              ],
                            ),
                            smallHorizontalSizedBox,
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  saveIconUrl,
                                  width: 20,
                                  height: 20,
                                  color: AppColors.secondaryColor,
                                ),
                                verySmallHorizontalSizedBox,
                                Text(
                                  '234',
                                  style: TextThemes.normalSize12Text(
                                    AppColors.greyTextColor,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ContentItemFooter(
                      //   datePublished: contentDetails.metadata!.createdAt!,
                      //   estimatedReadingTime: contentDetails.estimate,
                      // )
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

