// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/core/services/app_bootstrap.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';

void main() {
  test('Contact fromJson', () {
    final DeepLinkSubject deepLink = DeepLinkSubject();
    // save link and navigate later
    deepLink.hasLink.add(true);
    deepLink.link.add('route');
    deepLink.navigatorKey = navigatorKey;

    expect(deepLink.link.value, 'route');
    expect(deepLink.hasLink.value, true);
  });
}
