import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data_state.dart';

import '../../../../../mocks.dart';

void main() {
  group('MedicalDataState', () {
    test('expects to convert MedicalDataState from json', () {
      final MedicalDataState medicalDataStateMock =
          MedicalDataState.fromJson(mockMedicalDataState);
      expect(medicalDataStateMock, isA<MedicalDataState>());
    });
  });
}
