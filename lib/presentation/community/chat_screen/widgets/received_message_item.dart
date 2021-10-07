// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:misc_utilities/number_constants.dart';
// Project imports:
import 'package:myafyahub/presentation/community/chat_screen/widgets/sender_type_widget.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

import 'quoted_message_widget.dart';

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
  final SenderTypeWidget? senderType;
  final QuotedMessageWidget? quotedMessageWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: number50),
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
                child: Row(children: <Widget>[
                  Text(
                    senderName,
                    style: TextThemes.normalSize10Text().copyWith(
                        color: AppColors.userInitialsColor,
                        fontFamily: AppFonts.latoFont),
                  ),
                  smallHorizontalSizedBox,
                  senderType ?? smallHorizontalSizedBox,
                ]),
              ),
              quotedMessageWidget ?? smallVerticalSizedBox,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  message,
                  style: TextThemes.normalSize12Text().copyWith(
                      color: AppColors.whiteColor,
                      fontFamily: AppFonts.latoFont),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  time,
                  style: TextThemes.normalSize10Text().copyWith(
                      color: AppColors.userInitialsColor,
                      fontFamily: AppFonts.latoFont),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
