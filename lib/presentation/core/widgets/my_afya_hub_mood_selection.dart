// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/widgets/mood_selection/mood_item.dart';

class MyAfyaHubMoodSelection extends StatelessWidget {
  const MyAfyaHubMoodSelection();

  @override
  Widget build(BuildContext context) {
    final UserProfileState? userProfileState =
        StoreProvider.state<AppState>(context)!.userProfileState;
    final String lastName =
        userProfileState!.userProfile!.userBioData!.firstName!.getValue();

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.srcOver,
          ),
          fit: BoxFit.cover,
          image: const AssetImage(moodSelectionBackgroundUrl),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            smallVerticalSizedBox,
            Text(
              howAreYouFeelingTodayText(lastName),
              style: TextThemes.boldSize24Text().copyWith(color: white),
            ),
            mediumVerticalSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MoodItem(
                  key: excitedMoodKey,
                  moodIcon: excitedIconSvgPath,
                  moodText: excitedString,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      BWRoutes.moodFeedbackPage,
                      arguments: MoodType.Excited,
                    );
                  },
                ),
                MoodItem(
                  key: happyMoodKey,
                  moodIcon: happyIconSvgPath,
                  moodText: happyString,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      BWRoutes.moodFeedbackPage,
                      arguments: MoodType.Happy,
                    );
                  },
                ),
                MoodItem(
                  key: mehMoodKey,
                  moodIcon: mehIconSvgPath,
                  moodText: mehString,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      BWRoutes.moodFeedbackPage,
                      arguments: MoodType.Meh,
                    );
                  },
                ),
                MoodItem(
                  key: sadMoodKey,
                  moodIcon: sadIconSvgPath,
                  moodText: sadString,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      BWRoutes.moodFeedbackPage,
                      arguments: MoodType.Sad,
                    );
                  },
                ),
                MoodItem(
                  key: verySadMoodKey,
                  moodIcon: verySadIconSvgPath,
                  moodText: verySadString,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      BWRoutes.moodFeedbackPage,
                      arguments: MoodType.VerySad,
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
