// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/infrastructure/repository/migrations.dart';

void main() {
  test('migrations should have 4 migrations', () {
    expect(migrations.length, 4);
  });
}
