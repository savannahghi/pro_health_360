import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/list_item_card_subtitle.dart';
import 'package:shared_themes/spaces.dart';

/// [ListItemCard] is a shared widget to display items on the timeline.
///
/// It takes in required [time], [timelineType] and [assetPath] parameters
///
/// [title] this is a string defaults to 'Diary' string if not provided

class ListItemCard extends StatelessWidget {
  const ListItemCard(
      {this.title = diaryString,
      this.subTitle,
      required this.time,
      required this.timelineType,
      this.iconBackgroundColor = AppColors.introductionBackgroundColor,
      required this.assetPath,
      this.imageUrl});
  final String title;
  final String? subTitle;
  final String time;
  final TimelineItemType timelineType;
  final Color iconBackgroundColor;
  final String assetPath;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: timelineType == TimelineItemType.Appointment
                      ? AppColors.listCardColor
                      : AppColors.diaryListCardColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(assetPath,
                    width: 40, height: 40, color: Colors.black),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (timelineType == TimelineItemType.Appointment)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          subTitle!,
                          style: const TextStyle(
                              color: AppColors.greyTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          overflow: TextOverflow.clip,
                          softWrap: true,
                        ),
                      ),
                    if (timelineType == TimelineItemType.DiaryImage)
                      const CardSubTitle(
                        text: imageFileString,
                      ),
                    if (timelineType == TimelineItemType.DiaryText)
                      const CardSubTitle(
                        text: textEntryString,
                      ),
                    Text(
                      time,
                      style: const TextStyle(
                          color: AppColors.greyTextColor, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (timelineType == TimelineItemType.DiaryImage && imageUrl != null)
            Column(
              children: <Widget>[
                smallVerticalSizedBox,
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(imageUrl!),
                ),
              ],
            ),
        ],
      ),
      
    );
  }
}
