// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/home_state.dart';

void main() {
  group('HomeState', () {
    test('fromJson works correctly', () {
      final HomeState fromJson =
          HomeState.fromJson(HomeState.initial().toJson());

      final HomeState actual = HomeState(
        canRecordMood: false,
        createHealthDiaryEntry: false,
      );

      expect(fromJson, actual);
    });
  });
}
