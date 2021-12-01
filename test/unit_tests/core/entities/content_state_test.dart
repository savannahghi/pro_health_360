// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/content_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';
import '../../../mocks.dart';

void main() {
  test('ContentState fromJson', () {
    expect(
      ContentState.fromJson(<String, dynamic>{
        'items': <dynamic>[contentMock.first]
      }),
      isA<ContentState>(),
    );
  });

  test('ContentState initial is set', () {
    final ContentState initialAddress = ContentState.initial();

    expect(
      initialAddress,
      ContentState(
        contentItems: <Content>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
        selectedCategory: ContentCategory.initial(),
      ),
    );
  });
}
