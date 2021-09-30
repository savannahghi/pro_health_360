import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/community/community_list_item.dart';

class CommunityListView extends StatelessWidget {
  const CommunityListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder
    const String dontMissAppointmentMessage =
        'Don\'t miss your appointment tommorow';
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
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, int index) {
            return GestureDetector(
              child: items[index],
            );
          },
        ),
      ),
    );
  }
}
