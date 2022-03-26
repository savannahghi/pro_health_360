// Package imports:

import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/appointments/appointment.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/enums.dart';

void main() {
  test('Appointment should convert to/fromJson', () {
    final Map<String, dynamic> appointment = Appointment(
      type: 'Scheduled clinic visit',
      reason: 'A small reason',
      date: '2022-03-13',
      start: '0000-01-01T11:07:56Z',
      end: '0000-01-01T12:07:56Z',
      status: AppointmentStatus.MISSED,
    ).toJson();

    expect(
      Appointment.fromJson(appointment),
      isA<Appointment>(),
    );

    expect(appointment.containsKey('date'), true);
  });
}
