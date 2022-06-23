// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class AppBarNotification extends StatelessWidget {
  const AppBarNotification({required this.bottomNavIndex, Key? key})
      : super(key: key);
  final int bottomNavIndex;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.whiteColor,
      child: InkWell(
        key: appBarNotificationKey,
        borderRadius: BorderRadius.circular(50),
        splashColor: Theme.of(context).colorScheme.secondary,
        onTap: () => Navigator.of(context)
            .pushNamed(AppRoutes.notificationsPage, arguments: bottomNavIndex),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(
            notificationIcon,
            color: AppColors.secondaryColor,
            width: 24,
          ),
        ),
      ),
    );
  }
}
