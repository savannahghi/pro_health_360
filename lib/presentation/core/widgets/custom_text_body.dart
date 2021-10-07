// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [CustomTextBody] is a shared widget to display the description on the [ListItemCard] widget
///
/// It takes in a required [body] parameters
class CustomTextBody extends StatelessWidget {
  const CustomTextBody({required this.body});

  final String body;

  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      style: TextThemes.boldSize16Text(AppColors.primaryColor),
    );
  }
}
