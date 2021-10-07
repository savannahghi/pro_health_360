// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/community/community_list_item.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';

class CommunityListViewPage extends StatelessWidget {
  const CommunityListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder
    const String dontMissAppointmentMessage =
        'Don\'t miss your appointment tomorrow';
    const AssetImage avatarImage = AssetImage('assets/images/wellness2.jpeg');
    const String date = 'July 12 2021';

    const List<Widget> items = <Widget>[
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        isGroup: true,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        date: date,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        isGroup: true,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        date: date,
      ),
      CommunityListItem(
        title: 'My Afya Guide',
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        date: date,
      ),
      CommunityListItem(
        title: 'My Afya Guide',
        unreadNotificationCount: 4,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        date: date,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        isGroup: true,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        date: date,
      ),
      CommunityListItem(
        title: 'My Afya Guide',
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        date: date,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        isGroup: true,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        date: date,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        isGroup: true,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        date: date,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        isGroup: true,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        date: date,
      ),
      CommunityListItem(
        title: 'Ruaka Questions group',
        unreadNotificationCount: 4,
        isGroup: true,
        message: dontMissAppointmentMessage,
        avatarImage: avatarImage,
        date: date,
      ),
    ];

    return Scaffold(
      appBar: const MyAfyaHubAppBar(title: communityString),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListView.builder(
            key: communityListViewKey,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (_, int index) {
              return GestureDetector(child: items[index]);
            },
          ),
        ],
      ),
    );
  }
}
