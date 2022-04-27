// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/core/services/utils.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

/// [NotificationListItem] Displays the notifications with Icons and a short description
class NotificationListItem extends StatelessWidget {
  const NotificationListItem({required this.notificationDetails});

  final NotificationDetails? notificationDetails;

  @override
  Widget build(BuildContext context) {
    final String iconString = getNotificationIcon(
      notificationDetails?.type ?? NotificationType.UNKNOWN,
    );

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
            height: 18,
            width: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        smallHorizontalSizedBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 6),
              Text(
                notificationDetails?.body ?? UNKNOWN,
                style: normalSize12Text(AppColors.secondaryColor),
              ),
              const SizedBox(height: 5),
              Text(
                notificationDetails?.createdAt ?? UNKNOWN,
                style: normalSize12Text(Colors.grey),
              ),
              const SizedBox(height: 10),
              if (notificationDetails?.actions != null &&
                  notificationDetails!.actions!.isNotEmpty)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: notificationDetails!.actions!
                      .map(
                        (NotificationActions notificationActions) => Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: AppColors.primaryColor,
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
                                  color: AppColors.primaryColor,
                                ),
                                smallHorizontalSizedBox,
                                Text(
                                  notificationActions.name,
                                  style:
                                      normalSize11Text(AppColors.primaryColor),
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
