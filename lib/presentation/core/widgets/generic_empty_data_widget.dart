// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class GenericEmptyData extends StatelessWidget {
  /// The item that is missing.Could be content, the feed etc
  final String item;

  final String? customMessage;

  const GenericEmptyData({this.item = 'Content', this.customMessage});

  @override
  Widget build(BuildContext context) {
    final String noDataText =
        'There is no ${item.toLowerCase()} available for you at this time. Kindly check back later for more';

    return Container(
      key: genericContainerKey,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset(emptyStateCover),
            Text(
              'No ${item.toLowerCase()} available',
              style: TextThemes.boldSize22Text(),
            ),
            const SizedBox(height: 8),
            Text(
              customMessage ?? noDataText,
              textAlign: TextAlign.center,
              style: TextThemes.normalSize15Text(AppColors.greyTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
