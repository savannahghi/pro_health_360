// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/home/bottom_nav_state.dart';
import '../../../../mocks.dart';

void main() {
  group('BottomNavigationState', () {
    test('expects to convert PhoneLoginResponse from json', () {
      final BottomNavigationState bottomNavigationState =
          BottomNavigationState.fromJson(mockBottomNavigationState);
      expect(bottomNavigationState, isA<BottomNavigationState>());
    });
  });
}
