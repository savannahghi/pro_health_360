// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/infrastructure/repository/database_base.dart';

void main() {
  test('TablesEx should return correct name', () {
    expect(Tables.connectivityState.name, 'connectivityState');
    expect(Tables.userProfileState.name, 'userProfileState');
    expect(Tables.userFeedState.name, 'userFeedState');
    expect(Tables.miscState.name, 'miscState');
    expect(Tables.unknown.name, 'unknown');
  });
}
