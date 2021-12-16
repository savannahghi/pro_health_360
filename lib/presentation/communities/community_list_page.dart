// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/community_list_item.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class CommunityListViewPage extends StatelessWidget {
  const CommunityListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder
    const String appointmentReminderText =
        'Don\'t miss your appointment tomorrow';
    const AssetImage avatarImage = AssetImage(profileImage);
    const String date = 'July 12 2021';

    const List<Widget> items = <Widget>[
      CommunityListItem(
        title: 'Ruaka Questions group',
        message: appointmentReminderText,
        lastMessageDate: date,
        unreadNotificationCount: 4,
        avatarImage: avatarImage,
        isGroupMessage: true,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        message: appointmentReminderText,
        lastMessageDate: date,
        unreadNotificationCount: 4,
        avatarImage: avatarImage,
        isGroupMessage: true,
      ),
      CommunityListItem(
        title: 'My Afya Guide',
        message: appointmentReminderText,
        lastMessageDate: date,
        unreadNotificationCount: 4,
        avatarImage: avatarImage,
        isGroupMessage: true,
      ),
      CommunityListItem(
        title: 'My Afya Guide',
        message: appointmentReminderText,
        lastMessageDate: date,
        unreadNotificationCount: 4,
        avatarImage: avatarImage,
        isGroupMessage: true,
      ),
    ];

    return AppScaffold(
      appBar:
          const CustomAppBar(title: communityPageString, showBackButton: false),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListView.builder(
            key: communityListViewKey,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (_, int index) {
              return GestureDetector(
                key: communityListGestureDetectorKey,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    BWRoutes.communityChatScreenPage,
                    arguments: items.elementAt(index),
                  );
                },
                child: items[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
