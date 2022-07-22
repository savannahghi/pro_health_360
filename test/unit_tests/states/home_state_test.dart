// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/home_state.dart';

void main() {
  group('HomeState', () {
    test('fromJson works correctly', () {
      final HomeState fromJson =
          HomeState.fromJson(HomeState.initial().toJson());

      final HomeState actual = HomeState(
        canRecordMood: true,
        createHealthDiaryEntry: false,
      );

      expect(fromJson, actual);
    });
  });
}
