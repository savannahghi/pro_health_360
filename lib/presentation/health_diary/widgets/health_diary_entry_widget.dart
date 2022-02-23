// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:myafyahub/domain/core/entities/health_diary/mood_item_data.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

class HealthDiaryEntryWidget extends StatelessWidget {
  const HealthDiaryEntryWidget({Key? key, required this.diaryEntry})
      : super(key: key);

  final HealthDiaryEntry diaryEntry;

  @override
  Widget build(BuildContext context) {
    final Widget date = humanizeDate(
      dateTextStyle: normalSize12Text(),
      loadedDate: diaryEntry.createdAt!,
      showTime: true,
    );

    final String mood = removeUnderscores(diaryEntry.mood ?? '');
    final MoodItemData moodItemData = getMoodColor(mood);

    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.listCardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                moodItemData.svgIconUrl,
                height: 32,
                color: moodItemData.color,
              ),
            ),
            smallHorizontalSizedBox,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    diaryEntry.note ?? '',
                    style: normalSize12Text(
                      AppColors.secondaryColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
