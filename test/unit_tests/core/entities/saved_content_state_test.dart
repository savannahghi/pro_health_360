// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/saved_content_state.dart';
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
