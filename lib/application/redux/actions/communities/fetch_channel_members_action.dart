import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/communities/channel_members_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class FetchChannelMembersAction extends ReduxAction<AppState> {
  FetchChannelMembersAction(this.channel);

  final Channel channel;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchMembersFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchMembersFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    try {
      final QueryMembersResponse membersResponse = await channel.queryMembers();

      final ChannelMembersState? newState = state.miscState?.channelMembersState
          ?.copyWith(members: membersResponse.members);

      final AppState newAppState = state.copyWith(
        miscState: state.miscState?.copyWith(channelMembersState: newState),
      );

      return newAppState;
    } catch (exception, stacktrace) {
      Sentry.captureException(
        exception,
        stackTrace: stacktrace,
      );
      throw UserException(getErrorMessage());
    }
  }
}
