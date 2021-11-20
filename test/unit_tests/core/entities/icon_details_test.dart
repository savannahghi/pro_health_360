// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/icon_details.dart';
import '../../../mocks.dart';

void main() {
  group('IconDetails', () {
    test('expects to convert IconDetails from json', () {
      final IconDetails iconDetails = IconDetails.fromJson(mockIconDetails);
      expect(iconDetails, isA<IconDetails>());
    });
  });
}
