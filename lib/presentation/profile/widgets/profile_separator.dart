// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/number_constants.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/number_constants.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class ProfileSeparator extends StatelessWidget {
  final String text;

  const ProfileSeparator({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(number22, number15, number22, number5),
      decoration: const BoxDecoration(
        color: AppColors.greySeparatorColor,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text.toUpperCase(),
          style: TextThemes.boldSize12Text().copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: number8,
          ),
        ),
      ),
    );
  }
}
