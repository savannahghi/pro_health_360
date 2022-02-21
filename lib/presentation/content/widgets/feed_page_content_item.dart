import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_details.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/content/widgets/audio_content.dart';
import 'package:myafyahub/presentation/content/widgets/content_meta_data_widget.dart';
import 'package:myafyahub/presentation/content/widgets/leading_graphic_widget.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class FeedPageContentItem extends StatelessWidget {
  const FeedPageContentItem({
    Key? key,
    required this.content,
    this.heroImage,
    this.isNew = false,
  }) : super(key: key);

  final Content content;
  final Widget? heroImage;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    final bool isArticle = content.contentType == ContentType.ARTICLE;
    final bool hasVideo = content.featuredMedia != null &&
        content.featuredMedia!.isNotEmpty &&
        content.featuredMedia?[0]?.featuredMediaType == FeaturedMediaType.video;
    final bool isAudio = content.contentType == ContentType.AUDIO_VIDEO &&
        content.featuredMedia?[0]?.featuredMediaType == FeaturedMediaType.audio;
    final bool isVideo =
        content.contentType == ContentType.AUDIO_VIDEO && hasVideo;

    return GestureDetector(
      key: feedContentItemKey,
      onTap: () {
        if (isArticle ||
            content.featuredMedia?[0]?.featuredMediaType ==
                FeaturedMediaType.video) {
          Navigator.of(context).pushNamed(
            AppRoutes.contentDetailPage,
            arguments: ContentDetails(
              content: content,
              contentDisplayedType: ContentDisplayedType.RECENT,
            ),
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        decoration: const BoxDecoration(
          color: AppColors.darkGreyBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      if (heroImage != null)
                        LeadingGraphicWidget(
                          contentDetails: content,
                          heroImage: heroImage!,
                        ),
                      // A video playback icon if there is a video
                      if (isVideo)
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
                ),
                if (isAudio)
                  AudioContent(contentDetails: content)
                else if (isArticle || hasVideo)
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: ContentMetaDataWidget(contentDetails: content),
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
                    newText,
                    style: boldSize16Text(Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
