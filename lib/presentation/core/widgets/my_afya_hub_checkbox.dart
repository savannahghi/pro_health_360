// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class MyAfyaHubCheckBox extends StatelessWidget {
  const MyAfyaHubCheckBox({
    required this.value,
    required this.text,
    required this.onChanged,
    this.onTap,
    this.child,
    this.checkBoxKey,
  });

  final Key? checkBoxKey;
  final Widget? child;
  final ValueChanged<bool?>? onChanged;
  final Function? onTap;
  final String? text;
  final bool? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          key: checkBoxKey,
          activeColor: AppColors.secondaryColor,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: child ??
              Text(
                text ?? '',
                style: TextThemes.normalSize14Text(AppColors.secondaryColor),
              ),
        )
      ],
    );
  }
}
