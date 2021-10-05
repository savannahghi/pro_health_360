// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_mood_selection.dart';
import 'package:myafyahub/presentation/core/widgets/new_content.dart';
import 'package:myafyahub/presentation/core/widgets/suggested_groups_section_widget.dart';
import 'package:myafyahub/presentation/engagement/home/widgets/bewell_upgrader.dart';
import 'package:myafyahub/presentation/feed/feed_details.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

/// [minDays] is the number of days since the app was first installed that
/// the user is allowed to use the app before a rating dialog appears.
///
/// [minLaunches] is the number of launches for the app since it was first
/// installed by the user. When the [minLaunches] is greater than 7 times
/// and [minDays] is more than three days, it means the rating dialog should
/// appear.
///
/// [shouldRateApp] is a boolean that determines if the rating dialog should
/// be rendered on the screen

class _FeedPageState extends State<FeedPage> {
  late int minDays;
  late int minLaunches;
  late bool shouldRateApp;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      final MiscState? miscState =
          StoreProvider.state<AppState>(context)!.miscState;

      minDays = miscState?.appReviewObj?.days ?? 0;
      minLaunches = miscState?.appReviewObj?.launches ?? 0;
      shouldRateApp = miscState?.appReviewObj?.shouldRateApp ?? true;

      if (shouldRateApp && minLaunches > 8 && minDays > 3) {
        await showRatingBottomSheet(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<FeedDetails> feedItems = <FeedDetails>[
      FeedDetails(
        coverImageUrl: feedImage1,
        header: feedHeaderListSavedVideo,
        date: '21 Oct 2021',
      ),
      FeedDetails(
        coverImageUrl: feedImage2,
        header: feedHeaderListSavedVideo,
        date: '21 Oct 2021',
      )
    ];

    // this is dummy data. it should be removed once the backend is integrated
    final List<Map<String, dynamic>> suggestedGroups = <Map<String, dynamic>>[
      <String, dynamic>{
        'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
        'title': 'Kilimani',
        'totalMembers': '1.3k Members',
      },
      <String, dynamic>{
        'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
        'title': 'Ruaraka',
        'totalMembers': '1.3k Members',
      },
      <String, dynamic>{
        'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
        'title': 'Ruaraka',
        'totalMembers': '1.3k Members',
      },
      <String, dynamic>{
        'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
        'title': 'Ruaraka',
        'totalMembers': '1.3k Members',
      }
    ];
    return Scaffold(
      appBar: const MyAfyaHubAppBar(),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          BeWellUpgrader(),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: MyAfyaHubMoodSelection(),
          ),
          NewContent(feedItems: feedItems),
          SuggestedGroupsSection(suggestedGroups: suggestedGroups)
        ],
      ),
    );
  }
}
