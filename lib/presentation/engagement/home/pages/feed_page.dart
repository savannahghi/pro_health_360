// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_mood_selection.dart';
import 'package:myafyahub/presentation/engagement/home/widgets/bewell_upgrader.dart';

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
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          BeWellUpgrader(),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: MyAfyaHubMoodSelection(),
          ),
        ],
      ),
    );
  }
}
