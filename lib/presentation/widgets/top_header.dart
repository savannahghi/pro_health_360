// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/widgets/wheel_back_button.dart';

/// this widget renders a header for an intro page
class PageTopHeader extends StatelessWidget {
  const PageTopHeader({
    required this.title,
    required this.description,
    required this.color,
    this.widget,
    this.radius = 0,
  });

  final Color color;
  final String description;
  final double radius;
  final String title;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WheelBackButton(
                color: AppColors.whiteColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              size40VerticalSizedBox,
              Text(
                title,
                style: TextThemes.boldSize20Text(AppColors.whiteColor),
              ),
              size15VerticalSizedBox,
              Text(
                description,
                style: TextThemes.normalSize16Text(AppColors.whiteColor),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(radius),
            ),
          ),
          child: widget ?? const SizedBox(),
        ),
      ],
    );
  }
}
