// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/infrastructure/repository/migrations.dart';

void main() {
  test('migrations should have 7 migrations', () {
    expect(migrations.length, 7);
  });
}
