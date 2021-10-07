// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:misc_utilities/misc.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/bottom_nav_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/home/pages/pages_tabs.dart';
import 'package:myafyahub/presentation/engagement/home/widgets/myafyahub_bottom_navigation_bar.dart';
import 'package:myafyahub/presentation/help_center/sil_help_center_button.dart';

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
    return StoreConnector<AppState, BottomNavViewModel>(
      converter: (Store<AppState> store) => BottomNavViewModel.fromStore(store),
      builder: (BuildContext context, BottomNavViewModel vm) {
        return Scaffold(
          key: homepageContentKey,
          backgroundColor: Theme.of(context).backgroundColor,
          floatingActionButton: const SILHelpCenterButton(),
          body: DoubleBackToCloseApp(
            snackBar: snackbar(content: pressToExitText, durationSeconds: 3),
            child: pagesTabs[vm.currentIndex],
          ),
          bottomNavigationBar:
              MyAfyaHubBottomNavigationBar(currentIndex: vm.currentIndex),
        );
      },
    );
  }
}
