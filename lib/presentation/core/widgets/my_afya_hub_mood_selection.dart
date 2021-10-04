import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/widgets/mood_selection/mood_item.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

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
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(blendedBackgroundImg),
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
                    moodIcon: Icons.insert_emoticon_outlined,
                    moodText: excitedString,
                    onTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackbar(content: comingSoonText));
                    },
                  ),
                  MoodItem(
                    key: happyMoodKey,
                    moodIcon: Icons.insert_emoticon_outlined,
                    moodText: happyString,
                    onTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackbar(content: comingSoonText));
                    },
                  ),
                  MoodItem(
                    key: mehMoodKey,
                    moodIcon: Icons.outlet_outlined,
                    moodText: mehString,
                    onTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackbar(content: comingSoonText));
                    },
                  ),
                  MoodItem(
                    key: sadMoodKey,
                    moodIcon: Icons.mood_bad_outlined,
                    moodText: sadString,
                    onTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackbar(content: comingSoonText));
                    },
                  ),
                  MoodItem(
                    key: verySadMoodKey,
                    moodIcon: Icons.mood_bad_outlined,
                    moodText: verySadString,
                    onTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackbar(content: comingSoonText));
                    },
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
