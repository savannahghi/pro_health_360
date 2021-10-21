// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/login/change_pin.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'createPIN': '1234',
    'confirmPIN': '1234',
    'invalidCredentials': false,
  };
  test('ChangePIN toJson', () {
    expect(
      ChangePIN(
        createPIN: '1234',
        confirmPIN: '1234',
      ).toJson(),
      data,
    );
  });

  test('ChangePIN fromJson', () {
    expect(
      ChangePIN.fromJson(data),
      isA<ChangePIN>(),
    );
  });
}
