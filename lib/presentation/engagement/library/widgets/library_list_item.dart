// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/library/library_content_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class LibraryListItem extends StatelessWidget {
  const LibraryListItem({required this.libraryContentItem});

  final LibraryContentItemData libraryContentItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: libraryListItemKey,
      onTap: () => libraryContentNavigation(context, libraryContentItem),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          libraryContentItem.libraryContentTags,
                          style:
                              TextThemes.boldSize12Text(AppColors.accentColor)
                                  .copyWith(height: 2),
                        ),
                        verySmallVerticalSizedBox,
                        Text(libraryContentItem.libraryContentTitle,
                            style: TextThemes.boldSize20Text()),
                        verySmallVerticalSizedBox,
                        Row(
                          children: <Widget>[
                            sortDate(
                              context: context,
                              loadedDate:
                                  libraryContentItem.libraryContentPublishDate,
                              dateTextStyle: TextThemes.normalSize12Text(
                                AppColors.greyColor,
                              ),
                            ),
                            smallHorizontalSizedBox,
                            Text(
                              '${libraryContentItem.libraryContentReadTime} min read',
                              style: TextThemes.normalSize12Text(
                                  AppColors.greyColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  mediumHorizontalSizedBox,
                  if (libraryContentItem.libraryContentImageUrl.isNotEmpty)
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: SizedBox(
                        height: 82,
                        width: 96,
                        child: Image.network(
                          libraryContentItem.libraryContentImageUrl,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
