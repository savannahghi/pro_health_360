// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:misc_utilities/misc.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/message_input.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/quoted_message_widget.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/received_message_item.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/time_classification_widget.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';

import '../widgets/sender_type_widget.dart';
import '../widgets/sent_message_item.dart';

class CommunityChatScreenPage extends StatelessWidget {
  const CommunityChatScreenPage();

  @override
  Widget build(BuildContext context) {
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
        senderType: SenderTypeWidget(
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
          )),
      ReceivedMessageItem(
        senderName: 'Wanjiku',
        message: 'Don\'t miss your appointment tomorrow',
        time: '12:00pm',
        senderType: SenderTypeWidget(
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
        backgroundColor: AppColors.lightSkyBlueColor,
        appBar: MyAfyaHubAppBar(
          title: 'Ruaka Questions Group',
          trailingWidget: IconButton(
              key: moreAppBarKey,
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(comingSoonText)));
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: MessageInput(
                onChanged: (String value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: value));
                },
              ),
            )
          ]),
        ));
  }
}
