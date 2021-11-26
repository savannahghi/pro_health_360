// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';

void main() {
  group('hasTokenExpired', () {
    test('should return false when time not yet expired', () {
      final DateTime now = DateTime(1922, 12, 30);
      final DateTime expiresAt = DateTime(1991, 12, 26);

      expect(hasTokenExpired(expiresAt, now), false);
    });

    test('should return true if time has expired', () {
      final DateTime now = DateTime.now();
      DateTime expiresAt = now.add(const Duration(minutes: 60));

      expiresAt = now.add(const Duration(minutes: 10));
      expect(hasTokenExpired(expiresAt, now), false);

      expiresAt = now.add(const Duration(minutes: 9));
      expect(hasTokenExpired(expiresAt, now), true);
    });
  });
}
