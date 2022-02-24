// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content_details.dart';
import 'package:myafyahub/domain/core/entities/feed/gallery_image.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/content/widgets/estimated_read_time_badge_widget.dart';
import 'package:myafyahub/presentation/content/widgets/gallery_image_widget.dart';
import 'package:myafyahub/presentation/content/widgets/like_content_widget.dart';
import 'package:myafyahub/presentation/content/widgets/save_content_widget.dart';
import 'package:myafyahub/presentation/content/widgets/share_content_widget.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/presentation/video_player/chewie_video_player.dart';
import 'package:shared_themes/spaces.dart';

class ContentDetailPage extends StatelessWidget {
  /// [ContentDetailPage] is used to display the article details
  ///
  /// It takes in a required [payload] parameter which is a map of the
  /// the information to be displayed on this screen

  const ContentDetailPage({
    required this.payload,
  });

  final ContentDetails payload;

  @override
  Widget build(BuildContext context) {
    final String createdAt =
        payload.content.metadata?.createdAt ?? DateTime.now().toString();

    final Widget publishDate = createdAt.isNotEmpty
        ? humanizeDate(
            dateTextStyle: boldSize12Text(AppColors.greyTextColor),
            loadedDate: createdAt,
          )
        : const SizedBox();

    final bool hasVideo = payload.content.featuredMedia != null &&
        payload.content.featuredMedia!.isNotEmpty &&
        payload.content.featuredMedia?[0]?.featuredMediaType ==
            FeaturedMediaType.video;

    final List<Widget> galleryItems = getGalleryItems(context: context);

    return Scaffold(
      backgroundColor: AppColors.lightGreyBackgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            children: <Widget>[
              if (payload.content.contentType == ContentType.AUDIO_VIDEO)
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  child: ChewieVideoPlayer(
                    chewieController: initializeChewiController(
                      dataSource:
                          payload.content.featuredMedia?.first?.mediaUrl ??
                              UNKNOWN,
                    ),
                    thumbnail: payload.content.heroImage?.url ?? UNKNOWN,
                  ),
                )
              else
                Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      // TODO(abiud): replace with cached network image to
                      // handle showing an image before the network one loads
                      image: NetworkImage(
                        payload.content.heroImage!.url!,
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
          if (galleryItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300,
                child: GestureDetector(
                  key: galleryImagePageKey,
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (payload.content.galleryImages != null &&
                        payload.content.galleryImages!.length > 3) {
                      Navigator.of(context).pushNamed(
                        AppRoutes.galleryImagesPage,
                        arguments: payload.content.galleryImages,
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[...galleryItems],
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  payload.content.title ?? UNKNOWN,
                  style: veryBoldSize18Text(Colors.black),
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
                              payload.content.authorName ?? UNKNOWN,
                              style: veryBoldSize15Text(
                                AppColors.greyTextColor,
                              ),
                            ),
                            verySmallVerticalSizedBox,
                            Row(
                              children: <Widget>[
                                Text(
                                  datePublishedString,
                                  style: boldSize12Text(
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
                      contentType:
                          payload.content.contentType ?? ContentType.UNKNOWN,
                      estimateReadTime: payload.content.estimate ?? 0,
                      videoDuration: hasVideo
                          ? payload.content.featuredMedia?.first?.duration
                          : null,
                    ),
                  ],
                ),
                largeVerticalSizedBox,
                if (payload.showReactions)
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 15,
                      children: <Widget>[
                        LikeContentWidget(
                          contentID: payload.content.contentID ?? 0,
                          contentDisplayedType: payload.contentDisplayedType,
                        ),
                        ShareContentWidget(
                          link: payload.content.metadata?.publicLink,
                          title: payload.content.title ?? UNKNOWN,
                          contentID: payload.content.contentID ?? 0,
                        ),
                        verySmallHorizontalSizedBox,
                        SaveContentWidget(
                          contentID: payload.content.contentID ?? 0,
                          contentDisplayedType: payload.contentDisplayedType,
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
          if (payload.content.body != null)
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
                data: payload.content.body,
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

  List<Widget> getGalleryItems({required BuildContext context}) {
    final List<GalleryImage>? galleryImages = payload.content.galleryImages;
    final BorderRadius imageBorderRadius = BorderRadius.circular(12);
    const double galleryImageHeight = 500;

    final bool hasGalleryImages =
        galleryImages != null && galleryImages.isNotEmpty;

    final List<Widget> galleryItems = <Widget>[];

    if (hasGalleryImages) {
      if (galleryImages.length == 1) {
        galleryItems.addAll(<Widget>[
          GalleryImageWidget(
            borderRadius: imageBorderRadius,
            imageUrl: galleryImages[0].image?.meta?.imageDownloadUrl ?? '',
            height: galleryImageHeight,
            width: MediaQuery.of(context).size.width - 16,
          ),
        ]);
      } else if (galleryImages.length == 2) {
        galleryItems.addAll(<Widget>[
          Expanded(
            child: GalleryImageWidget(
              borderRadius: imageBorderRadius,
              imageUrl: galleryImages[0].image?.meta?.imageDownloadUrl ?? '',
              height: galleryImageHeight,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: GalleryImageWidget(
              borderRadius: imageBorderRadius,
              imageUrl: galleryImages[1].image?.meta?.imageDownloadUrl ?? '',
              height: galleryImageHeight,
            ),
          ),
        ]);
      } else {
        galleryItems.addAll(<Widget>[
          Expanded(
            child: GalleryImageWidget(
              borderRadius: imageBorderRadius,
              imageUrl: galleryImages[0].image?.meta?.imageDownloadUrl ?? '',
              height: MediaQuery.of(context).size.height,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GalleryImageWidget(
                    borderRadius: imageBorderRadius,
                    imageUrl:
                        galleryImages[1].image?.meta?.imageDownloadUrl ?? '',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      GalleryImageWidget(
                        borderRadius: imageBorderRadius,
                        imageUrl:
                            galleryImages[2].image?.meta?.imageDownloadUrl ??
                                '',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                      if (galleryImages.length > 3)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: imageBorderRadius,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Text(
                              '+ ${galleryImages.length - 3} more',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]);
      }
    }

    return galleryItems;
  }
}
