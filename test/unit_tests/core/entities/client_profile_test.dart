// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';

import '../../../mocks.dart';

void main() {
  test('ClientProfile fromJson', () {
    expect(
      ClientProfile.fromJson(mockClientProfile),
      isA<ClientProfile>(),
    );
  });

  test('ClientProfile initial is set', () {
    final ClientProfile initialClientProfile = ClientProfile.initial();

    expect(
      initialClientProfile.treatmentEnrollmentDate,
      UNKNOWN,
    );
    expect(
      initialClientProfile.facilityID,
      UNKNOWN,
    );
  });
}
