// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/featured_media.dart';

void main() {
  test('Featured Media initial is set', () {
    final FeaturedMedia featuredMedia = FeaturedMedia.initial();

    expect(
      featuredMedia.id,
      0,
    );
    expect(
      featuredMedia.title,
      UNKNOWN,
    );
  });
}
