import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/health_diary_state.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';

import '../../../mocks.dart';

void main() {
  test('HealthDiaryState should convert to/from JSON', () {
    expect(
      HealthDiaryState.initial()
          .toJson()
          .containsKey('getClientHealthDiaryEntries'),
      true,
    );

    final HealthDiaryState entryState = HealthDiaryState.fromJson(
      <String, dynamic>{'getClientHealthDiaryEntries': mockDiaryEntries},
    );

    expect(entryState.entries!.length, 2);
    expect(entryState.entries!.first, isA<HealthDiaryEntry>());
    expect(entryState.entries!.first!.mood, 'HAPPY');
  });
}
