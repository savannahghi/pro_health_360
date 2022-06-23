// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:pro_health_360/application/redux/actions/bottom_nav_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/home/bottom_nav_items.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({required this.bottomNavIndex, Key? key})
      : super(key: key);
  final int bottomNavIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: bottomNavKey,
      currentIndex: bottomNavIndex,
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

        if (bottomNavIndex != currentIndex) {
          Navigator.pushReplacementNamed(
            context,
            bottomNavItems[currentIndex].onTapRoute,
          );
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
                    style: normalSize12Text(
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
                      style: normalSize12Text(Colors.white),
                    )
                  ],
                ),
              ),
              label: navItem.text,
            ),
          )
          .toList(),
    );
  }
}
