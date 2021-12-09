import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/feed/content_details.dart';

import '../../../mocks.dart';

void main() {
  test('ContentDetails fromJson', () {
    expect(
      ContentDetails.fromJson(<String, dynamic>{
        'content': contentMock.first,
        'showReactions': true,
      }),
      isA<ContentDetails>(),
    );
  });
}
