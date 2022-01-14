// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/bottom_nav_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/bottom_nav_view_model.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BottomNavViewModel>(
      converter: (Store<AppState> store) => BottomNavViewModel.fromStore(store),
      builder: (BuildContext context, BottomNavViewModel vm) {
        return BottomNavigationBar(
          key: bottomNavKey,
          currentIndex: vm.currentIndex,
          backgroundColor: AppColors.whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: AppColors.secondaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int currentIndex) {
            StoreProvider.dispatch<AppState>(
              context,
              BottomNavAction(currentBottomNavIndex: currentIndex),
            );

            if (vm.currentIndex != currentIndex) {
              Navigator.pushReplacementNamed(
                context,
                bottomNavItems[currentIndex].onTapRoute,
              );

              if (BottomNavIndex.myHealth.index == currentIndex &&
                  shouldInputPIN(context)) {
                Navigator.pushReplacementNamed(
                  context,
                  BWRoutes.pinInputPage,
                );
              }
            }
          },
          items: bottomNavItems
              .map(
                (BottomNavItem navItem) => BottomNavigationBarItem(
                  icon: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          navItem.iconUrl,
                          color: AppColors.secondaryColor.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        navItem.text,
                        style: TextThemes.normalSize12Text(
                          AppColors.secondaryColor.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                  activeIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 65,
                    decoration: BoxDecoration(
                      color: AppColors.selectedBottomNavColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset(
                            navItem.iconUrl,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          navItem.text,
                          style: TextThemes.normalSize12Text(Colors.white),
                        )
                      ],
                    ),
                  ),
                  label: navItem.text,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
