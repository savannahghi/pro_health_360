// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_config.dart';

void main() {
  test('OnboardingPathConfig', () {
    const String route = 'sampleRoute';
    final OnboardingPathConfig onboardingPath = OnboardingPathConfig(route);

    expect(onboardingPath.route, equals(route));
  });
}
