import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class ContentMetaDataWidget extends StatelessWidget {
  const ContentMetaDataWidget({
    Key? key,
    required this.contentDetails,
  }) : super(key: key);

  final Content contentDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (contentDetails.date != null)
                Flexible(
                  child: Text(
                    contentDetails.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: boldSize16Text(
                      AppColors.secondaryColor,
                    ),
                  ),
                ),
              if (contentDetails.metadata != null &&
                  contentDetails.metadata?.createdAt != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: humanizeDate(
                    dateTextStyle: normalSize12Text(
                      AppColors.greyTextColor,
                    ),
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
            style: boldSize12Text(
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
    );
  }
}
