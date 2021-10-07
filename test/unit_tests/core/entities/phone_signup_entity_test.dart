// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/login/phone_signup.dart';

void main() {
  BookAppointmentSubject().clearSubject();
  final Map<String, dynamic> data = <String, dynamic>{
    'acceptCommunicationTerms': false,
    'accountCreated': false,
    'accountExists': false,
    'confirmPin': '1234',
    'createPin': '1234',
    'invalidCredentials': false,
    'otp': '123456',
    'phoneNumber': '+254728101710'
  };
  test('PhoneSignUp toJson', () {
    expect(
      PhoneSignUp(
        phoneNumber: '+254728101710',
        createPin: '1234',
        confirmPin: '1234',
        otp: '123456',
      ).toJson(),
      data,
    );
  });

  test('PhoneSignUp fromJson', () {
    expect(
      PhoneSignUp.fromJson(data),
      isA<PhoneSignUp>(),
    );
  });
}
