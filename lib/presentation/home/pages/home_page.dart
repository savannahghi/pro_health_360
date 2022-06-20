import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/connectivity_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/communities/suggested_groups/suggested_groups_section_widget.dart';
import 'package:myafyahub/presentation/content/widgets/recent_content_widget.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/core/widgets/no_connection_widget.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tools_carousel.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_checker.dart';
import 'package:myafyahub/presentation/home/widgets/survey_carousel.dart';

class HomePage extends StatelessWidget {
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
        child: StoreConnector<AppState, ConnectivityViewModel>(
          converter: (Store<AppState> store) =>
              ConnectivityViewModel.fromStore(store),
          builder: (BuildContext context, ConnectivityViewModel vm) {
            if (!vm.connectivityState.isConnected) {
              return const NoConnectionWidget();
            }
            return SingleChildScrollView(
              child: Column(
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
                  mediumVerticalSizedBox,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
