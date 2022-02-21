// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/communities/chat_screen/widgets/more_menu_drop_down.dart';
import 'package:myafyahub/presentation/communities/chat_screen/widgets/received_message_item.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/communities/chat_screen/widgets/sender_type_widget.dart'
    as local;

class CommunityChatScreenPage extends StatefulWidget {
  const CommunityChatScreenPage({required this.communityChatData});

  final CommunityListItem communityChatData;

  @override
  _CommunityChatScreenPageState createState() =>
      _CommunityChatScreenPageState();
}

class _CommunityChatScreenPageState extends State<CommunityChatScreenPage> {
  @override
  Widget build(BuildContext context) {
    String newMessage = messageText;
    const List<Widget> messages = <Widget>[
      TimeClassificationWidget(time: 'Today'),
      Align(
        alignment: Alignment.topLeft,
        child: ReceivedMessageItem(
          senderName: 'Wanjiku',
          message: 'Don\'t miss your appointment tomorrow',
          time: '12:00pm',
        ),
      ),
      ReceivedMessageItem(
        senderName: 'Wanjiku',
        message: 'Don\'t miss your appointment tomorrow',
        time: '12:00pm',
      ),
      ReceivedMessageItem(
        senderName: 'Wanjiku',
        message: 'Don\'t miss your appointment tomorrow',
        time: '12:00pm',
        senderType: local.SenderTypeWidget(
          senderTitle: 'Moderator',
          senderIcon: moderatorIcon,
        ),
        quotedMessageWidget: QuotedMessageWidget(
          senderName: 'senderName',
          message:
              'Don\'t miss your appointment tomorrow Don\'t miss your appointment tomorrow',
        ),
      ),
      SentMessageItem(
        message: 'Don\'t miss your appointment tomorrow',
        time: '12:00pm',
        isAwaitingModeration: true,
        highlightedMessage: QuotedMessageWidget(
          senderName: 'senderName',
          message:
              'Don\'t miss your appointment tomorrow Don\'t miss your appointment tomorrow',
        ),
      ),
      ReceivedMessageItem(
        senderName: 'Wanjiku',
        message: 'Don\'t miss your appointment tomorrow',
        time: '12:00pm',
        senderType: local.SenderTypeWidget(
          senderTitle: 'Doctor',
          senderIcon: moderatorIcon,
        ),
      ),
      ReceivedMessageItem(
        senderName: 'Wanjiku',
        message: 'Don\'t miss your appointment tomorrow',
        time: '12:00pm',
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(
        title: widget.communityChatData.title,
        trailingWidget: const MoreMenuDropDown(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 14,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Align(
                      alignment: messages[index] is TimeClassificationWidget
                          ? Alignment.topCenter
                          : messages[index] is ReceivedMessageItem
                              ? Alignment.topLeft
                              : Alignment.topRight,
                      child: messages[index],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MessageInput(
                onChanged: (String value) {
                  newMessage = value;
                },
                onTap: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(newMessage),
                      ),
                    );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
