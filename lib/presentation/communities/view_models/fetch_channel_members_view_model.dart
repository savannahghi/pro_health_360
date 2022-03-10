import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class FetchChannelMembersViewModel extends Vm {
  final Wait wait;
  final List<stream.Member>? members;

  FetchChannelMembersViewModel({required this.wait, this.members})
      : super(equals: <Object?>[wait, members]);

  factory FetchChannelMembersViewModel.fromStore(AppState store) {
    return FetchChannelMembersViewModel(
      wait: store.wait!,
      members: store.miscState?.channelMembersState?.members,
    );
  }
}
