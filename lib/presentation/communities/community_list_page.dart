// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/communities/channel_page.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;
import 'package:collection/collection.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class CommunityListViewPage extends StatefulWidget {
  const CommunityListViewPage({Key? key}) : super(key: key);

  @override
  State<CommunityListViewPage> createState() => _CommunityListViewPageState();
}

class _CommunityListViewPageState extends State<CommunityListViewPage> {
  late stream.StreamChatClient client;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      
    });
  }

  @override
  Widget build(BuildContext context) {
     client = stream.StreamChat.of(context).client;
    return AppScaffold(
      appBar:
          const CustomAppBar(title: communityPageString, showBackButton: false),
      body: StreamChat(
        client: client,
        child: ChannelsBloc(
          child: ChannelListView(
            filter: Filter.in_(
              'members',
              <String>[StreamChat.of(context).currentUser?.id ?? ''],
            ),
            channelPreviewBuilder: _channelPreviewBuilder,
            sort: const <SortOption<ChannelModel>>[
              SortOption<stream.ChannelModel>('last_message_at')
            ],
            limit: 20,
            channelWidget: const ChannelPage(),
          ),
        ),
      ),
    );
  }
}

Widget _channelPreviewBuilder(BuildContext context, Channel channel) {
  final stream.Message? lastMessage =
      channel.state?.messages.reversed.firstWhereOrNull(
    (stream.Message message) => !message.isDeleted,
  );

  final String subtitle =
      lastMessage == null ? 'nothing yet' : lastMessage.text!;
  final double opacity = (channel.state?.unreadCount ?? 0) > 0 ? 1.0 : 0.5;

  final stream.StreamChatThemeData theme = StreamChatTheme.of(context);

  return ListTile(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute<Route<dynamic>>(
          builder: (_) => StreamChannel(
            channel: channel,
            child: const ChannelPage(),
          ),
        ),
      );
    },
    leading: ChannelAvatar(
      channel: channel,
    ),
    title: ChannelName(
      textStyle: theme.channelPreviewTheme.titleStyle?.copyWith(
        color: theme.colorTheme.textHighEmphasis.withOpacity(opacity),
      ),
    ),
    subtitle: Text(subtitle),
    trailing: channel.state!.unreadCount > 0
        ? CircleAvatar(
            radius: 10,
            child: Text(channel.state!.unreadCount.toString()),
          )
        : const SizedBox(),
  );
}
