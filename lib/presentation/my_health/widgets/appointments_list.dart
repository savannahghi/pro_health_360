// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:myafyahub/domain/core/entities/appointments/appointment.dart';
import 'package:myafyahub/presentation/my_health/widgets/appointment_list_item.dart';

// Project imports:

class AppointmentListWrapper extends StatelessWidget {
  const AppointmentListWrapper({required this.appointments});

  ///[AppointmentListWrapper] renders notifications as a list for appointments page
  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (BuildContext context, int index) {
        final Appointment currentAppointmentDetails =
            appointments.elementAt(index);

        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: AppointmentListItem(appointment: currentAppointmentDetails),
        );
      },
    );
  }
}
