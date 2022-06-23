import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

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
                style: boldSize22Text(AppColors.primaryColor),
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
