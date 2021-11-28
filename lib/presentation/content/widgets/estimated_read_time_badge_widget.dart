import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/text_themes.dart';

class EstimatedReadTimeBadge extends StatelessWidget {
  const EstimatedReadTimeBadge({Key? key, required this.estimateReadTime})
      : super(key: key);

  final int estimateReadTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: AppColors.readTimeBackgroundColor,
      ),
      child: Text(
        contentReadDuration(estimateReadTime),
        style: TextThemes.boldSize12Text(Colors.white),
      ),
    );
  }
}
