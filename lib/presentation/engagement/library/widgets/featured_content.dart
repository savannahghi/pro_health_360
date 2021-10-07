// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:transparent_image/transparent_image.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class FeaturedContent extends StatelessWidget {
  const FeaturedContent({
    Key? key,
    required this.featuredContentImagePath,
    required this.featuredContentTitle,
    required this.featuredContentReadTime,
    required this.featuredContentPublishDate,
    required this.libContent,
  }) : super(key: key);

  final String featuredContentImagePath;
  final String featuredContentPublishDate;
  final String featuredContentReadTime;
  final String featuredContentTitle;
  final List<dynamic> libContent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => libraryContentNavigation(
          context, listLibraryDataItems(3, libContent)),
      child: Container(
        key: libraryFeaturedContentKey,
        color: AppColors.greyColor,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              child: Align(
                heightFactor: 1.0,
                child: FadeInImage(
                  height: MediaQuery.of(context).size.longestSide *
                      0.35, // we use the longestSide since this app is configured for portrait only
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(featuredContentImagePath),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: AppColors.blackColor.withOpacity(0.3),
                padding: const EdgeInsets.only(
                  right: 1250,
                  left: 32,
                  top: 12,
                  bottom: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      featuredContentTitle,
                      style: TextThemes.boldSize20Text(AppColors.whiteColor),
                    ),
                    verySmallVerticalSizedBox,
                    Row(
                      children: <Widget>[
                        sortDate(
                          context: context,
                          loadedDate: featuredContentPublishDate,
                          dateTextStyle: TextThemes.normalSize12Text(
                            AppColors.whiteColor,
                          ),
                        ),
                        smallHorizontalSizedBox,
                        Text('$featuredContentReadTime min read',
                            style: TextThemes.normalSize12Text(
                                AppColors.whiteColor))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
