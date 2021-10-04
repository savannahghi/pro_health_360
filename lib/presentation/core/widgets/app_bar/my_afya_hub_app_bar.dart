import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/sil_appbar_user.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class MyAfyaHubAppBar extends StatelessWidget implements PreferredSizeWidget {
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
              leadingWidget ?? const MyAfyaHubAppbarUser(),
              Text(
                title ?? '',
                style: TextThemes.boldSize16Text()
                    .copyWith(color: AppColors.secondaryColor),
              ),
              trailingWidget ?? mediumHorizontalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
