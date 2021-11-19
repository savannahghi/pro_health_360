import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';

import '../../../mocks.dart';

void main() {
  test('User fromJson', () {
    expect(
      User.fromJson(mockUser),
      isA<User>(),
    );
  });

  test('User initial is set', () {
    final User initialUser = User.initial();

    expect(
      initialUser.secondaryContacts!.length,
      0,
    );
  });
}
