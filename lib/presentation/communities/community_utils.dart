import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/communities/channel_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Widget channelPreviewBuilder(BuildContext context, Channel channel) {
  final Message? lastMessage =
      channel.state?.messages.reversed.firstWhereOrNull(
    (Message message) => !message.isDeleted,
  );

  String channelName = noTitleText;

  if (channel.extraData.containsKey('Name')) {
    channelName = channel.extraData['Name']! as String;
  }

  final String subtitle =
      lastMessage == null ? nothingYetText : lastMessage.text!;
  final double opacity = (channel.state?.unreadCount ?? 0) > 0 ? 1.0 : 0.5;

  final StreamChatThemeData theme = StreamChatTheme.of(context);

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
    leading: ChannelAvatar(channel: channel),
    title: Text(
      channelName,
      style: theme.channelPreviewTheme.titleStyle?.copyWith(
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
