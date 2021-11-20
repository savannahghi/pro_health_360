// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_mood_selection.dart';
import 'package:myafyahub/presentation/engagement/home/widgets/app_upgrader.dart';
import 'package:myafyahub/presentation/feed/widgets/recent_feed_content.dart';
import 'package:myafyahub/presentation/feed/widgets/suggested_groups_section_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    MyAfyaHubFacebookEvents().logger.logEvent(name: 'view_home_page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homepageContentKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: DoubleBackToCloseApp(
        snackBar: snackbar(content: pressToExitText, durationSeconds: 3),
        child: AppScaffold(
          appBar: const CustomAppBar(showBackButton: false),
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              BeWellUpgrader(),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: MyAfyaHubMoodSelection(),
              ),
              const RecentFeedContent(),
              smallVerticalSizedBox,
              const SuggestedGroupsSection()
            ],
          ),
        ),
      ),
    );
  }
}
