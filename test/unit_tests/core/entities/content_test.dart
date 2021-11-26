// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import '../../../mocks.dart';

// Project imports:

void main() {
  test('Content should convert data to/from JSON', () {
    expect(
      Content.fromJson(contentMock.first).contentType,
      ContentType.ARTICLE,
    );
    expect(
      Content.fromJson(contentMock.first).likeCount,
      180,
    );
  });
}
