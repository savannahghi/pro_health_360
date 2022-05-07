// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
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
    final NotificationType notificationType =
        notificationDetails?.type ?? NotificationType.UNKNOWN;

    final Widget date = humanizeDate(
      dateTextStyle: normalSize10Text(AppColors.greyTextColor.withOpacity(0.6)),
      loadedDate: notificationDetails?.createdAt ?? '',
      showTime: true,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          notificationDetails?.body ?? '',
          style: normalSize12Text(AppColors.secondaryColor),
        ),
        smallVerticalSizedBox,
        date,
        smallVerticalSizedBox,
        if (notificationType == NotificationType.APPOINTMENT ||
            notificationType == NotificationType.COMMUNITIES)
          SizedBox(
            height: 34,
            child: MyAfyaHubPrimaryButton(
              buttonKey: notificationItemActionKey,
              buttonColor: AppColors.primaryColor.withOpacity(0.14),
              text: getNotificationActionString(notificationType),
              textStyle: normalSize11Text(AppColors.primaryColor),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                getNotificationActionRoute(notificationType),
                (Route<dynamic> route) => false,
              ),
            ),
          ),
        verySmallVerticalSizedBox,
      ],
    );
  }
}
