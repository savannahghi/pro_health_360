// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:myafyahub/presentation/communities/suggested_groups/suggested_groups_section_widget.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tools_carousel.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/widgets/recent_content_widget.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_checker.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homepageContentKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: DoubleBackToCloseApp(
        snackBar: snackbar(content: pressToExitText, durationSeconds: 3),
        child: AppScaffold(
          appBar: const CustomAppBar(showBackButton: false),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const MoodChecker(),
                smallVerticalSizedBox,
                const ScreeningToolsCarousel(),
                const RecentContentWidget(),
                smallVerticalSizedBox,
                const SuggestedGroupsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
