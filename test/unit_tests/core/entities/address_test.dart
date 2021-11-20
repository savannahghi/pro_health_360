// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/address.dart';
import '../../../mocks.dart';

void main() {
  test('Address fromJson', () {
    expect(
      Address.fromJson(mockAddress),
      isA<Address>(),
    );
  });

  test('Address initial is set', () {
    final Address initialAddress = Address.initial();

    expect(
      initialAddress.active,
      false,
    );
    expect(
      initialAddress.text.toString(),
      UNKNOWN,
    );
    expect(
      initialAddress.country,
      UNKNOWN,
    );
  });
}
