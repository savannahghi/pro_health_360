// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/presentation/community/community_list_page.dart';
import 'package:myafyahub/presentation/engagement/home/pages/feed_page.dart';
import 'package:myafyahub/presentation/feed/pages/my_afya_hub_feed_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_diary_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_page.dart';

final List<Widget> pagesTabs = <Widget>[
  const FeedPage(),
  const MyAfyaHubFeedPage(),
  const CommunityListViewPage(),
  MyHealthPage(),
  MyHealthDiaryPage(),
];
