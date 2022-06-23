// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/community.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import '../../../mocks.dart';

void main() {
  test('Community fromJson', () {
    final Community community = Community.fromJson(mockCommunity);
    expect(
      community,
      isA<Community>(),
    );

    expect(community.clientType?.first.name, ClientType.PMTCT.name);
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
      Member.initial(),
    );
  });
}
