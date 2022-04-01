import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data_response.dart';

import '../../../../../mocks.dart';

void main() {
  group('MedicalDataResponse', () {
    test('expects to convert MedicalDataResponse from json', () {
      expect(MedicalDataResponse.initial(), isA<MedicalDataResponse>());
      final MedicalDataResponse medicalDataResponseMock =
          MedicalDataResponse.fromJson(mockMedicalDataResponse);
      expect(medicalDataResponseMock, isA<MedicalDataResponse>());
      
    });
  });
}
