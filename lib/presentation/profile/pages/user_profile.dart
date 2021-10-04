import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/user_profile_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';

import 'package:myafyahub/presentation/profile/widgets/signed_user_profile_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';

import 'package:myafyahub/application/core/services/onboarding_utils.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    MyAfyaHubFacebookEvents().logger.logEvent(name: 'view_profile_page');

    /// clear any active flags
    clearAllFlags(context);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserProfileViewModel>(
        converter: (Store<AppState> store) =>
            UserProfileViewModel.fromStore(store),
        builder: (BuildContext context, UserProfileViewModel vm) {
          return const SignedUserProfileScaffold();
        });
  }
}
