import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/medical_data_details.dart';

import '../../../../../mocks.dart';

void main() {
  group('MedicalDataDetails', () {
    test('expects to convert MedicalDataDetails from json', () {
      expect(MedicalDataDetails.initial(), isA<MedicalDataDetails>());
      final MedicalDataDetails medicalDataDetailsMock =
          MedicalDataDetails.fromJson(mockMedicalDataDetails);
      expect(medicalDataDetailsMock, isA<MedicalDataDetails>());
    });
  });
}
