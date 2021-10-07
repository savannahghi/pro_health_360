// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/services/connectivity_helper.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/bottom_nav_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/event_obj.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/events.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class MyAfyaHubBottomNavigationBar extends StatelessWidget {
  const MyAfyaHubBottomNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final AppState state = StoreProvider.state<AppState>(context)!;
    final String appContext =
        getEnvironmentContext(AppWrapperBase.of(context)!.appContexts);

    return BottomNavigationBar(
      key: silBottomNavKey,
      currentIndex: currentIndex,
      backgroundColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: AppColors.secondaryColor,
      onTap: (int currentIndex) {
        StoreProvider.dispatch<AppState>(
            context, BottomNavAction(currentBottomNavIndex: currentIndex));

        if (BottomNavIndex.home.index == currentIndex) {
          publishEvent(
            hasAccessedFeedEvent(appContext),
            EventObject(
              firstName: state
                  .userProfileState!.userProfile!.userBioData!.firstName!
                  .getValue(),
              lastName: state
                  .userProfileState!.userProfile!.userBioData!.lastName!
                  .getValue(),
              uid: state.userProfileState!.auth!.uid,
              primaryPhoneNumber: state
                  .userProfileState!.userProfile!.primaryPhoneNumber!
                  .getValue(),
              flavour: Flavour.CONSUMER.name,
              timestamp: DateTime.now(),
            ),
          );
        }
        if (BottomNavIndex.feed.index == currentIndex) {
          publishEvent(
            hasNavigatedToLibraryPageEvent(appContext),
            EventObject(
              firstName: state
                  .userProfileState!.userProfile!.userBioData!.firstName!
                  .getValue(),
              lastName: state
                  .userProfileState!.userProfile!.userBioData!.lastName!
                  .getValue(),
              uid: state.userProfileState!.auth!.uid,
              primaryPhoneNumber: state
                  .userProfileState!.userProfile!.primaryPhoneNumber!
                  .getValue(),
              flavour: Flavour.CONSUMER.name,
              timestamp: DateTime.now(),
            ),
          );
        }
      },
      items: bottomNavItems
          .map(
            (BottomNavItem navItem) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                navItem.iconUrl,
                color: AppColors.secondaryColor.withOpacity(0.8),
              ),
              activeIcon: SvgPicture.asset(
                navItem.iconUrl,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: navItem.text,
            ),
          )
          .toList(),
    );
  }
}
