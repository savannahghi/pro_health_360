// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:myafyahub/domain/core/entities/health_diary/mood_item_data.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/health_diary/widgets/share_diary_entry_dialog.dart';
import 'package:shared_themes/spaces.dart';

class HealthDiaryEntryWidget extends StatelessWidget {
  const HealthDiaryEntryWidget({
    required this.diaryEntry,
    this.isDialog = false,
    this.index,
  });

  final HealthDiaryEntry diaryEntry;
  final bool isDialog;
  // this index is used to determine if the entry is the first one and hence whether to display share icon
  final int? index;

  @override
  Widget build(BuildContext context) {
    final Widget date = humanizeDate(
      dateTextStyle: normalSize12Text(AppColors.greyTextColor),
      loadedDate: diaryEntry.createdAt!,
      showTime: true,
    );

    final String mood = removeUnderscores(diaryEntry.mood ?? '');
    final MoodItemData moodItemData = getMoodColor(mood);
    final DateTime sharedDateTime = DateTime.parse(diaryEntry.sharedAt!);
    final Duration difference = DateTime.now().difference(sharedDateTime);
    final bool wasSharedWithinLastFourHrs =
        (difference.inHours <= 4) ? true : false;

    return Padding(
      padding: isDialog
          ? EdgeInsets.zero
          : const EdgeInsets.only(top: 5, left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isDialog ? moodItemData.color : Colors.transparent,
          ),
        ),
        padding: isDialog
            ? const EdgeInsets.symmetric(vertical: 6, horizontal: 10)
            : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: moodItemData.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                moodItemData.svgIconUrl,
                height: isDialog ? 32 : 40,
                color: moodItemData.color,
              ),
            ),
            smallHorizontalSizedBox,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  date,
                  verySmallVerticalSizedBox,
                  Text(
                    mood,
                    style: veryBoldSize14Text(moodItemData.color),
                    overflow: TextOverflow.ellipsis,
                  ),
                  verySmallVerticalSizedBox,
                  Text(
                    diaryEntry.note?.trim() ?? '',
                    style: normalSize12Text(
                      AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            // share icon
            if (!isDialog && index == 0 && !wasSharedWithinLastFourHrs)
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ShareDiaryEntryDialog(diaryEntry: diaryEntry);
                    },
                  );
                },
                key: shareDiaryEntryIconButtonKey,
                behavior: HitTestBehavior.opaque,
                child: SvgPicture.asset(
                  shareDiaryEntryIconPath,
                  width: 50,
                  height: 50,
                ),
              ),
            if (!isDialog && index == 0 && wasSharedWithinLastFourHrs)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.greenHappyColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: AppColors.greenHappyColor.withOpacity(0.1),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: const Text(
                  shared,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppColors.greenHappyColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
