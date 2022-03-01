// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import '../../../../mocks.dart';

void main() {
  test('Content fromJson', () {
    expect(
      Content.fromJson(contentMock.first),
      isA<Content>(),
    );
  });

  test('Content initial is set', () {
    final Content initialAddress = Content.initial();

    expect(
      initialAddress.contentID,
      0,
    );
    expect(
      initialAddress.intro,
      UNKNOWN,
    );
  });
}
