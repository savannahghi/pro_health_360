import 'package:flutter/material.dart';
import 'package:misc_utilities/number_constants.dart';
import 'package:myafyahub/presentation/community/chat_screen/widgets/awaiting_moderation_widget.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

import 'quoted_message_widget.dart';

/// [SentMessageItem] used within the community chat screen to show sent messages.
class SentMessageItem extends StatelessWidget {
  /// [SentMessageItem] used within the community chat screen to show sent messages.
  ///
  /// [message] and [time] are all required.
  ///
  /// [senderType] shows whether user is i.e. Moderator or Doctor.
  ///
  /// [isAwaitingModeratio] used to show whether sent message is awaiting moderation.
  ///
  /// [highlightedMessage] adds a highlighted message.
  ///
  const SentMessageItem({
    required this.message,
    required this.time,
    this.isAwaitingModeration = false,
    this.highlightedMessage,
  });

  final String message;
  final String time;
  final bool isAwaitingModeration;
  final QuotedMessageWidget? highlightedMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: number50),
      child: Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
              ),
              color: AppColors.userDetailsCardBackgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      message,
                      style: TextThemes.normalSize12Text()
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                  highlightedMessage ?? smallVerticalSizedBox,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      time,
                      style: TextThemes.normalSize10Text()
                          .copyWith(color: AppColors.userInitialsColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isAwaitingModeration) const AwaitingModerationWidget(),
        ],
      ),
    );
  }
}
