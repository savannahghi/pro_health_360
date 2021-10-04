import 'package:flutter/material.dart';

import 'package:misc_utilities/number_constants.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/application/core/services/utils.dart';

class LandingPageActions extends StatefulWidget {
  const LandingPageActions({Key? key}) : super(key: key);

  @override
  LandingPageActionsState createState() => LandingPageActionsState();
}

class LandingPageActionsState extends State<LandingPageActions> {
  @override
  void initState() {
    MyAfyaHubFacebookEvents().logger.setAdvertiserTracking(enabled: true);
    MyAfyaHubFacebookEvents().logger.logEvent(name: 'view_landing_page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final OnboardingStrings onboardingStrings = OnboardingStrings.of(context)!;
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: preferredPaddingOnStretchedScreens(context: context)),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: isLargeScreen ? number300 : double.infinity,
                height: number52,
                child: SILPrimaryButton(
                  buttonKey: loginWithPhoneKey,
                  onPressed: () {
                    MyAfyaHubFacebookEvents()
                        .logger
                        .logViewContent(id: 'click_login_button');
                    // should navigate to [PhoneLogin] page, which serves existing users
                    Navigator.pushNamed(context, BWRoutes.phoneLogin);
                  },
                  buttonColor: Theme.of(context).primaryColor,
                  text: onboardingStrings.loginText(),
                ),
              ),
              mediumVerticalSizedBox,
            ],
          ),
        );
      },
    );
  }
}
