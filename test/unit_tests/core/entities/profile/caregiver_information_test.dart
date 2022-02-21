import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:myafyahub/domain/core/entities/profile/caregiver_information.dart';
import 'package:test/test.dart';

import '../../../../mocks.dart';

void main() {
  test('CaregiverInformation serialisation', () {
    expect(
      CaregiverInformation.fromJson(mockUpdateClientCareGiver),
      isA<CaregiverInformation>(),
    );

    final CaregiverInformation mockInstance = CaregiverInformation(
      clientID: 'clientID',
      firstName: 'John',
      lastName: 'Doe',
      phoneNumber: '+254798000000',
      caregiverType: CaregiverType.Sibling,
    );

    expect(
      mockInstance.toJson(),
      mockUpdateClientCareGiver,
    );
  });
}
