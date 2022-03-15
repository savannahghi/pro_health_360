// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/login/set_pin_state.dart';

void main() {
  test('should convert from/to json', () {
    final SetPINState state = SetPINState.initial();
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());

    final SetPINState result2 = SetPINState.fromJson(<String, dynamic>{
      'phone': '254700111222',
      'isPINSet': true,
      'isResetPin': false,
    });

    expect(result2.isPINSet, true);
  });
}
