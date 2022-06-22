import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/communities/channel_members_state.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() {
  test('should convert to json', () {
    final ChannelMembersState state = ChannelMembersState(
      members: <Member>[Member(user: User(id: 'some-id', name: 'John Doe'))],
    );
    final Map<String, dynamic> result = state.toJson();

    expect(result, isA<Map<String, dynamic>>());

    final List<Member> members = result['members'] as List<Member>;
    expect(members.first.user?.name, 'John Doe');
    expect(members.first.user?.id, 'some-id');
  });

  test('should convert from json', () {
    final Map<String, dynamic> json = <String, dynamic>{
      'members': <Map<String, dynamic>>[
        <String, dynamic>{
          'user': <String, dynamic>{'id': 'some-id', 'name': 'John Doe'}
        }
      ]
    };

    final ChannelMembersState state = ChannelMembersState.fromJson(json);
    final Member? member = state.members?.first;

    expect(member?.user?.id, 'some-id');
    expect(member?.user?.name, 'John Doe');
  });
}
