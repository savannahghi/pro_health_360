import 'package:flutter/cupertino.dart';
import 'package:myafyahub/domain/core/entities/core/icon_details.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_actions.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_details.dart';
import 'package:myafyahub/presentation/core/widgets/notification_list_item.dart';

class AppointmentListWrapper extends StatelessWidget {
  ///[AppointmentListWrapper] renders notifications as a list for appointments page
  final List<NotificationDetails> appointments;

  const AppointmentListWrapper({required this.appointments});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (BuildContext context, int index) {
        final String description = appointments.elementAt(index).description;
        final String date = appointments.elementAt(index).date;
        final IconDetails icon = appointments.elementAt(index).icon;
        final List<NotificationActions>? actions =
            appointments.elementAt(index).actions;
        final String? status = appointments.elementAt(index).status;

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
      },
    );
  }
}
