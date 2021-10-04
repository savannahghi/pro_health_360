import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/connectivity_helper.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/event_obj.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/events.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:user_feed/user_feed.dart';

class SILHelpCenterButton extends StatelessWidget {
  const SILHelpCenterButton();

  void helpCenterNavigationFunction(BuildContext context, AppState state) {
    MyAfyaHubFacebookEvents().logger.logEvent(name: 'view_healp_center_page');
    Navigator.pushNamed(context, BWRoutes.helpCenter);
    final String appContext =
        getEnvironmentContext(AppWrapperBase.of(context)!.appContexts);

    publishEvent(
      hasNavigatedToHelpCenterPageEvent(appContext),
      EventObject(
        firstName: state.userProfileState!.userProfile!.userBioData!.firstName!
            .getValue(),
        lastName: state.userProfileState!.userProfile!.userBioData!.lastName!
            .getValue(),
        uid: state.userProfileState!.auth!.uid,
        primaryPhoneNumber:
            state.userProfileState!.userProfile!.primaryPhoneNumber!.getValue(),
        flavour: Flavour.CONSUMER.name,
        timestamp: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppState state = StoreProvider.state<AppState>(context)!;
    return FloatingActionButton(
      key: helpCenterButtonKey,
      foregroundColor: Theme.of(context).primaryColor,
      splashColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => helpCenterNavigationFunction(context, state),
      child: SvgPicture.asset(helpCenterButtonImageUrl,
          key: helpCenterButtonImage),
    );
  }
}
