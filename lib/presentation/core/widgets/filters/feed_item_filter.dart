// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// FeedItemFilter
///
/// [FeedItemFilter] filters feed content.
///
/// [filterIcon], [filterText] and [onTap] are all required.
///
/// [isActive] must be to toggle on successful [onTap].
///
class FeedItemFilter extends StatelessWidget {
  /// [FeedItemFilter] filters feed content.
  ///
  /// [filterIcon], [filterText] and [onTap] are all required.
  ///
  /// [isActive] must be to toggle on successful [onTap].
  ///
  const FeedItemFilter({
    this.isActive = false,
    required this.filterIcon,
    required this.filterText,
    required this.onTap,
  });

  final bool isActive;
  final IconData filterIcon;
  final String filterText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: isActive ? AppColors.secondaryColor : Colors.grey.shade300,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Icon(
                filterIcon,
                color: isActive ? white : AppColors.secondaryColor,
                size: 24.0,
              ),
              smallHorizontalSizedBox,
              Text(
                filterText,
                style: TextThemes.normalSize16Text().copyWith(
                    color: isActive ? white : AppColors.secondaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
