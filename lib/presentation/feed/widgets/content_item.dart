// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/feed/widgets/content_item_footer.dart';
import 'package:myafyahub/presentation/router/routes.dart';

/// [ContentItem] Displays the feed
/// [isNew] renders the new tag
class ContentItem extends StatelessWidget {
  const ContentItem({required this.contentDetails});

  final Content contentDetails;

  @override
  Widget build(BuildContext context) {
    final bool isNew = contentDetails.isNew ?? false;

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
                    if (contentDetails.heroImage != null)
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
                      ContentItemFooter(
                        datePublished: contentDetails.metadata!.createdAt!,
                        estimatedReadingTime: contentDetails.estimate,
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
