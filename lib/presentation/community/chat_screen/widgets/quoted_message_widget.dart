import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class QuotedMessageWidget extends StatelessWidget {
  /// [QuotedMessageWidget] used within the [ReceivedMessageItem] and [SentMessageItem] to
  /// show highlighted message.
  ///
  /// [senderName] and [message] are all required.
  ///
  const QuotedMessageWidget({
    required this.senderName,
    required this.message,
  });

  final String senderName;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
          ),
          color: AppColors.userInitialsColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  senderName,
                  style: TextThemes.normalSize10Text().copyWith(
                      color: AppColors.userDetailsCardBackgroundColor),
                ),
              ),
              smallVerticalSizedBox,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextThemes.normalSize12Text()
                      .copyWith(color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
