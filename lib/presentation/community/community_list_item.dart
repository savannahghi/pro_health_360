// Flutter imports:
import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/router/routes.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// List items used within the coummunity page to show incoming messages.
class CommunityListItem extends StatelessWidget {
  /// List items used within the community page to show incoming messages.
  ///
  /// [title], [message], [avatarImage] and [date] are all required.
  ///
  /// [isGroup] is used to determine whether the message is a group message.
  ///
  /// If [unreadNotificationCount] is provided, it must be an integer greater
  /// than or equal to zero.
  const CommunityListItem({
    bool? isGroup,
    this.unreadNotificationCount,
    this.avatarImage,
    required this.title,
    required this.message,
    required this.date,
  })  : isGroup = isGroup ?? false,
        assert(unreadNotificationCount == null || unreadNotificationCount >= 0);

  final int? unreadNotificationCount;
  final String title;
  final bool isGroup;
  final String message;
  final ImageProvider? avatarImage;
  final String date;

  @override
  Widget build(BuildContext context) {
    final bool hasUnreadNotifications =
        unreadNotificationCount != null && unreadNotificationCount! > 0;

    CircleAvatar circleAvatar;
    if (avatarImage != null) {
      circleAvatar = CircleAvatar(
        backgroundImage: avatarImage,
        radius: 30,
      );
    } else {
      circleAvatar = CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey,
        child: Icon(
          UniconsLine.user_square,
          color: Colors.grey.shade300,
          size: 30,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          BWRoutes.communityChatScreenPage,
        );
      },
      child: Container(
        color: hasUnreadNotifications ? Colors.grey.shade200 : null,
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
        child: Row(
          children: <Widget>[
            // pic
            Expanded(
              child: circleAvatar,
            ),

            const SizedBox(width: 10),

            Expanded(
              flex: 4,
              child: Column(
                children: <Widget>[
                  // group and date
                  Row(
                    mainAxisAlignment: isGroup
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: <Widget>[
                      if (isGroup)
                        Text(
                          groupText,
                          style:
                              TextThemes.normalSize10Text(Colors.grey.shade600),
                        ),
                      Text(
                        date,
                        style:
                            TextThemes.normalSize10Text(Colors.grey.shade600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Chat title
                          Text(
                            title,
                            style: TextThemes.boldSize14Text(
                                AppColors.secondaryColor),
                          ),
                          const SizedBox(height: 4),
                          // message
                          Text(
                            message,
                            style: TextThemes.normalSize10Text(
                                Colors.grey.shade600),
                          )
                        ],
                      ),

                      // Notification count
                      if (hasUnreadNotifications)
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            radius: 15,
                            child: Text(
                              '$unreadNotificationCount',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
