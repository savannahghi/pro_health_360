// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/login/verify_phone_state.dart';

void main() {
  test('should convert from/to json', () {
    final VerifyPhoneState state = VerifyPhoneState.initial();
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());

    final VerifyPhoneState result2 =
        VerifyPhoneState.fromJson(<String, dynamic>{'otp': '1234'});

    expect(result2.otp, '1234');
  });
}
