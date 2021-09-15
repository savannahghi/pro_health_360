import 'package:myafyahub/domain/core/entities/login/phone_login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'invalidCredentials': false,
    'phoneNumber': '+254728101710',
    'pinCode': '1234'
  };
  test('PhoneLogin toJson', () {
    expect(
      PhoneLogin(phoneNumber: '+254728101710', pinCode: '1234').toJson(),
      data,
    );
  });

  test('PhoneLogin fromJson', () {
    expect(
      PhoneLogin.fromJson(data),
      isA<PhoneLogin>(),
    );
  });
}
