import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/communities_state.dart';

import '../../../mocks.dart';

void main() {
  test('CommunitiesState convert from json', () {
    final CommunitiesState communitiesState =
        CommunitiesState.fromJson(mockCommunitiesState);

    expect(communitiesState.invitedCommunities!.length, 1);
  });
}
