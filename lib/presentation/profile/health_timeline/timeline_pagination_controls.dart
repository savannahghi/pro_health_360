import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class TimelinePaginationControls extends StatelessWidget {
  const TimelinePaginationControls({
    Key? key,
    required this.lowerBound,
    required this.upperBound,
    this.prevPageAction,
    this.nextPageAction,
  }) : super(key: key);

  final String lowerBound;
  final String upperBound;
  final VoidCallback? prevPageAction;
  final VoidCallback? nextPageAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.unSelectedReactionBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 85,
              height: 46,
              decoration: BoxDecoration(
                color: prevPageAction == null
                    ? Colors.grey
                    : AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: prevPageAction,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Text(
                    lowerBound,
                    style: const TextStyle(color: AppColors.primaryColor),
                  ),
                  const Text(
                    '-',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  Text(
                    upperBound,
                    style: const TextStyle(color: AppColors.primaryColor),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    itemsText,
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
            Container(
              width: 85,
              height: 46,
              decoration: BoxDecoration(
                color: nextPageAction == null
                    ? Colors.grey
                    : AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: nextPageAction,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
