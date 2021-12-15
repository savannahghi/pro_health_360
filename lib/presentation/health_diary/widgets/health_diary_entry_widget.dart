// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:myafyahub/domain/core/entities/health_diary/mood_item_data.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class HealthDiaryEntryWidget extends StatelessWidget {
  const HealthDiaryEntryWidget({Key? key, required this.diaryEntry})
      : super(key: key);

  final HealthDiaryEntry diaryEntry;

  @override
  Widget build(BuildContext context) {
    final Widget date = humanizeDate(
      dateTextStyle: TextThemes.normalSize12Text(),
      loadedDate: diaryEntry.createdAt!,
      showTime: true,
    );

    final String mood = removeUnderscores(diaryEntry.mood ?? '');
    final MoodItemData moodItemData = getMoodColor(mood);

    return Container(
      color: AppColors.whiteColor,
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
                  style: TextThemes.veryBoldSize14Text(moodItemData.color),
                  overflow: TextOverflow.ellipsis,
                ),
                verySmallVerticalSizedBox,
                Text(
                  diaryEntry.note ?? '',
                  style: TextThemes.normalSize12Text(
                    AppColors.secondaryColor.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
