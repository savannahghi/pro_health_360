// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';

void main() {
  test('ContentCategory fromJson', () {
    expect(
      ContentCategory.fromJson(<String, dynamic>{
        'ID': 1,
        'categoryName': '1',
        'categoryIcon': '1',
      }),
      isA<ContentCategory>(),
    );
  });

  test('ContentCategory initial is set', () {
    final ContentCategory initialAddress = ContentCategory.initial();

    expect(
      initialAddress.id,
      0,
    );
    expect(
      initialAddress.name,
      'all',
    );
  });
}
