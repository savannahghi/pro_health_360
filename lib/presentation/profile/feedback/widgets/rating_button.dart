import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class RatingButton extends StatelessWidget {
  const RatingButton({
    required this.value,
    required this.isSelected,
    required this.onPressed,
    required this.buttonKey,
  });

  final void Function(int value)? onPressed;
  final Key buttonKey;
  final bool isSelected;
  final int value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: buttonKey,
      onTap: () {
        onPressed?.call(value);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.unSelectedReactionBackgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: boldSize18Text(
              isSelected
                  ? AppColors.whiteColor
                  : AppColors.unSelectedReactionIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
