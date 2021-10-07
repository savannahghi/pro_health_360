// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class MessageInput extends StatelessWidget {
  /// [MessageInput] used within the community chat screen to take input of messages
  /// to send.
  ///
  /// [onChanged] is required.
  ///
  const MessageInput({
    required this.onChanged,
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                  hintText: typeYourMessageHereString,
                  hintStyle: TextStyle(color: AppColors.darkGreyTextColor),
                  border: InputBorder.none),
              onChanged: onChanged,
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                key: messageInputAttachFileKey,
                onTap: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(),
                  child: SvgPicture.asset(
                    attachFileIcon,
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
              smallHorizontalSizedBox,
              GestureDetector(
                key: messageInputSendMessageKey,
                onTap: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: comingSoonText));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: SvgPicture.asset(
                    sendTextIcon,
                    color: Colors.white,
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
