// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/login/create_pin.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'newPIN': '1234',
    'confirmPIN': '1234',
  };
  test('ChangePIN toJson', () {
    expect(
      CreatePIN(
        newPIN: '1234',
        confirmPIN: '1234',
      ).toJson(),
      data,
    );
  });

  test('ChangePIN fromJson', () {
    expect(
      CreatePIN.fromJson(data),
      isA<CreatePIN>(),
    );
  });
}
