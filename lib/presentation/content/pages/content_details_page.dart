// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/redux/actions/share_content_action.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/widgets/content_item_reaction_icon.dart';
import 'package:myafyahub/presentation/content/widgets/estimated_read_time_badge_widget.dart';
import 'package:share/share.dart';
import 'package:myafyahub/presentation/content/widgets/save_feed_item_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';

class ContentDetailPage extends StatefulWidget {
  /// [ContentDetailPage] is used to display the article details
  ///
  /// It takes in a required [articleDetails] parameter which is a map of the
  /// the information to be displayed on this screen
  ///
  const ContentDetailPage({required this.contentDetails});

  final Content contentDetails;

  @override
  State<ContentDetailPage> createState() => _ContentDetailPageState();
}

class _ContentDetailPageState extends State<ContentDetailPage> {
  late bool likeSelected = false;
  late int likeCount = widget.contentDetails.likeCount!;

  @override
  Widget build(BuildContext context) {
    final Widget publishDate = widget
            .contentDetails.metadata!.createdAt!.isNotEmpty
        ? sortDate(
            dateTextStyle: TextThemes.boldSize12Text(AppColors.greyTextColor),
            context: context,
            loadedDate: widget.contentDetails.metadata!.createdAt!,
          )
        : const SizedBox();

    return Scaffold(
      backgroundColor: AppColors.lightGreyBackgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    // TODO(abiud): replace with cached network image to
                    // handle showing an image before the network one loads
                    image: NetworkImage(
                      widget.contentDetails.heroImage!.url!,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: -6,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RawMaterialButton(
                    key: cancelButtonKey,
                    onPressed: () => Navigator.pop(context),
                    fillColor:
                        AppColors.readTimeBackgroundColor.withOpacity(0.5),
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.contentDetails.title!,
                  style: TextThemes.veryBoldSize18Text(Colors.black),
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
                              widget.contentDetails.authorName!,
                              style: TextThemes.veryBoldSize15Text(
                                AppColors.greyTextColor,
                              ),
                            ),
                            verySmallVerticalSizedBox,
                            Row(
                              children: <Widget>[
                                Text(
                                  datePublishedString,
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
                      estimateReadTime: widget.contentDetails.estimate!,
                    ),
                  ],
                ),
                largeVerticalSizedBox,
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 15,
                    children: <Widget>[
                      ContentItemReactionIcon(
                        key: likeButtonKey,
                        svgPath: heartIconUrl,
                        count: likeCount.toString(),
                        description: likeString,
                        selected: likeSelected,
                        altSvgPath: selectedLikeIconSvgPath,
                        onTap: () {
                          setState(() {
                            likeSelected
                                ? likeCount = likeCount - 1
                                : likeCount = likeCount + 1;
                          });

                          updateLikeStatus(
                            context: context,
                            contentID: widget.contentDetails.contentID!,
                            isLiked: likeSelected,
                          );
                          setState(() {
                            likeSelected = !likeSelected;
                          });
                        },
                      ),
                      ContentItemReactionIcon(
                        key: shareButtonKey,
                        count: widget.contentDetails.shareCount.toString(),
                        onTap: () async {
                          if (widget.contentDetails.metadata!.publicLink !=
                                  null &&
                              widget.contentDetails.metadata!.publicLink !=
                                  UNKNOWN &&
                              widget.contentDetails.metadata!.publicLink!
                                  .isNotEmpty) {
                            Share.share(
                              widget.contentDetails.metadata!.publicLink!,
                              subject: widget.contentDetails.title,
                            );
                            await StoreProvider.dispatch(
                              context,
                              ShareContentAction(
                                contentID: widget.contentDetails.contentID!,
                                context: context,
                              ),
                            );
                          }
                        },
                        description: shareString,
                        svgPath: shareIconUrl,
                        altSvgPath: shareIconUrl,
                      ),
                      verySmallHorizontalSizedBox,
                      SaveFeedItemWidget(
                        contentID: widget.contentDetails.contentID,
                        saved: widget.contentDetails.hasSaved ?? false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          if (widget.contentDetails.body != null)
            Container(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Html(
                data: widget.contentDetails.body,
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
    );
  }
}
