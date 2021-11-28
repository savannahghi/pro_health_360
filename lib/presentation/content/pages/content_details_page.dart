// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/widgets/content_item_reaction_icon.dart';
import 'package:myafyahub/presentation/content/widgets/estimated_read_time_badge_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';

class ContentDetailPage extends StatelessWidget {
  /// [ContentDetailPage] is used to display the article details
  ///
  /// It takes in a required [articleDetails] parameter which is a map of the
  /// the information to be displayed on this screen
  ///
  const ContentDetailPage({required this.articleDetails});

  final Content articleDetails;

  @override
  Widget build(BuildContext context) {
    final Widget publishDate = articleDetails.metadata!.createdAt!.isNotEmpty
        ? sortDate(
            dateTextStyle: TextThemes.boldSize12Text(AppColors.greyTextColor),
            context: context,
            loadedDate: articleDetails.metadata!.createdAt!,
          )
        : const SizedBox();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      // TODO(abiud): replace with cached network image to
                      // handle showing an image before the network one loads
                      image: NetworkImage(
                        articleDetails.heroImage!.url!,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 32,
                  left: -6,
                  child: Opacity(
                    opacity: 0.7,
                    child: RawMaterialButton(
                      key: cancelButtonKey,
                      onPressed: () => Navigator.pop(context),
                      fillColor: AppColors.readTimeBackgroundColor,
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                      child: SvgPicture.asset(
                        whiteCloseIconSvgPath,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 30.0,
                right: 30.0,
              ),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text(
                    articleDetails.title!,
                    style: TextThemes.veryBoldSize18Text(
                      Colors.black,
                    ),
                  ),
                  mediumVerticalSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                // TODO(eugene): revert when backend is ready
                                // image: articleDetails.authorAvatar == null
                                //     ? const AssetImage(profileImage)
                                //     : NetworkImage(
                                //         articleDetails.authorAvatar!,
                                //       ) as ImageProvider,
                                image: AssetImage(profileImage),
                              ),
                            ),
                          ),
                          smallHorizontalSizedBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                articleDetails.authorName!,
                                style: TextThemes.veryBoldSize15Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              verySmallVerticalSizedBox,
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Published on ',
                                    style: TextThemes.boldSize12Text(
                                      AppColors.greyTextColor,
                                    ),
                                  ),
                                  publishDate,
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      EstimatedReadTimeBadge(
                        estimateReadTime: articleDetails.estimate!,
                      ),
                    ],
                  ),
                  mediumVerticalSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const ContentItemReactionIcon(
                        svgPath: heartIconUrl,
                        count: '200',
                        description: likeString,
                        selected: true,
                        altSvgPath: selectedLikeIconSvgPath,
                      ),
                      verySmallHorizontalSizedBox,
                      const ContentItemReactionIcon(
                        count: '',
                        description: shareString,
                        svgPath: shareIconUrl,
                        altSvgPath: selectedLikeIconSvgPath,
                      ),
                      verySmallHorizontalSizedBox,
                      const ContentItemReactionIcon(
                        count: '',
                        description: saveString,
                        svgPath: saveIconUrl,
                        altSvgPath: selectedLikeIconSvgPath,
                      )
                    ],
                  )
                ],
              ),
            ),
            if (articleDetails.body != null)
              Container(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: 20,
                  top: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Html(
                  data: articleDetails.body,
                ),
              )
            else
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: GenericEmptyData(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
