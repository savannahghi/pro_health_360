import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, required this.onTapped}) : super(key: key);
  final Function onTapped;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.whiteColor,
      child: InkWell(
        key: appBarBackButtonKey,
        borderRadius: BorderRadius.circular(50),
        splashColor: Theme.of(context).colorScheme.secondary,
        onTap: () => onTapped.call(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(
            backIconPath,
            color: AppColors.secondaryColor,
            width: 24,
          ),
        ),
      ),
    );
  }
}
