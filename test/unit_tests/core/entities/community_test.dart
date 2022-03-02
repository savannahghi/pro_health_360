// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/community.dart';
import '../../../mocks.dart';

void main() {
  test('Community fromJson', () {
    expect(
      Community.fromJson(mockCommunity),
      isA<Community>(),
    );
  });

  test('Community initial is set', () {
    final Community initialCommunity = Community.initial();

    expect(
      initialCommunity.id,
      UNKNOWN,
    );
    expect(
      initialCommunity.name,
      UNKNOWN,
    );
    expect(
      initialCommunity.memberCount,
      0,
    );
    expect(
      initialCommunity.description,
      UNKNOWN,
    );
     expect(
      initialCommunity.createdBy,
      UNKNOWN,
    );
  });
}
