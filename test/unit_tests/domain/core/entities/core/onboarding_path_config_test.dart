// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('OnboardingPathConfig', () {
    const String route = 'sampleRoute';
    final OnboardingPathConfig onboardingPath =
        OnboardingPathConfig(route: route);

    expect(onboardingPath.route, equals(route));
  });
}
