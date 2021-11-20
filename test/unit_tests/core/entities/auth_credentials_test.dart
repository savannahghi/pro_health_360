// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import '../../../mocks.dart';

void main() {
  test('AuthCredentials fromJson', () {
    expect(
      AuthCredentials.fromJson(mockAuthCredentials),
      isA<AuthCredentials>(),
    );
  });

  test('AuthCredentials initial is set', () {
    final AuthCredentials initialAuthCredentials = AuthCredentials.initial();

    expect(
      initialAuthCredentials.idToken,
      UNKNOWN,
    );
    expect(
      initialAuthCredentials.expiresIn,
      UNKNOWN,
    );
  });
}
