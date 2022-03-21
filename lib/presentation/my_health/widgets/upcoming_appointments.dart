// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/appointments/appointment.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/my_health/widgets/appointment_list_item.dart';

class UpcomingAppointments extends StatelessWidget {
  final List<Appointment> appointments = <Appointment>[...upcomingAppointments];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (BuildContext context, int index) {
        final Appointment currentAppointmentDetails =
            appointments.elementAt(index);

        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: AppointmentListItem(
            appointment: currentAppointmentDetails,
            appointmentListTye: AppointmentListTye.Upcoming,
          ),
        );
      },
    );
  }
}
