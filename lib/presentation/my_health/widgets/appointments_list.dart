// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/notification/notification_details.dart';
import 'package:myafyahub/presentation/core/widgets/notification_list_item.dart';

class AppointmentListWrapper extends StatelessWidget {
  const AppointmentListWrapper({required this.appointments});

  ///[AppointmentListWrapper] renders notifications as a list for appointments page
  final List<NotificationDetails> appointments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (BuildContext context, int index) {
        final NotificationDetails currentAppointmentDetails =
            appointments.elementAt(index);

        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: NotificationListItem(
            notificationDetails: currentAppointmentDetails,
          ),
        );
      },
    );
  }
}
