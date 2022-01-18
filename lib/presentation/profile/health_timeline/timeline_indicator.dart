// Flutter imports:
import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

class TimelineIndicator extends StatelessWidget {
  const TimelineIndicator({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                date.day.toString(),
                style: boldSize22Text(AppColors.greyTextColor),
              ),
              Text(
                '${date.month}/${date.year}',
                style: normalSize10Text(AppColors.greyTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
