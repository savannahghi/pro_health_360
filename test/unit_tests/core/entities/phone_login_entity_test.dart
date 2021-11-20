// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/login/phone_login_state.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'invalidCredentials': false,
    'phoneNumber': '+254728101710',
    'pinCode': '1234'
  };
  test('PhoneLogin toJson', () {
    expect(
      PhoneLoginState(phoneNumber: '+254728101710', pinCode: '1234').toJson(),
      data,
    );
  });

  test('PhoneLogin fromJson', () {
    expect(
      PhoneLoginState.fromJson(data),
      isA<PhoneLoginState>(),
    );
  });
}
