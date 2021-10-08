// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/sil_appbar_user.dart';

/// [MyAfyaHubAppBar] is a custom [AppBar] used within this apps' pages.
class MyAfyaHubAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// [MyAfyaHubAppBar] is a custom [AppBar] used within this apps' pages.
  ///
  /// [leadingWidget] defaults to [MyAfyaHubAppbarUser] if not widget is provided.
  ///
  /// [trailingWidget] defaults to notifications icon if not widget is provided.
  ///
  const MyAfyaHubAppBar({
    this.leadingWidget,
    this.title,
    this.trailingWidget,
  });

  final Widget? leadingWidget;
  final String? title;
  final Widget? trailingWidget;

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (leadingWidget != null)
                Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: leadingWidget),
              if (leadingWidget == null)
                const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: MyAfyaHubAppbarUser()),
              Text(
                title ?? '',
                style: TextThemes.boldSize16Text()
                    .copyWith(color: AppColors.secondaryColor),
              ),
              if (trailingWidget != null)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: trailingWidget,
                ),
              if (trailingWidget == null)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: SvgPicture.asset(
                    notificationIcon,
                    color: AppColors.secondaryColor,
                    width: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
