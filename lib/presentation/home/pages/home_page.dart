import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/connectivity_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/communities/suggested_groups/suggested_groups_section_widget.dart';
import 'package:pro_health_360/presentation/content/widgets/recent_content_widget.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:pro_health_360/presentation/core/widgets/no_connection_widget.dart';
import 'package:pro_health_360/presentation/health_diary/screening_tools/widgets/screening_tools_carousel.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_checker.dart';
import 'package:pro_health_360/presentation/home/widgets/survey_carousel.dart';

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
