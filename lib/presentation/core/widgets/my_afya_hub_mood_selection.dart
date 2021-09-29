import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/widgets/mood_selection/mood_item.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class MyAfyaHubMoodSelection extends StatelessWidget {
  const MyAfyaHubMoodSelection({required this.onTap, required this.user});

  final String user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(blendedBackgroundImg),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            smallVerticalSizedBox,
            Text(
              howAreYoufeelingTodayText(user),
              style: TextThemes.boldSize24Text().copyWith(color: white),
            ),
            mediumVerticalSizedBox,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MoodItem(
                    moodIcon: Icons.insert_emoticon_outlined,
                    moodText: excitedString,
                    onTap: onTap,
                  ),
                  MoodItem(
                    moodIcon: Icons.insert_emoticon_outlined,
                    moodText: happyString,
                    onTap: onTap,
                  ),
                  MoodItem(
                    moodIcon: Icons.outlet_outlined,
                    moodText: mehString,
                    onTap: onTap,
                  ),
                  MoodItem(
                    moodIcon: Icons.mood_bad_outlined,
                    moodText: sadString,
                    onTap: onTap,
                  ),
                  MoodItem(
                    moodIcon: Icons.mood_bad_outlined,
                    moodText: verySadString,
                    onTap: onTap,
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
