// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import 'package:myafyahub/domain/core/entities/notification/notification_details.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/core/widgets/notification_list_item.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({required this.notifications});

  final List<NotificationDetails> notifications;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: notificationsText,
        trailingWidget: SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            final NotificationDetails currentNotificationDetails =
                notifications.elementAt(index);

            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: NotificationListItem(
                notificationDetails: currentNotificationDetails,
              ),
            );
          },
        ),
      ),
    );
  }
}
