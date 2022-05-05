import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/communities/group_info/pages/group_info_page.dart';
import 'package:shared_themes/spaces.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Channel channel = StreamChannel.of(context).channel;
    String channelImage = '';

    String channelName = noTitleText;

    if (channel.extraData.containsKey('Name')) {
      channelName = channel.extraData['Name']! as String;
    }

    if (channel.extraData.containsKey('image')) {
      channelImage = channel.extraData['image']! as String;
    }

    return Scaffold(
      appBar: ChannelHeader(
        title: Text(
          channelName,
          overflow: TextOverflow.ellipsis,
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<Route<dynamic>>(
                  builder: (_) => StreamChannel(
                    channel: channel,
                    child: GroupInfoPage(channelName: channelName),
                  ),
                ),
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: channelImage.isNotEmpty
                    ? Image.network(
                        channelImage,
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset(
                        acceptInvitesImage,
                        height: 30,
                        width: 30,
                      ),
              ),
            ),
          ),
          size15HorizontalSizedBox,
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              threadBuilder: (_, Message? parentMessage) => ThreadPage(
                parent: parentMessage,
              ),
              pinPermissions: const <String>['admin', 'user', 'owner'],
            ),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}

class ThreadPage extends StatelessWidget {
  const ThreadPage({
    Key? key,
    this.parent,
  }) : super(key: key);

  final Message? parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThreadHeader(
        parent: parent!,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              parentMessage: parent,
            ),
          ),
          MessageInput(
            parentMessage: parent,
          ),
        ],
      ),
    );
  }
}
