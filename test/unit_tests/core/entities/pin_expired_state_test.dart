import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/login/pin_expired_state.dart';

void main() {
  const Map<String, dynamic> pinExpiredJson = <String, dynamic>{
    'phone': '+254712345678',
    'isPhoneVerified': false,
    'isPINChanged': false,
    'pin': '1234',
    'confirmPIN': '1234',
    'otp': '2345',
  };

  test('PinExpired from Json', () {
    final PINExpiredState state = PINExpiredState.fromJson(pinExpiredJson);
    expect(state.pin, '1234');
    expect(state.confirmPIN, '1234');
  });
}
