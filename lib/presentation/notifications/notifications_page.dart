// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import 'package:myafyahub/domain/core/entities/core/icon_details.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_actions.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_details.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/notification_list_item.dart';

class NotificationsPage extends StatelessWidget {
  final List<NotificationDetails> notifications;

  const NotificationsPage({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: notificationsText),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (BuildContext context, int index) {
              final String description =
                  notifications.elementAt(index).description;
              final String date = notifications.elementAt(index).date;
              final IconDetails icon = notifications.elementAt(index).icon;
              final List<NotificationActions>? actions =
                  notifications.elementAt(index).actions;
              final String? status = notifications.elementAt(index).status;

              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: NotificationListItem(
                  icon: icon,
                  actions: actions,
                  status: status,
                  description: description,
                  date: date,
                ),
              );
            }),
      ),
    );
  }
}
