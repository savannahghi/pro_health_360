// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.clip,
      style: TextThemes.normalSize14Text(AppColors.greyColor),
    );
  }
}
