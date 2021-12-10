// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/saved_content_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import '../../../mocks.dart';

void main() {
  test('SavedContentState fromJson', () {
    expect(
      SavedContentState.fromJson(<String, dynamic>{
        'items': <dynamic>[contentMock.first]
      }),
      isA<SavedContentState>(),
    );
  });

  test('SavedContentState initial is set', () {
    final SavedContentState initialSavedContentState =
        SavedContentState.initial();

    expect(
      initialSavedContentState,
      SavedContentState(
        savedContentItems: <Content>[],
        errorFetchingContent: false,
        timeoutFetchingContent: false,
      ),
    );
  });
}
