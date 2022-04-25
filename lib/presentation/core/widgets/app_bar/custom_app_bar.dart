// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/app_bar_back_button.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/app_bar_notification.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/app_bar_user.dart';

/// [CustomAppBar] is a custom [AppBar] used for navigation and showing basic
/// user controls
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// [CustomAppBar] is a custom [AppBar] used for navigation and showing basic
  /// user controls
  ///
  /// [leadingWidget] defaults to [AppbarUser] if no widget is provided.
  ///
  /// [trailingWidget] defaults to [AppBarNotification] no widget is provided.
  ///
  const CustomAppBar({
    this.leadingWidget = const AppbarUser(),
    this.title,
    this.trailingWidget = const AppBarNotification(),
    this.showBackButton = true,
  });

  final Widget? leadingWidget;
  final String? title;
  final Widget? trailingWidget;

  // whether to show the back button instead of the profile image. defaults to
  // true because most screens use it
  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0.35, 0),
              color: Colors.grey.withOpacity(0.2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (showBackButton) const AppBarBackButton() else leadingWidget!,

            Flexible(
              child: Text(
                title ?? '',
                style:
                    boldSize16Text().copyWith(color: AppColors.secondaryColor),
              ),
            ),

            // This can never be null because the default widget is already
            // set in the constructor
            trailingWidget!,
          ],
        ),
      ),
    );
  }
}
