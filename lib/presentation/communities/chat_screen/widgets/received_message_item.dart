// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:myafyahub/presentation/communities/chat_screen/widgets/sender_type_widget.dart'
    as local;

/// [ReceivedMessageItem] used within the community chat screen to show received messages.
class ReceivedMessageItem extends StatelessWidget {
  /// [ReceivedMessageItem] used within the community chat screen to show received messages.
  ///
  /// [senderName], [message] and [time] are all required.
  ///
  /// [senderType] shows whether user is i.e. Moderator or Doctor.
  ///
  /// [highlightedMessage] adds a highlighted message.
  ///
  const ReceivedMessageItem({
    required this.senderName,
    required this.message,
    required this.time,
    this.senderType,
    this.quotedMessageWidget,
  });

  final String senderName;
  final String message;
  final String time;
  final local.SenderTypeWidget? senderType;
  final QuotedMessageWidget? quotedMessageWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
          ),
          color: AppColors.userDetailsCardBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      senderName,
                      style: normalSize10Text()
                          .copyWith(color: AppColors.userInitialsColor),
                    ),
                    smallHorizontalSizedBox,
                    senderType ?? smallHorizontalSizedBox,
                  ],
                ),
              ),
              quotedMessageWidget ?? smallVerticalSizedBox,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  message,
                  style:
                      normalSize12Text().copyWith(color: AppColors.whiteColor),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  time,
                  style: normalSize10Text()
                      .copyWith(color: AppColors.userInitialsColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
