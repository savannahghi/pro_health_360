// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Package imports:
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/set_push_token_action.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/communities/suggested_groups/suggested_groups_section_widget.dart';
import 'package:myafyahub/presentation/content/widgets/recent_content_widget.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tools_carousel.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_checker.dart';
import 'package:myafyahub/presentation/home/widgets/survey_carousel.dart';
import 'package:shared_themes/spaces.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    StoreProvider.dispatch(
      context,
      SetPushToken(
        firebaseMessaging: FirebaseMessaging.instance,
        client: AppWrapperBase.of(context)!.graphQLClient,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: homepageContentKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(
        showBackButton: false,
        title: homeString,
      ),
      body: DoubleBackToCloseApp(
        snackBar: snackbar(content: pressToExitText, durationSeconds: 3),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const MoodChecker(),
            smallVerticalSizedBox,
            const ScreeningToolsCarousel(),
            smallVerticalSizedBox,
            const RecentContentWidget(),
            smallVerticalSizedBox,
            const SuggestedGroupsSection(),
            smallVerticalSizedBox,
            const SurveyCarousel(),
          ],
        ),
      ),
    );
  }
}
