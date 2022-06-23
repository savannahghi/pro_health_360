// Package imports:

import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/appointments/appointment.dart';

void main() {
  test('Appointment should convert to/fromJson', () {
    final Map<String, dynamic> appointment = Appointment(
      id: '1234',
      reason: 'A small reason',
      date: '2022-03-13',
      pendingReschedule: false,
    ).toJson();

    expect(
      Appointment.fromJson(appointment),
      isA<Appointment>(),
    );

    expect(appointment.containsKey('date'), true);
  });
}
