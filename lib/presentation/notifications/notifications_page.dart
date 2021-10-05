import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/notification_list_item.dart';
import 'package:myafyahub/presentation/notifications/notification_details.dart';

class NotificationsPage extends StatelessWidget {
  final List<NotificationDetails> notifications;

  const NotificationsPage({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAfyaHubAppBar(
        title: notificationsText,
        leadingWidget: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: SvgPicture.asset(
            backIcon,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (BuildContext context, int index) {
              final String description =
                  notifications.elementAt(index).description;
              final String date = notifications.elementAt(index).date;
              final bool? isAlternateNotification =
                  notifications.elementAt(index).isAlternateNotification;
              final String iconPath = notifications.elementAt(index).svgPath;
              final bool? isCalendar = notifications.elementAt(index).calendar;

              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: NotificationListItem(
                  isAlternateNotification: isAlternateNotification,
                  svgPath: iconPath,
                  description: description,
                  date: date,
                  calendarDate: isCalendar,
                ),
              );
            }),
      ),
    );
  }
}
