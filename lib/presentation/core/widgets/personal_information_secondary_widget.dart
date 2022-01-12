// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

class PersonalInformationSecondaryWidget extends StatelessWidget {
  final String fieldName;
  final String fieldValue;

  const PersonalInformationSecondaryWidget({
    required this.fieldName,
    required this.fieldValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              fieldName,
              overflow: TextOverflow.ellipsis,
              style: TextThemes.boldSize15Text(),
            ),
            Text(
              fieldValue,
              style: TextThemes.normalSize14Text(AppColors.greyTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
