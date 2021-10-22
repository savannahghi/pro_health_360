// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/domain/core/entities/core/icon_details.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_actions.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

/// [NotificationListItem] Displays the notifications with Icons and a short description
class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    required this.icon,
    required this.description,
    required this.date,
    this.actions,
    this.status,
  });

  final List<NotificationActions>? actions;
  final String date;
  final String description;
  final IconDetails icon;
  final String? status;

  @override
  Widget build(BuildContext context) {
    final String iconString = icon.iconUrlSvgPath;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // The leading icon
        Container(
          key: notificationIconContainerKey,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: SvgPicture.asset(
            iconString,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        smallHorizontalSizedBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // The status indicator badge
              if (status != null && status!.isNotEmpty)
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.redColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    status!,
                    style: TextThemes.boldSize12Text(AppColors.redColor),
                  ),
                ),
              // verySmallVerticalSizedBox,
              Text(
                description,
                style: TextThemes.normalSize12Text(AppColors.secondaryColor),
              ),
              const SizedBox(height: 5),
              Text(
                date,
                style: TextThemes.normalSize12Text(Colors.grey),
              ),
              const SizedBox(height: 10),
              if (actions != null && actions!.isNotEmpty)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions!
                      .map(
                        (NotificationActions notificationActions) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: AppColors.secondaryColor,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  notificationActions.icon.iconUrlSvgPath,
                                  width: 15,
                                  height: 15,
                                  color: AppColors.secondaryColor,
                                ),
                                smallHorizontalSizedBox,
                                Text(
                                  notificationActions.name,
                                  style: TextThemes.normalSize11Text(
                                    AppColors.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
            ],
          ),
        )
      ],
    );
  }
}
