// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import '../../../mocks.dart';

void main() {
  group('IconDetails', () {
    test('expects to convert IconDetails from json', () {
      final IconDetails iconDetails = IconDetails.fromJson(mockIconDetails);
      expect(iconDetails, isA<IconDetails>());
    });
  });
}
